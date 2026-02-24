import logging

from fastapi import FastAPI
from sqlalchemy.orm import Session

from app.api.routes import router
from app.core.auth import get_password_hash
from app.core.config import settings
from app.core.db import Base, SessionLocal, engine
from app.core.logging import configure_logging
from app.core.middleware import RateLimitMiddleware, RequestIdMiddleware
from app.models import Role, User

configure_logging()
logger = logging.getLogger(__name__)


app = FastAPI(title=settings.app_name)
app.add_middleware(RequestIdMiddleware)
app.add_middleware(RateLimitMiddleware)
app.include_router(router)


def seed_admin_user() -> None:
    db: Session = SessionLocal()
    try:
        existing = db.query(User).filter(User.username == settings.default_admin_username).first()
        if existing:
            return

        admin = User(
            username=settings.default_admin_username,
            email=settings.default_admin_email,
            password_hash=get_password_hash(settings.default_admin_password),
            role=Role.admin,
        )
        db.add(admin)
        db.commit()
        logger.info('seeded default admin user', extra={'username': settings.default_admin_username})
    finally:
        db.close()


@app.on_event('startup')
def on_startup() -> None:
    Base.metadata.create_all(bind=engine)
    seed_admin_user()

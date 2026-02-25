from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.orm import Session

from app.core.auth import create_access_token, verify_password
from app.core.db import get_db
from app.core.security import get_current_user
from app.models import User

router = APIRouter()


@router.get('/health')
def health() -> dict[str, str]:
    return {'status': 'ok'}


@router.post('/api/v1/token')
def login(form_data: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)) -> dict[str, str]:
    user = db.query(User).filter(User.username == form_data.username).first()
    if not user or not verify_password(form_data.password, user.password_hash):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Invalid credentials')

    return {'access_token': create_access_token(user.username, user.role.value), 'token_type': 'bearer'}


@router.get('/api/v1/me')
def me(user: User = Depends(get_current_user)) -> dict[str, str]:
    return {'username': user.username, 'email': user.email, 'role': user.role.value}

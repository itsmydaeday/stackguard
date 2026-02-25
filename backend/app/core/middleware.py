import time
import uuid
from collections import defaultdict, deque

from fastapi import Request
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.responses import JSONResponse

from app.core.config import settings
from app.core.logging import request_id_ctx


class RequestIdMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        request_id = request.headers.get('x-request-id', str(uuid.uuid4()))
        request_id_ctx.set(request_id)
        request.state.request_id = request_id
        response = await call_next(request)
        response.headers['x-request-id'] = request_id
        return response


class RateLimitMiddleware(BaseHTTPMiddleware):
    def __init__(self, app):
        super().__init__(app)
        self._requests: dict[str, deque[float]] = defaultdict(deque)

    async def dispatch(self, request: Request, call_next):
        client = request.client.host if request.client else 'unknown'
        key = f'{client}:{request.url.path}'
        now = time.time()
        window = settings.rate_limit_window_seconds
        limit = settings.rate_limit_requests

        bucket = self._requests[key]
        while bucket and now - bucket[0] > window:
            bucket.popleft()

        if len(bucket) >= limit:
            return JSONResponse({'detail': 'Rate limit exceeded'}, status_code=429)

        bucket.append(now)
        return await call_next(request)

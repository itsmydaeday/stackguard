from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    app_name: str = 'StackGuard'
    environment: str = 'dev'
    secret_key: str = 'change-me-in-env'
    jwt_algorithm: str = 'HS256'
    access_token_minutes: int = 120
    database_url: str = 'sqlite:///./stackguard.db'
    localstack_endpoint: str = 'http://localstack:4566'
    aws_region: str = 'us-east-1'
    default_admin_email: str = 'admin@stackguard.local'
    default_admin_password: str = 'admin123!'
    default_admin_username: str = 'admin'
    rate_limit_requests: int = 120
    rate_limit_window_seconds: int = 60

    model_config = SettingsConfigDict(env_file='.env', env_file_encoding='utf-8', extra='ignore')


settings = Settings()

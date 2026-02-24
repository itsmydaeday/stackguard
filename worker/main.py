import logging
import os
import time

import boto3
import httpx
from apscheduler.schedulers.background import BackgroundScheduler
from pythonjsonlogger import jsonlogger

BACKEND_URL = os.getenv('BACKEND_URL', 'http://backend:8000')
LOCALSTACK_ENDPOINT = os.getenv('LOCALSTACK_ENDPOINT', 'http://localstack:4566')
AWS_REGION = os.getenv('AWS_REGION', 'us-east-1')
INTERVAL_SECONDS = int(os.getenv('WORKER_INTERVAL_SECONDS', '30'))


def configure_logging() -> None:
    handler = logging.StreamHandler()
    handler.setFormatter(jsonlogger.JsonFormatter('%(asctime)s %(levelname)s %(name)s %(message)s'))
    root = logging.getLogger()
    root.handlers = [handler]
    root.setLevel(logging.INFO)


def job() -> None:
    logger = logging.getLogger('stackguard.worker')

    try:
        response = httpx.get(f'{BACKEND_URL}/health', timeout=5)
        logger.info('backend health checked', extra={'status_code': response.status_code})
    except Exception as exc:  # noqa: BLE001
        logger.exception('backend health check failed', extra={'error': str(exc)})

    try:
        client = boto3.client(
            's3',
            region_name=AWS_REGION,
            endpoint_url=LOCALSTACK_ENDPOINT,
            aws_access_key_id='test',
            aws_secret_access_key='test',
        )
        buckets = client.list_buckets().get('Buckets', [])
        logger.info('listed s3 buckets', extra={'count': len(buckets)})
    except Exception as exc:  # noqa: BLE001
        logger.exception('localstack s3 list failed', extra={'error': str(exc)})


def main() -> None:
    configure_logging()
    scheduler = BackgroundScheduler()
    scheduler.add_job(job, 'interval', seconds=INTERVAL_SECONDS)
    scheduler.start()

    logging.getLogger('stackguard.worker').info('worker started', extra={'interval_seconds': INTERVAL_SECONDS})

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        scheduler.shutdown()


if __name__ == '__main__':
    main()

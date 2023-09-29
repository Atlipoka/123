#/bin/python3

import sentry_sdk
sentry_sdk.init(
    dsn="https://982ee6e368174190824cef8526182c2f@o4505068728483840.ingest.sentry.io/4505068741132288",
    environment="test",
    release="1.0",
    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    traces_sample_rate=1.0
)

division_by_zero = 1 / 0

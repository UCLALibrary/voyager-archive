# Voyager Archive

## Purpose

This is an application which allows staff to search for Voyager data, archived after we migrated to Alma.
It is limited to a variety of known-item searches (record ids, po numbers, invoice numbers, etc.).

## Developer Information

### Overview of environment

The development environment requires:
* git
* docker (current version recommended: 20.10.12)
* docker-compose (at least version 1.25.0; current recommended: 1.29.2)

#### PostgreSQL container

The development database is PostgreSQL 12.

#### Django container

This uses Django 4.1, which requires Python 3.8 or later; the container uses Python 3.9.
It shouldn't matter if Python 3.9 is used locally, as all code runs in the container.

The container runs via `docker_scripts/entrypoint.sh`, which
* Updates container with any new requirements, if the image hasn't been rebuilt (DEV environment only).
* Waits for the database to be completely available, which usually takes 5 seconds or less.
* Applies any pending migrations (DEV environment only).
* Creates a generic Django superuser, if one does not already exist (DEV environment only).
* Starts the Django application server.

### Setup
1. Clone the repository.

   `$ git clone git@github.com:UCLALibrary/voyager-archive.git`

2. Change directory into the project.

   `$ cd voyager-archive`

3. Build using docker-compose.

   `$ docker-compose build`

4. Bring the system up, with containers running in the background.

   `$ docker-compose up -d`

5. Logs can be viewed, if needed (`-f` to tail logs).

   ```
   $ docker-compose logs -f db
   $ docker-compose logs -f django
   ```

6. Run commands in the containers, if needed.

   ```
   $ docker-compose exec db psql -U voyager_archive
   $ docker-compose exec django bash
   # Django-aware Python shell
   $ docker-compose exec django python manage.py shell
   # Apply new migrations without a restart
   $ docker-compose exec django python manage.py migrate
   # Populate database with seed data (NOT YET......)
   $ docker-compose exec django python manage.py loaddata --app voyager_archive seed-data
   ```
7. Connect to the running application via browser

   [Application](http://127.0.0.1:8000) and [Admin](http://127.0.0.1:8000/admin)

8. Edit code locally.  All changes are immediately available in the running container, but if a restart is needed:

   `$ docker-compose restart django`

9. Shut down the system when done.

   `$ docker-compose down`

### Logging

Basic logging is available, with logs captured in `logs/application.log`.  At present, logs from both the custom application code and Django itself are captured.

Logging level is set to `INFO` via `.docker-compose_django.env`.  If there's a regular need/desire for DEBUG level, we can discuss that.

#### How to log

Logging can be used in any Python file in the project.  For example, in `views.py`:
```
# Include the module with other imports
import logging
# Instantiate a logger, generally before any functions in the file
logger = logging.getLogger(__name__)

def project_table():
    logger.info('This is a log message from project_table')

    query_results = ProjectItems.objects.all()
    for r in query_results:
        logger.info(f'{r.node_title} === {r.item_ark}')

    try:
        1/0
    except Exception as e:
        logger.exception('Example exception')

    logger.debug('This DEBUG message only appears if DJANGO_LOG_LEVEL=DEBUG')
```

#### Log format
The current log format includes:
* Level: DEBUG, INFO, WARNING, ERROR, or CRITICAL
* Timestamp via `asctime`
* Logger name: to distinguish between sources of messages (`django` vs `oral_history` application)
* Module: somewhat redundant with logger name
* Message: The main thing being logged

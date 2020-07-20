# Django Hello World App

## Building
Build the docker container:
``docker-compose build``

Running the server:
``docker-compose up -d``

Stopping the server without clearing the db: ``docker-compose down``

If you'd like to clear the database: ``docker-compose down --volumes``

## Using the app
Validating the server is running: 
* Navigate to http://localhost:8000/polls/ while the docker image is running

If you'd like to manipulate data:
* run ``docker exec -it hello_world_web python hello_world/manage.py createsuperuser``
* Navigate to http://localhost:8000/admin/
* Log in using the new credentials
* Add new Questions & Choices

## Tests
Run the following command:
``docker exec -it hello_world_web python hello_world/manage.py test polls``

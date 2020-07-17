Django Hello World App

Build the docker container:
``docker build .``

Running the server:
``docker run -it --rm -p 8000:8000 --name hello_world <image name>``

Running tests:
``docker exec -it hello_world python hello_world/manage.py test polls``

Validating the server is running: 
* Navigate to http://localhost:8000/polls/ while the docker image is running

If you'd like to manipulate data:
* run ``docker exec -it hello_world python hello_world/manage.py createsuperuser``
* Navigate to http://localhost:8000/admin/
* Log in using the new credentials
* Add new Questions & Choices
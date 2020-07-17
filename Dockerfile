FROM python:3.8
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=hello_world.settings

WORKDIR /opt

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

COPY . .


RUN python hello_world/manage.py makemigrations
RUN python hello_world/manage.py migrate

EXPOSE 8000

CMD python hello_world/manage.py runserver 0.0.0.0:8000
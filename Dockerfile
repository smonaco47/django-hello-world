FROM python:3.8
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=hello_world.settings

WORKDIR /opt
RUN apt-get update
RUN apt-get install -y netcat

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

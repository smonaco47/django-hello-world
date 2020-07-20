#!/bin/bash

# wait for DB
TRY_LOOP="10"
i=0
while ! nc -z $DJANGO_POSTGRES_HOST $DJANGO_POSTGRES_PORT >/dev/null 2>&1 < /dev/null; do
  i=`expr $i + 1`
  if [ $i -ge $TRY_LOOP ]; then
    echo "$(date) - ${DJANGO_POSTGRES_HOST}:${DJANGO_POSTGRES_PORT} still not reachable, giving up"
    exit 1
  fi
  echo "$(date) - waiting for ${DJANGO_POSTGRES_HOST}:${DJANGO_POSTGRES_PORT}... $i/$TRY_LOOP"
  sleep 5
done

# Apply database migrations
echo "Apply database migrations"
python hello_world/manage.py migrate

# Start server
echo "Starting server"
python hello_world/manage.py runserver 0.0.0.0:8000
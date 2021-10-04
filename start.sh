#!/bin/sh

pipenv shell
pipenv install

python manage.py makemigrations
python manage.py migrate
python manage.py runserver
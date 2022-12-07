#!/usr/bin/env bash
set -o errexit

echo "Installing python dependencies"
python -m pip install --upgrade pip
pip install -r requirements.txt

echo "Running database migrations"
python manage.py makemigrations
python manage.py migrate --noinput

echo "Collecting staticfiles"
python manage.py collectstatic --noinput

python manage.py shell <<EOF

from django.contrib.auth.models import User

User.objects.create_superuser(
                username = 'ssssillyssssssssang',
                email = 'blulady@gmail.com',
                password = 'funforeveryone2022!!'
)

exit()

EOF
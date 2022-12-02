#!/usr/bin/env bash
set -o errexit
python -m pip install --upgrade pip
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate

python manage.py collectstatic --noinput

python manage.py shell <<EOF

from django.contrib.auth.models import User

User.objects.create_superuser(
                username = '$SUPER_USERNAME',
                email = '$SUPER_EMAIL',
                password = '$SUPER_PASSWORD'
)

exit()

EOF
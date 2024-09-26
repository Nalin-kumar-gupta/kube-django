#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

echo "Changing to the Django project directory..."
cd services/
echo "Current directory: $(pwd)"

function migrate() {
    echo "Running database migrations..."
    python manage.py migrate
    result=$?
    if [ $result -eq 0 ]; then
        echo "Database migrations completed successfully."
    else
        echo "Database migration failed with status code: $result"
        exit 1
    fi
}

echo "Starting the migration process..."
migrate

echo "Starting Django development server..."
python manage.py runserver 0.0.0.0:8000
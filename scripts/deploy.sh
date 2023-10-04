#!/bin/bash

# Database Deployment Script

# Set your database connection details
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="your_db_user"
DB_PASS="your_db_password"
DB_NAME="your_db_name"

# Path to the directory containing migration scripts
MIGRATIONS_DIR="./db/migrations"

# Loop through migration scripts and execute them in order
for FILE in $(ls -v $MIGRATIONS_DIR/*.sql); do
  echo "Applying migration: $FILE"
  mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME < $FILE
  if [ $? -eq 0 ]; then
    echo "Migration applied successfully."
  else
    echo "Error applying migration. Rolling back..."
    ./rollback.sh
    exit 1
  fi
done

echo "Database deployment completed successfully."

#!/bin/bash

# Database Rollback Script

# Set your database connection details (same as deploy.sh)
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="your_db_user"
DB_PASS="your_db_password"
DB_NAME="your_db_name"

# Path to the directory containing migration scripts
MIGRATIONS_DIR="./db/migrations"

# Find the last applied migration
LAST_MIGRATION=$(mysql -N -s -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME -e "SELECT migration_id FROM applied_migrations ORDER BY migration_id DESC LIMIT 1")

if [ -z "$LAST_MIGRATION" ]; then
  echo "No migrations to roll back."
  exit 0
fi

# Roll back by executing the down.sql script for the last applied migration
ROLLBACK_SCRIPT="$MIGRATIONS_DIR/${LAST_MIGRATION}_down.sql"

if [ -f "$ROLLBACK_SCRIPT" ]; then
  echo "Rolling back migration: $ROLLBACK_SCRIPT"
  mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME < $ROLLBACK_SCRIPT
  if [ $? -eq 0 ]; then
    echo "Migration rolled back successfully."
  else
    echo "Error rolling back migration."
    exit 1
  fi
else
  echo "Rollback script not found for migration: $LAST_MIGRATION"
  exit 1
fi

echo "Database rollback completed successfully."

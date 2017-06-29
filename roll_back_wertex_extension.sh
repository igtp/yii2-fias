#!/usr/bin/bash

printf "\n rollback wertex migrations";
echo 'yes' | php ./yii migrate/to m170609_121344_add_call_event_status --migrationPath=@vendor/wertex/yii2-fias/console/migrations;
printf "\n migrating";
echo 'yes' | php ./yii migrate --migrationPath=@vendor/wertex/yii2-fias/console/migrations;
printf "importing fias db\n";
./scripts/import_fias_dbf.sh ./yii /home/mammosov/backups/fias_dbf;


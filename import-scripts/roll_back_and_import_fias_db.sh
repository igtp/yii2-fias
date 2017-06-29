#!/usr/bin/bash

printf "\n rollback fias migrations";
echo 'yes' | php ./yii migrate/to m170609_121344_{**migration before you applied yii2-fias migrations**} --migrationPath=@vendor/mar/yii2-fias/console/migrations;
printf "\n migrating";
echo 'yes' | php ./yii migrate --migrationPath=@vendor/mar/yii2-fias/console/migrations;
printf "importing fias db\n";
./scripts/import_fias_dbf.sh ./yii /{**path to your extracted fias dbf archive**}/fias_dbf;


#!/usr/bin/bash
printf "start ...\n";

#check script arguments
if [ "$#" -ne 2 ]; then
	printf "error:: give yii script path as first argument and directory absolute path with extracted archive as a second argument like ./import_fias_dbf.sh ./yii  /home/user/fias_extracted \n";
fi

#remove old logs if exists
if  [ -d ./logs ]; then
    rm -rf ./logs;
fi

#create new logs dir
printf "creating log dir\n";
mkdir logs;

#push new header to log file
log_file="./logs/import.log";
error_log_file="./logs/error.log";
printf "\n\n============================\n\n" >> "$log_file";
printf "starting import\n\n" >> "$log_file";

#pushing import files by one in background
for FILE in $2/*.DBF;
do
 printf "pushing $FILE ...";
 php $1 fias/import-dbf $FILE >> "$log_file" 2>> "$error_log_file" &
# php $1 fias/import-dbf $FILE | tee -a "$log_file" "$process_log_file"  &

 printf "done\n";
done;



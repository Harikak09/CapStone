#!/bin/bash

set -euo pipefail


export PATH=/usr/bin:/bin

export HOME=/home/user1



BUCKET="s3://capstone-s3-project-22-harika"

LOG_FILE="/home/user1/logs_project19/app.log"

TS=$(date +"%Y-%m-%d_%H-%M-%S")



[[ ! -s "$LOG_FILE" ]] && exit 0



/usr/bin/aws s3 cp "$LOG_FILE" "$BUCKET/project_19_cron/app-$TS.log"



: > "$LOG_FILE"

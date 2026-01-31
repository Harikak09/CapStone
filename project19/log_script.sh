#!/bin/bash

set -euo pipefail

export HOME=/home/user1

export PATH=/usr/bin:/bin



LOG_DIR="/home/user1/logs_project19"

LOG_FILE="$LOG_DIR/app.log"



mkdir -p "$LOG_DIR"



for i in {1..10}; do

  ts=$(date +"%Y-%m-%d %H:%M:%S")



  lvl=$((RANDOM % 4))

  case $lvl in

    0) level="INFO" ;;

    1) level="WARN" ;;

    2) level="ERROR" ;;

    3) level="DEBUG" ;;

  esac



  req_id=$(/usr/bin/uuidgen | cut -d'-' -f1)



  echo "$ts [$level] request_id=$req_id user_id=$((RANDOM%1000)) action=login status=$((RANDOM%2))" >> "$LOG_FILE"



  sleep 1

done



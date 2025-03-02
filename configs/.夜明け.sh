#!/bin/sh
# last_startup: YYYY-mm-dd

# TODO use sed or awk to use same file for last_statup date
echo $0
TIMESTAMP_FILE="$HOME/.last_startup"

TODAY=`date +%Y-%m-%d`

if [ -f "$TIMESTAMP_FILE" ]; then
    LAST_RUN_DATE=`cat "$TIMESTAMP_FILE"`
else
    LAST_RUN_DATE=""
fi

# Compare today's date with the last run date
if [ "$TODAY" != "$LAST_RUN_DATE" ]; then
    # Run the startup process
    #sh "$HOME/startup_process.sh"
	echo "First run of the day"

    # Update the timestamp file with today's date
    echo "$TODAY" > "$TIMESTAMP_FILE"
fi


#!/bin/bash

# This script will execute until you tell it to stop.
# Example:
# $ ./standup.sh 20 3
# will run for 20 minutes until telling you to stand up for 3 minutes. It will then tell you to get back to work.
#
# In order to not litter the notification center with these messages, be sure to:
# 1. System Preferences > Notifications > Script Editor
# 2. Allow banners
# 3. Unselect "Show in Notification Center"

workMinutes=${1:-20}
standMinutes=${2:-3}

workSleepTime=$(($workMinutes * 60))
standSleepTime=$(($standMinutes * 60))

while true; do
  sleep $workSleepTime
  /usr/bin/osascript -e "display notification \"$standMinutes minutes\" with title \"Stand up\" sound name \"Sosumi\""
  sleep $standSleepTime
  /usr/bin/osascript -e 'display notification "Get back to it." with title "K, resume" sound name "Glass"'

done
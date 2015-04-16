#!/bin/bash

function setupNTPCronJob {
    echo "add hourly cron job of ntpupdate"
    echo '#!/bin/sh' > /etc/cron.hourly/ntpdate
    echo 'ntpdate time.apple.com' >> /etc/cron.hourly/ntpdate
    chmod 755 /etc/cron.hourly/ntpdate
}

echo "setup ntp cron job"

setupNTPCronJob

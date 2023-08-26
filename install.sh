#!/bin/sh

#!/bin/bash

# Get DataDir location
DATA_DIR="/mnt/data"
case "$(ubnt-device-info firmware || true)" in
1*)
  DATA_DIR="/mnt/data"
  ;;
2*)
  DATA_DIR="/data"
  ;;
3*)
  DATA_DIR="/data"
  ;;
*)
  echo "ERROR: No persistent storage found." 1>&2
  exit 1
  ;;
esac

curl -sO https://raw.githubusercontent.com/highTowerSU/UDM-Cloudns-DDNS/main/update-cloudns-dns.sh
mkdir -p $DATA_DIR/cloudns-ddns
mv update-cloudns-dns.sh $DATA_DIR/cloudns-ddns/update-cloudns-dns.sh
chmod +x $DATA_DIR/cloudns-ddns/update-cloudns-dns.sh
test ! -f $DATA_DIR/cloudns-ddns/urls.conf && cat >$DATA_DIR/cloudns-ddns/urls.conf <<EOF
#Example: Put your URLs here:
#https://ipv4.cloudns.net/api/dynamicURL/?q=your-string-here
#https://ipv4.cloudns.net/api/dynamicURL/?q=your-string-here&notify=1
#https://ipv6.cloudns.net/api/dynamicURL/?q=your-string-here


EOF

# Define the cron job
cron_job="* * * * * $DATA_DIR/cloudns-ddns/update-cloudns-dns.sh"

# Add the cron job to the user's crontab file
echo "==> Adding cron job to crontab"
(
  crontab -l
  echo "$cron_job"
) | crontab -

echo "==> Edit configuration at $DATA_DIR/cloudns-ddns/update-cloudflare-dns.conf"
echo "==> The script will run every minute, you can change this in the crontab file"
exit 0

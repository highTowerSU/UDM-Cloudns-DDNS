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

cd $DATA_DIR/cloudns-ddns

grep -v -e "^[[:space:]]*$" urls.conf | grep -v "#" | while read -r line; do wget -q --read-timeout=0.0 --waitretry=5 --tries=400 --background "${line}"; done

exit 0

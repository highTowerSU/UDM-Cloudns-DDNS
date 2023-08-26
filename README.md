# UDM-Cloudns-DDNS

## Change Log

- 2023-08-27 - Initial Version

## What It Does

This will allow to run a cronjob to handle DDNS updates for main internet IP address.  
The container will run the background without any system permissions.

## Compatibility

- Tested on [UDM PRO][amz-udm-pro-url]

## Requirements

Persistence on Reboot is required.  
This can be accomplished with a boot script. Flow this guide: [UDM Boot Script](https://github.com/unifi-utilities/unifios-utilities/tree/main/on-boot-script)

- Cloudns DDNS URLs v4/v6

## Installation

```shell
curl -s https://raw.githubusercontent.com/highTowerSU/UDM-Cloudns-DDNS/main/install.sh | sh
```

## Configuration

Add Urls to $DATA_DIR/cloudns-ddns/urls.conf

https://ipv4.cloudns.net/api/dynamicURL/?q=your-string-here
https://ipv4.cloudns.net/api/dynamicURL/?q=your-string-here&notify=1
https://ipv6.cloudns.net/api/dynamicURL/?q=your-string-here

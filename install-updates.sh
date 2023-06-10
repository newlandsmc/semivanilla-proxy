#!/bin/bash

rsync -Ir --remove-source-files /var/minecraft/semivanilla/proxy/pending-updates/* /var/minecraft/semivanilla/proxy/plugins/
find /var/minecraft/semivanilla/proxy/pending-updates/* -depth -type d -empty -delete

exit 0

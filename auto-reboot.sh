#!/bin/bash

rconHost='69.129.212.210'
rconPort1='25576'
rconPass1='uhP2emAfauYvKLmCer8ndcsw5BnFYHtR'
rconPort2='25580'
rconPass2='uhP2emAfauYvKLmCer8ndcsw5BnFYHtR'

globalCount=0
dateFormat=$(date +"%B %d %H:%M%Z")
stateChangeTime=$(date +"%B %d %H:%M%Z" -d "$(systemctl show semivanilla-proxy.service -P StateChangeTimestamp)")
uptimeTotal=$(($(date -d "$dateFormat" +%s) - $(date -d "$stateChangeTime" +%s)))

if [[ $uptimeTotal -lt 171000 ]]
then
  exit
fi


/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort1 -p $rconPass1 'broadcast &cAuto Reboot: Server is rebooting in 5 minutes!'
/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort2 -p $rconPass2 'broadcast &cAuto Reboot: Server is rebooting in 5 minutes!'

sleep 240

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort1 -p $rconPass1 'broadcast &cAuto Reboot: Server is rebooting in 1 minute!'
/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort2 -p $rconPass2 'broadcast &cAuto Reboot: Server is rebooting in 1 minute!'

sleep 30

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort1 -p $rconPass1 'broadcast &cAuto Reboot: Server is rebooting in 30 seconds!'
/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort2 -p $rconPass2 'broadcast &cAuto Reboot: Server is rebooting in 30 seconds!'

sleep 25

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort1 -p $rconPass1 'broadcast &cAuto Reboot: Server is rebooting in 5 seconds!'
/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort2 -p $rconPass2 'broadcast &cAuto Reboot: Server is rebooting in 5 seconds!'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort1 -p $rconPass1 'broadcast &cAuto Reboot: Server is rebooting in 4 seconds!'
/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort2 -p $rconPass2 'broadcast &cAuto Reboot: Server is rebooting in 4 seconds!'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort1 -p $rconPass1 'broadcast &cAuto Reboot: Server is rebooting in 3 seconds!'
/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort2 -p $rconPass2 'broadcast &cAuto Reboot: Server is rebooting in 3 seconds!'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort1 -p $rconPass1 'broadcast &cAuto Reboot: Server is rebooting in 2 seconds!'
/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort2 -p $rconPass2 'broadcast &cAuto Reboot: Server is rebooting in 2 seconds!'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort1 -p $rconPass1 'broadcast &cAuto Reboot: Server is rebooting in 1 second!'
/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort2 -p $rconPass2 'broadcast &cAuto Reboot: Server is rebooting in 1 second!'

sleep 1    

systemctl stop semivanilla-proxy.service

systemctl restart semivanilla-survival.service
sleep 5
systemctl restart semivanilla-survival1201.service
sleep 5

systemctl start semivanilla-proxy.service

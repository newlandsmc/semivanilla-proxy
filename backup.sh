#!/bin/bash

backupDir='/backups'
currentDate=$(date +%b-%d-%Y-%H%M%Z)

# CLEANUP

# done in newlandsmc proxy backup script

# MYSQL

# done in newlandsmc proxy backup script

# SEMIVANILLA

find /var/minecraft/semivanilla/server -name "*.jar" > tempignore.txt
echo "/var/minecraft/semivanilla/server/plugins/squaremap/web/tiles/" >> tempignore.txt

for world in $(ls /var/minecraft/semivanilla/server/worlds/)
do
  tar --exclude-from=tempignore.txt --warning=no-file-changed -czpf $backupDir/semivanilla-$world-$currentDate.tar.gz /var/minecraft/semivanilla/server/worlds/$world
done

tar --exclude-from=tempignore.txt --warning=no-file-changed -czpf $backupDir/semivanilla-plugins-$currentDate.tar.gz /var/minecraft/semivanilla/server/plugins

rm -f tempignore.txt

# SURVIVAL 1.20.1

find /var/minecraft/semivanilla/survival1201 -name "*.jar" > tempignore.txt
echo "/var/minecraft/semivanilla/survival1201/plugins/squaremap/web/tiles/" >> tempignore.txt

for world in $(ls /var/minecraft/semivanilla/survival1201/worlds/)
do
  tar --exclude-from=tempignore.txt --warning=no-file-changed -czpf $backupDir/semivanilla-survival1201-$world-$currentDate.tar.gz /var/minecraft/semivanilla/survival1201/worlds/$world
done

tar --exclude-from=tempignore.txt --warning=no-file-changed -czpf $backupDir/semivanilla-survival1201-plugins-$currentDate.tar.gz /var/minecraft/semivanilla/survival1201/plugins

rm -f tempignore.txt

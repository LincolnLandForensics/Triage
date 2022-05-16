#!/bin/bash
# version 1.0.2

echo "<======== TRIAGE INFORMATION ========>" >TRIAGE__$(hostname).txt
echo "<======== TRIAGE INFORMATION ========>"

echo. >>TRIAGE__$(hostname).txt
echo "StartTime:                " $(date) >> TRIAGE__$(hostname).txt

echo "Host Name:                " $(hostname) >>TRIAGE__$(hostname).txt
echo "Host Name:                " $(hostname)

hostnamectl | grep 'Operating System' | sed 's/  Operating System: /OS Name: /g' >>TRIAGE__$(hostname).txt
hostnamectl | grep 'Operating System' | sed 's/  Operating System: /OS Name: /g'

# MAC OS
# echo "<======== sw_vers ========>" >> TRIAGE__$(hostname).txt
sw_vers >>TRIAGE__$(hostname).txt
f
# echo OS Name:              $(uname -a) >>TRIAGE__$(hostname).txt
# echo OS Name:              $(uname -a)

echo Current User:              $(whoami) >>TRIAGE__$(hostname).txt
echo Current User:              $(whoami)

echo Users:              $(users) >>TRIAGE__$(hostname).txt

echo Timezone:                 $(cat /etc/timezone) >>TRIAGE__$(hostname).txt


# echo uptime >>TRIAGE__$(hostname).txt
echo Uptime:              $(uptime) >>TRIAGE__$(hostname).txt

echo "<======== /etc/hosts ========>">> TRIAGE__$(hostname).txt
echo $(cat /etc/hosts >> TRIAGE__$(hostname).txt)


echo "<======== ifconfig ========>">> TRIAGE__$(hostname).txt
echo $(ifconfig |grep 'inet' >> TRIAGE__$(hostname).txt)

echo "<======== netstat -nat ========>" >>TRIAGE__$(hostname).txt
netstat -nat | grep "tcp"  >>TRIAGE__$(hostname).txt

echo "<======== netstat -rn ========>" >> TRIAGE__$(hostname).txt
echo $(netstat -rn >> TRIAGE__$(hostname).txt)

echo "<======== arp -a: ========>" >>TRIAGE__$(hostname).txt
arp -a >>TRIAGE__$(hostname).txt

echo "<======== lsof -i ========>" >> TRIAGE__$(hostname).txt
lsof -i >> TRIAGE__$(hostname).txt
# echo $(lsof -i) >> TRIAGE__$(hostname).txt


echo "<======== who -a ========> " >> TRIAGE__$(hostname).txt
echo $(who '-a' >> TRIAGE__$(hostname).txt)

echo "<======== w ========> " >> TRIAGE__$(hostname).txt
echo $(w >> TRIAGE__$(hostname).txt)

echo "<======== last ========>" >> TRIAGE__$(hostname).txt
last >> TRIAGE__$(hostname).txt
# echo $(last) >> TRIAGE__$(hostname).txt

echo "<======== env ========> " >> TRIAGE__$(hostname).txt
echo $(env >> TRIAGE__$(hostname).txt)

echo "<======== df -h ========> " >> TRIAGE__$(hostname).txt
df -h >> TRIAGE__$(hostname).txt


echo "<======== sudo cat ~/.ssh/authorized_keys ========> " >> TRIAGE__$(hostname).txt
sudo cat ~/.ssh/authorized_keys >> TRIAGE__$(hostname).txt

echo "<======== sudo cat ~/.ssh/known_hosts ========> " >> TRIAGE__$(hostname).txt
sudo cat ~/.ssh/known_hosts >> TRIAGE__$(hostname).txt

echo "<======== sudo cat ~/.ssh/config ========> " >> TRIAGE__$(hostname).txt
sudo cat ~/.ssh/config >> TRIAGE__$(hostname).txt


echo "<======== arp -an ========>" >> TRIAGE__$(hostname)_arp_an.txt
echo $(arp -an >> TRIAGE__$(hostname)_arp_an.txt)

echo "<======== netstat -an ========>" >> TRIAGE__$(hostname)_netstat_an.txt
echo $(netstat -an >> TRIAGE__$(hostname)_netstat_an.txt)

echo "<======== lsof ========> " > TRIAGE__$(hostname)_lsof.txt
echo $(lsof >> TRIAGE__$(hostname)_lsof.txt)

echo "<======== ps aux ========> " > TRIAGE__$(hostname)_ps_aux.txt
echo $(ps aux >> TRIAGE__$(hostname)_ps_aux.txt)

echo "<======== cat ~/.bash_history | nl ========> " > TRIAGE__$(hostname)_bash_history.txt
cat ~/.bash_history | nl >> TRIAGE__$(hostname)_bash_history.txt


# MACOS specific
echo $(diskutil ap list >> TRIAGE__$(hostname).txt)

security list-keychains >> TRIAGE__$(hostname).txt


# Linux specific
echo "<======== lsblk -io KTYPE,TYPE,SIZE,MODEL,FSTYPE,UUID,MOUNTPOINT ========> " >> TRIAGE__$(hostname).txt
$(lsblk -io KTYPE,TYPE,SIZE,MODEL,FSTYPE,UUID,MOUNTPOINT) >> TRIAGE__$(hostname).txt

echo "<======== cat /etc/passwd ========> " >> TRIAGE__$(hostname).txt
cat /etc/passwd >> TRIAGE__$(hostname).txt

echo "<======== sudo cat /etc/shadow ========> " >> TRIAGE__$(hostname).txt
sudo cat /etc/shadow >> TRIAGE__$(hostname).txt

echo "<======== sudo cat /etc/sudoers ========> " >> TRIAGE__$(hostname).txt
sudo cat /etc/sudoers >> TRIAGE__$(hostname).txt

echo "<======== cat /etc/group ========> " >> TRIAGE__$(hostname).txt
cat /etc/group >> TRIAGE__$(hostname).txt



echo "<======== lshw -class disk ========> " >> TRIAGE__$(hostname).txt
sudo lshw -class disk | sed s/'       serial: /Drive Serial Number: /g' | sed s/'       size:/Source data size:/g' | sed s/'       product:/Model:/g'>> TRIAGE__$(hostname).txt



echo "<======== Done! Files are located in your working directory. ========> "
echo "EndTime:                   " $(date) >> TRIAGE__$(hostname).txt

echo "<======== The End ========>" >> TRIAGE__$(hostname).txt

# os version

# version and serial number
# /System/Library/CoreServices/SystemVersion.plist


# <<<<<<<<<<<<<<<<<<<<<<<<<<      Copyright        >>>>>>>>>>>>>>>>>>>>>>>>>>

# Copyright (C) 2022 LincolLandForensics
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2, as published by the
# Free Software Foundation
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details (http://www.gnu.org/licenses/gpl.txt).


#!/bin/bash
#
#  =============== OS-32 & 64-bit ================
#  ♦                                             ♦
#  ♦     AUTOSCRIPT CREATED BY เฮียเบิร์ด แงะตลอด   ♦
#  ♦       -----------About Us------------       ♦ 
#  ♦            Telp : 097-026-7262              ♦
#  ♦         { VPN / SSH / OCS PANEL }           ♦ 
#  ♦        http://facebook.com/Ceolnw           ♦    
#  ♦             Line id : ceolnw                ♦
#  ♦                                             ♦
#  =============== OS-32 & 64-bit ================
#
echo "=================================="
read -p " Username to edit : " namer
read -p " formato AAAA/MM/DD : " date
chage -E $date $namer 2> /dev/null
echo -e "\033[1;36mChange the data successfully $namer Date: $date\033[0m"
echo -e "\033[1;32m "

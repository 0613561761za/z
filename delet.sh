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
read -p "ใส่ชื่อผู้ใช้ SSH & OpenVPN จะลบออก : " User

if getent passwd $User > /dev/null 2>&1; then
        userdel $User
        echo -e "User $User Was deleted."
else
        echo -e "Name $User Not Found."
fi

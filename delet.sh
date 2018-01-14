#!/bin/bash
#Script del SSH & OpenVPN
read -p "ใส่ชื่อผู้ใช้ SSH & OpenVPN จะลบออก : " User

if getent passwd $User > /dev/null 2>&1; then
        userdel $User
        echo -e "User $User Was deleted."
else
        echo -e "Name $User Not Found."
fi

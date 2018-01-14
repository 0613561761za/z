#!/bin/bash
# Script unlock dropbear, webmin, squid3, openvpn, openssh
# AUTOSCRIPT CREATED BY เฮียเบิร์ด แงะตลอด
read -p "Username : " Login
usermod -L $Login

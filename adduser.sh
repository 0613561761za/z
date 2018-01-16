#!/bin/bash
echo "-------------------------------"
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

	echo ""
	read -p "Username : " Login
	echo ""
	read -p "Password : " Passwd
	echo ""
	read -p "Expired (Day) : " TimeActive

	IP=`dig +short myip.opendns.com @resolver1.opendns.com`
	useradd -e `date -d "$TimeActive days" +"%Y-%m-%d"` -s /bin/false -M $Login
	exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
	echo -e "$Passwd\n$Passwd\n"|passwd $Login &> /dev/null

cd /etc/openvpn/
cat > /etc/openvpn/$Login.ovpn <<END
client
dev tun
proto tcp
remote $IP:1194@static.tlcdn1.com/cdn.line-apps.com/line.naver.jp/nelo2-col.linecorp.com/mdm01.cpall.co.th/lvs.truehits.in.th/dl-obs.official.line.naver.jp 1194
http-proxy $IP 8080
http-proxy-retry
connect-retry 1
connect-timeout 120
resolv-retry infinite
route-method exe
nobind
ping 5
ping-restart 30
persist-key
persist-tun
persist-remote-ip
mute-replay-warnings
verb 3
sndbuf 393216
rcvbuf 393216
push "sndbuf 393216"
push "rcvbuf 393216"
<auth-user-pass>
$Login
$Passwd
</auth-user-pass>
cipher none
comp-lzo
script-security 3
key-proxy-DNS 8.8.8.8
key-proxy-DNS 8.8.4.4
management 127.0.0.1 5555
<ca>
-----BEGIN CERTIFICATE-----
MIID4DCCA0mgAwIBAgIJAM3S4jaLTQBoMA0GCSqGSIb3DQEBBQUAMIGnMQswCQYD
VQQGEwJJRDERMA8GA1UECBMIV2VzdEphdmExDjAMBgNVBAcTBUJvZ29yMRQwEgYD
VQQKEwtKdWFsU1NILmNvbTEUMBIGA1UECxMLSnVhbFNTSC5jb20xFDASBgNVBAMT
C0p1YWxTU0guY29tMRQwEgYDVQQpEwtKdWFsU1NILmNvbTEdMBsGCSqGSIb3DQEJ
ARYObWVAanVhbHNzaC5jb20wHhcNMTMxMTA4MTQwODA3WhcNMjMxMTA2MTQwODA3
WjCBpzELMAkGA1UEBhMCSUQxETAPBgNVBAgTCFdlc3RKYXZhMQ4wDAYDVQQHEwVC
b2dvcjEUMBIGA1UEChMLSnVhbFNTSC5jb20xFDASBgNVBAsTC0p1YWxTU0guY29t
MRQwEgYDVQQDEwtKdWFsU1NILmNvbTEUMBIGA1UEKRMLSnVhbFNTSC5jb20xHTAb
BgkqhkiG9w0BCQEWDm1lQGp1YWxzc2guY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDO0s4v72Y+V1z3XpkQD8hVjYyJk1PzpaNGpubtVXf7b/2vhvYBfE3X
46NvpgQejsAI4rW7XWMZrAjFzQBPE0zDAt1O0ukvGRFvHr16jLuC3cZCn3oQJ0+v
HD7Z16sUhKqLWRTGAf1LDvNR3eVmzzRfBF8L3h+ZGaQFW9gsw1tSSwIDAQABo4IB
EDCCAQwwHQYDVR0OBBYEFA5gsoPi0yORhvAA38zCXOQhX4wYMIHcBgNVHSMEgdQw
gdGAFA5gsoPi0yORhvAA38zCXOQhX4wYoYGtpIGqMIGnMQswCQYDVQQGEwJJRDER
MA8GA1UECBMIV2VzdEphdmExDjAMBgNVBAcTBUJvZ29yMRQwEgYDVQQKEwtKdWFs
U1NILmNvbTEUMBIGA1UECxMLSnVhbFNTSC5jb20xFDASBgNVBAMTC0p1YWxTU0gu
Y29tMRQwEgYDVQQpEwtKdWFsU1NILmNvbTEdMBsGCSqGSIb3DQEJARYObWVAanVh
bHNzaC5jb22CCQDN0uI2i00AaDAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBQUA
A4GBAL3ScsXaFFuBqkS8bDqDUkx2hYM2iAYx9ZEuz8DOgtenQiNcyety4YzWSE5b
1/4JSlrO0hoFAZpz6tZtB9XM5efx5zSEIn+w4+2bWUk34Ro2zM3JxwDUp1tTcpbT
T0G3VTuVrzgSMZV1unfbCHk6XR4VT3MmmoTl+97cmmMZgWV0
-----END CERTIFICATE-----
</ca>
END

	cp $Login.ovpn /home/vps/public_html/
	cd
	if [ ! -e /usr/local/bin/payload ]; then
        wget -O /usr/local/bin/payload "https://raw.githubusercontent.com/nwqionnwkn/OPENEXTRA/master/Config/payload"
	chmod +x /usr/local/bin/payload
        fi
	clear
	cd
	echo -e ""
	echo -e "======== Account ============"
	echo -e "Download Config	: http://$IP:85/$Login.ovpn"
	echo -e "Username	: $Login"
	echo -e "Password	: $Passwd"
	echo -e "Out of Date	: $exp"
	echo -e ""
	echo -e "ไฟล์เดียวสามารถใช้ได้ทั้งเครือข่าย Truemove และ Dtac"
	echo -e "หมายเหตุ : สำหรับ Truemove ใช้ได้เฉพาะซิมแบบเติมเงินเท่านั้น"
	echo -e "หมายเหตุ : สำหรับ Dtac ต้องสมัครโปรฯ Line ถึงจะสามารถใช้งาน VPN ได้"
        echo -e ""
        echo -e "นอกจากจะสามารถใช้งานผ่านแอพฯ OpenVPN Connect ได้แล้ว..."
	echo -e "ยังสามารถใช้งานได้ทั้งแอพฯ HTTP Injector ,Ki4a ,eProxy ,KPN Tunnel"
	echo -e "และแอพฯจำพวก HTTP อีกมากมาย..."
	echo -e ""
	echo -e "หากต้องการรูปแบบข้อมูลหรือเพโหลด... ให้พิมพ์คำสั่ง payload"
	echo -e "IP         : $IP"
	echo -e "Proxy      : $IP"
	echo -e "Port Proxy : 8080"
	echo -e ""
	echo -e "หมายเหตุ : ขณะนี้ยังไม่สามารถใช้งานผ่านทางคอมพิวเตอร์ได้ กำลังทำการแก้ไข"
	echo -e "============================="
	echo -e ""

elif test $x -eq 2; then
	echo ""
	read -p "Username : " User

#! /bin/bash

echo -e "\n[?] 'internet.uludag.edu.tr' sayfasına CLI üzerinden giriş yapılmasını sağlar.\n"
# echo -e "[!] Script sonlandığında girilen kullanıcı adı, parola ve oturum süresi bilgileri log kayıtlarından temizlenir.\n"

echo -e "-------------------------------\n"

read -p "[+] Kullanıcı Adı (@uludag.edu.tr YAZMA): " USERNAME 
read -sp "[+] Parola: " PASSWD
echo -e "\n"
read -p "[+] Oturum Süresi [60]dk: " LOGIN_TIME
echo -e "\n"

curl -X POST -F "login_user=$USERNAME" -F "login_pwd=$PASSWD" -F "login_time=${LOGIN_TIME:=60}" https://internet.uludag.edu.tr/loginLogout.php

echo -e "\n\n-------------------------------\n"
echo -e "[?] Çıkış yapmak için './uu_internet_logout.sh' scriptini çalıştırabilirsin.\n"

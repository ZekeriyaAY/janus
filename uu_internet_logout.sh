#! /bin/bash

echo -e "\n[?] 'internet.uludag.edu.tr' sayfasına CLI üzerinden çıkış yapılmasını sağlar.\n"
# echo -e "[!] Script sonlandığında girilen kullanıcı adı, parola ve oturum süresi bilgileri log kayıtlarından temizlenir.\n"

echo -e "-------------------------------\n"

read -p "[+] Kullanıcı Adı (@uludag.edu.tr YAZMA): " USERNAME 
read -sp "[+] Parola: " PASSWD
echo -e "\n"

curl -X POST -F "logout_user=$USERNAME" -F "logout_pwd=$PASSWD"  https://internet.uludag.edu.tr/loginLogout.php

echo -e "\n\n-------------------------------\n"

echo -e "[?] Tekrar giriş yapmak için './uu_internet_login.sh' scriptini çalıştırabilirsin.\n"

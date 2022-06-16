#! /bin/bash
#
#	Zekeriya AY
#	zekeriya@zekeriyaay.com
#

source colors.sh

printf "${BIYellow}"
cat ./assets/janus-icon
printf "${RESET}"

printf "\t   ${BIWhite}Zekeriya AY <zekeriya@zekeriyaay.com>${RESET}\n\n"

printf "  ${BIYellow}[UYARI]${RESET} Bu tool yalnızca üniversite ağına bağlı bilgisayarlarda çalışır.\n\n"
printf "  ${BIGreen}[LOGIN${RESET}${BIRed}LOGOUT]${RESET} Login için 1,\n"
read -n 1 -p "                Logout için 0 gir: " LOGIN 

if [[ $LOGIN == '1' ]]; then
	printf "\n\n  ${BIGreen}[LOGIN]${RESET} Kullanıcı adının sonunda\n"
	read -p "          '@uludag.edu.tr' olmadan gir: " USERNAME

	printf "  ${BIGreen}[LOGIN]${RESET}"
	read -sp " Parolanı gir: " PASSWD

	printf "\n  ${BIGreen}[LOGIN]${RESET}"
	read -p " Oturum süreni dakika olarak gir: " LOGIN_TIME

	if ! [[ $LOGIN_TIME =~ ^[0-9]+$ ]]; then
        printf "\n  ${BIRed}[HATA]${RESET} Oturum süresi için rakam girilmeli!\n"
		exit 1
	fi

	printf "\n${BIYellow}\t"
	curl -X POST -F "login_user=$USERNAME" -F "login_pwd=$PASSWD" -F "login_time=${LOGIN_TIME:=60}" https://internet.uludag.edu.tr/loginLogout.php
	printf "${RESET}\n\n"
elif [[ $LOGIN == '0' ]]; then
	printf "\n\n  ${BIRed}[LOGOUT]${RESET} Kullanıcı adının sonunda\n"
    read -p "           '@uludag.edu.tr' olmadan gir: " USERNAME          

	printf "  ${BIRed}[LOGOUT]${RESET}"
    read -sp " Parolanı gir: " PASSWD 

	printf "\n\n${BIYellow}\t"
    curl -X POST -F "logout_user=$USERNAME" -F "logout_pwd=$PASSWD"  https://internet.uludag.edu.tr/loginLogout.php
	printf "${RESET}\n\n"
else
	printf "\n\n  ${BIRed}[HATA]${RESET} Geçersiz girdi girildi!\n"
fi

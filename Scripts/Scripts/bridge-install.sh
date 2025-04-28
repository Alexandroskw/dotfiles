#!/bin/bash

if [ "$EUID" -ne 0 ]; then
        echo "Ejecuta este script como sudo"
        exit 1
fi

SUDO_USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
DOWNLOAD_DIR="$SUDO_USER_HOME/Descargas"
INSTALL_DIR="/opt/quixel-bridge"

cd "$DOWNLOAD_DIR" || exit 1

# Verificar espacio en disco
FREE_SPACE=$($df -m /opt | awk 'NR==2 {print $4}')
if [ "$FREE_SPACE" -lt 5000 ]; then
        log_message "ERROR. No hay suficiente espacio"
        exit 1
fi

# Busca el archivo descargado
archivo=$(ls Bridge.AppImage 2>/dev/null)
if [ -z "$archivo" ]; then
        echo "No se encuentra el archivo de Bridge"
        exit 1
fi

mv "$archivo" "$INSTALL_DIR"
if [ $? -eq 0 ]; then
        echo "Bridge se ha instalado en $INSTALL_DIR"
else
        echo "No se ha podido mover Quixel Bridge al directorio"
        exit 1
fi

cd "$INSTALL_DIR"
chmod +x "Bridge.AppImage"

#Crea el archivo Desktop
DESKTOP_FILE="/usr/share/applications/bridge.desktop"
if [ -e "$DESKTOP_FILE" ]; then
        echo "El archivo $DESKTOP_FILE ya existe. Saltando..."
else
        cat > "$DESKTOP_FILE" << END
        [Desktop Entry]
        Name=Quixel Bridge
        GenericName=Bridge
        Comment=3D Library, assets, textures, decals
        Exec=/opt/quixel-bridge/Bridge.AppImage --no-sandbox
        Icon=/opt/quixel-bridge/bridge_icon.png
        Type=Application
        Categories=Graphics;
END
        echo "$DESKTOP_FILE creado con éxito"
fi

update-desktop-database

echo "Se ha completado la instalación de Quixel Bridge"

#!/bin/bash

if [ "$EUID" -ne 0 ]; then
        echo "Ejecuta como superusuario (sudo) este script"
        exit 1
fi

SUDO_USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
DOWNLOAD_DIR="$SUDO_USER_HOME/Descargas"
INSTALL_DIR="/opt/blender"
BACKUP_DIR="/opt/blender_bk"
LOG_FILE="/tmp/blender_install.log"

cd "$DOWNLOAD_DIR" || exit 1

echo "
__________.__                     .___             .__                 __         .__  .__                
\______   \  |   ____   ____    __| _/___________  |__| ____   _______/  |______  |  | |  |   ___________ 
 |    |  _/  | _/ __ \ /    \  / __ |/ __ \_  __ \ |  |/    \ /  ___/\   __\__  \ |  | |  | _/ __ \_  __ \
 |    |   \  |_\  ___/|   |  \/ /_/ \  ___/|  | \/ |  |   |  \\___ \  |  |  / __ \|  |_|  |_\  ___/|  | \/
 |______  /____/\___  >___|  /\____ |\___  >__|    |__|___|  /____  > |__| (____  /____/____/\___  >__|   
        \/          \/     \/      \/    \/                \/     \/            \/               \/"

log_message() {
        echo "$(date): $1" | tee -a "$LOG_FILE"
}

# Verificar espacio en disco
FREE_SPACE=$($df -m /opt | awk 'NR==2 {print $4}')
if [ "$FREE_SPACE" -lt 5000 ]; then
        log_message "ERROR. No hay suficiente espacio"
        exit 1
fi

# Busca el archivo descargado
archivo=$(ls blender-*-linux-x64.tar.xz 2>/dev/null)
if [ -z "$archivo" ]; then
        echo "No se encuentra el archivo de blender"
        exit 1
fi

# Busca la versión del archivo descargado de Blender
version=$(echo $archivo | grep -oP 'blender-\K[0-9.]+(?=-linux-x64)' 2>/dev/null)
if [ -z "$version" ]; then
        echo "No se pudo determinar la versión de Blender"
        exit 1
fi

# Crea una copia de seguridad
if [ -d "$INSTALL_DIR" ]; then
        read -p "Se encontró una antigua versión de Blender. ¿Quieres hacer una copia de seguridad? (s/n): " backup
        if [[ $backup =~ ^[Ss]$ ]]; then
                if [ -d "$BACKUP_DIR" ]; then
                        read -p "Se encontró una copia de seguridad. ¿Quieres eliminarla? (s/n): " delbackup
                        if [[ $delbackup =~ ^[Ss]$ ]]; then
                                log_message "Copia de seguridad previa eliminada"
                                rm -rf "$BACKUP_DIR"
                        else
                                log_message "Abortando. No se puede sobreescribir la copia de seguridad anterior"
                                exit 1
                        fi
                fi
                mv "$INSTALL_DIR" "$BACKUP_DIR"
                log_message "Copia de seguridad en $BACKUP_DIR"
        else
                log_message "Eliminando instalación previa"
                rm -rf "$INSTALL_DIR"
        fi
fi

# Extrae el comprimido
log_message "Extrayendo $archivo"
tar -xvf "$archivo"

# Busca la carpeta extraída
carpeta=$(ls -d blender-*-linux-x64 2>/dev/null | head -n 1)
if [ -z "$carpeta" ]; then
        echo "No se encontró la carpeta"
        exit 1
fi

# Mueve la carpeta a donde corresponde
mv "$carpeta" "$INSTALL_DIR"
if [ $? -eq 0 ]; then
        log_message "Blender instalado en $INSTALL_DIR"
else
        log_message "No se ha podido mover Blender al directorio de instalación"
        exit 1
fi

# Crea un enlace simbólico para poder ejecutar blender
if [ -L "/usr/local/bin/blender" ]; then
        echo "El enlace simbólico ya existe. Saltando"
else
        ln -s /opt/blender/blender /usr/local/bin/blender
        echo "Enlace simbólico creado"
fi

# Crea archivo desktop
DESKTOP_FILE="/usr/share/applications/blender.desktop"
if [ -e "$DESKTOP_FILE" ]; then
        log_message "El archivo $DESKTOP_FILE ya existe. Saltando"
else
        cat > "$DESKTOP_FILE" << END
        [Desktop Entry]
        Name=Blender
        GenericName=3D modeler
        Comment=3D modeling, animation, rendering and post-production
        Exec=/opt/blender/blender
        Icon=/opt/blender/blender.svg
        Terminal=false
        Type=Application
        Categories=Graphics;3DGraphics;
        MimeType=application/x-blender
END

        log_message "Archivo $DESKTOP_FILE creado con exito"
fi

# Actualiza la base de datos de aplicaciones
update-desktop-database

# Eliminar comprimido
read -p "¿Deseas eliminar el archivo comprimido? (s/n): " cleanup
if [[ $cleanup =~ ^[Ss]$ ]]; then
        rm "$archivo"
        log_message "Archivo eliminado"
fi

log_message "Instalación completa. Blender $version instalada"
echo "Registro de instalación en $LOG_FILE"

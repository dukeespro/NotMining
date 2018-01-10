# NotMining
Script Squid NotMining

nano /RUTA_SCRIPT/notmining.sh

#!/bin/bash

#
# Luis Cuellar
# Twitter @DukeeSPRO
#

### Paquetes Necesarios
# > unzip
# > git
# > wget
## Probado y testeado en Ubuntu 16.04 ###
#### CRON 23:30 Horas
# >  30 23 * * * /bin/bash /RUTA_SCRIPT/notmining.sh >/dev/null 2>&1

# Crear la Carpeta y asignar la ruta de sus servidores
SquidGuardMiningDB=/tmp/db/squidguard/mining

# Usuario Squid
user=_proxy
# Grupo Squid
group=_proxy

# Descargar las URLs @NotMININGorg
/usr/bin/wget https://github.com/jcgarciagamero/Mining/archive/master.zip -O /tmp/master.zip \
        /bin/sleep 30

# Descomprimir el archivo
/usr/bin/unzip /tmp/master.zip -d /tmp/

# Convertir las URLs a dominios legibles para SquidGuard o Squid
/bin/cat /tmp/Mining-master/README.md |/bin/sed 's/https\?:\/\///'|/bin/sed -e 's/<\/br>//g'|/bin/sed 's/\///g' > $SquidGuardMiningDB/domains

# Asignar permisos SquidGuard o Squid
/bin/chown -R $user:$group $SquidGuardMiningDB

#!/bin/sh
### BEGIN INIT INFO
# Provides:          myini
# Required-Start:
# Required-Stop:
# Default-Start:     S
# Default-Stop:
# Short-Description: Set initial config
### END INIT INFO

#Clavo el script ini
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
touch /var/lib/dpkg/status
#Carga de los repo
echo "deb http://ubuntu.uc3m.es/ubuntu/ xenial main" >> etc/apt/sources.list

#Creador script
touch /home/myini.sh
cat > /home/myini.sh <<EOF
#!/bin/bash
wget ubuntu.uc3m.es/ubuntu/project/ubuntu-archive-keyring.gpg
apt-key add ubuntu-archive-keyring.gpg
apt-get update
echo "Repositorios Actualizados!"
EOF

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
echo "nameserver 8.8.8.8" > /etc/resolv.conf
touch /var/lib/dpkg/status
#Carga de los repo
echo "deb http://ubuntu.uc3m.es/ubuntu/ xenial main" > /etc/apt/sources.list

#Creador script
touch /home/myini.sh
cat > /home/myini.sh <<EOF
#!/bin/bash
wget ubuntu.uc3m.es/ubuntu/project/ubuntu-archive-keyring.gpg
apt-key add ubuntu-archive-keyring.gpg
apt-get update
echo "Repositorios Actualizados!"
EOF

#Modificacion archivo ssh_config con SED
sed -i "s/#Port 22/Port 2094/g" /etc/ssh/sshd_config
sed -i "s/#LoginGraceTime 2m/LoginGraceTime 2m/g" /etc/ssh/sshd_config
sed -i "s/#PermitRootLogin/PermitRootLogin no" /etc/ssh/sshd_config
sed -i "s/#StrictModes yes/StrictModes yes/g" /etc/ssh/sshd_config
sed -i "s/#MaxAuthTries 6/MaxAuthTries 3/g" /etc/ssh/sshd_config
sed -i "s/#MaxSessions 10/MaxSessions 3/g" /etc/ssh/sshd_config
sed -i "s/X11Forwarding yes/X11Forwarding no/g" /etc/ssh/sshd_config

#Configuracion de IpTables
iptables -I INPUT -p tcp --dport 22 -j DROP
iptables -I INPUT -p tcp --dport 2049 -j ACCEPT

#Reiniciamos SSH
systemctl restart sshd

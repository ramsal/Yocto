# Yocto

## Configuración Básica Yocto
```
# git clone -b morty git://git.yoctoproject.org/poky.git
```
```
# source oe-init-build-env  //variables de entorno para la imagen
# bitbake core-image-minimal  //Contruimos la imagen
```
```
# runqemu qemux86   //lanzamos la imagen con Qemu
# runqemu qemux86 nographic   //alternavida solo consola

#nano ../meta/conf/bitbake.conf //editar tamaño imagen
```
```
#vi /etc/apt/sources.list
    deb http://us.archive.ubuntu.com/ubuntu/ xenial main restricted
    deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted
    deb http://us.archive.ubuntu.com/ubuntu/ xenial universe
    deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates universe

#vi /etc/resolv.conf
    nameserver 1.1.1.1
    nameserver 8.8.8.8
    nameserver 8.8.4.4

#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5

#touch /var/lib/dpkg/status
```
Añadir meta
```
bitbake-layers add-layer ../sources/meta-openembedded/meta-oe/
```

## Referencias

-[ ] Bitbake es una herramienta dentro del proyecto Yocto que permite ejecutar tareasescritas   en   Python   o   guiones   del   shell   de   forma   concurrente   y   resolviendo   lasdependencias que hay entre ellas de forma automática. 
- [ ] Poky es la herramienta que proporciona Yocto para poder generar sistemas operativosLinux propios. 

## Estructura principal de Poky
```
~/poky
├── bitbake
│   ├── AUTHORS
├── lib
├── build
│   ├── conf
│   │   ├── bblayers.conf
│   │   ├── local.conf
│   │   └── templateconf.cfg
├── meta
│   ├── conf
│   │   ├── layer.conf
│   │   ├── bitbake.conf
├── meta-nodejs
│   ├── conf
│   │   ├── layer.conf
├── meta-openembedded
│   ├── meta-filesystems
│   ├── meta-gnome  
│   ├── meta-initramfs  
│   ├── meta-multimedia  
│   ├── meta-networking  
│   ├── meta-oe  
│   ├── meta-perl  
│   ├── meta-python  
│   ├── meta-webserver  
│   ├── meta-xfce 
├── meta-poky
│   ├── conf
│   │   ├── layer.conf
├── meta-qt5
├── meta-raspberrypi
├── meta-selftest
├── meta-skeleton
├── meta-yocto-bsp
├── scripts
```

## Descripción de ficheros principales

- [ ] ~/poky/build/conf/local.conf: Fichero de configuración principal

```
MACHINE ??= "qemux86-64"
DL_DIR ?= "${TOPDIR}/downloads/"
SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
TMPDIR = "${TOPDIR}/tmp"
DISTRO ?= "poky"

PACKAGE_CLASSES ?= "package_rpm package_deb"
EXTRA_IMAGE_FEATURES = " \
    package-management \
    debug-tweaks \
    tools-debug \
    eclipse-debug \
    "
    
EXTRA_IMAGE_FEATURES ?= "debug-tweaks"

#Paquetes que se añaden a la imagen
IMAGE_INSTALL_append = " python-shell python3-pip python3 python3-fcntl tcf-agent openssh-sftp-server rpm nodejs-npm nodejs"

SDKMACHINE ?= "i686"

INHERIT += "extrausers"

#Creación de usuarios con sus credenciales
EXTRA_USERS_PARAMS = "useradd admin; \
                      usermod -p $(openssl passwd abc123) admin; \
                      usermod -p $(openssl passwd passw22) root; \
                     "
USER_CLASSES ?= "buildstats image-mklibs image-prelink"

PATCHRESOLVE = "noop"

BB_DISKMON_DIRS ??= "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    STOPTASKS,/tmp,100M,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K \
    ABORT,/tmp,10M,1K"

PACKAGECONFIG_append_pn-qemu-system-native = " sdl"

CONF_VERSION = "1"

```
- [ ] ~/poky/build/conf/bblayers.conf: Carga de los diferentes metas en la imagen
```
# POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
POKY_BBLAYERS_CONF_VERSION = "2"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /home/bee/poky/meta \
  /home/bee/poky/meta-poky \
  /home/bee/poky/meta-yocto-bsp \
  /home/bee/poky/meta-nodejs \
  /home/bee/poky/meta-openembedded \
  "
```

info: https://www.youtube.com/watch?v=6jDY2jj3DJc  HOB configurator yocto

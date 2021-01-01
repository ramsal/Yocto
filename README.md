# Yocto

## Configuración Básica Yocto
```
# git clone -b morty git://git.yoctoproject.org/poky.git
```
```
# cd poky // git clone -b morty https://github.com/openembedded/meta-openembedded.git
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
Añadir meta
```
bitbake-layers add-layer ../sources/meta-openembedded/meta-oe/
```

- [ ] Crear el fichero  ~/poky/meta/recipes-core/initscripts/initscripts-1.0/myini.sh
- [ ] En el bb ~/poky/meta/recipes-core/initscriptsinitscripts_1.0.bb registrar el nuevo fichero myini.sh

## Referencias

- [ ] Bitbake es una herramienta dentro del proyecto Yocto que permite ejecutar tareasescritas   en   Python   o   guiones   del   shell   de   forma   concurrente   y   resolviendo   lasdependencias que hay entre ellas de forma automática. 
- [ ] Poky es la herramienta que proporciona Yocto para poder generar sistemas operativosLinux propios. 
- [ ] Capas se podrían definir como un conjunto de recetas. Son utilizadas para poder hacer el proyecto más modular. Por ejemplo, puede haber una capa que permitaañadir un interfaz gráfico a la distribución, de modo que simplemente añadiendo yconfigurando dicha capa al proyecto se consigue que automáticamente disponga deese interfaz. Por defecto, al empezar a trabajar con Yocto se incluyen las capas  meta, meta-poky, meta-yocto-bsp y workspace. 

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



+ info: https://www.youtube.com/watch?v=6jDY2jj3DJc  HOB configurator yocto

- [ ] muy imporatnet elegir la misma rama de poky y de los metas
- [ ] los repositorios dan jaleo. Me funcionó esto: 
  1. pongo como unico repo "http://ubuntu.uc3m.es/ubuntu/ xenial main"
  2. me descargo la firma gpg "wget ubuntu.uc3m.es/ubuntu/project/ubuntu-archive-keyring.gpg"
  3. añado la firma a apt "apt-key add ubuntu-archive-keyring.gpg"
  4. apt-get update
  
- [ ] rsync -arv --exclude "poky/build/tmp/" poky/ basePoky/


## URLs
- [ ] https://community.nxp.com/docs/DOC-94967
- [ ] https://wiki.phytec.com/productinfo/how-to-articles/how-to-add-packages-to-your-bsp-from-an-existing-recipe
- [ ] punto de acceso y FW https://www.konsulko.com/building-a-diy-soho-router-using-the-yocto-project-build-system-openembedded-part-3/
- [ ] habilitar iptables https://forum.rocketboards.org/t/enable-iptables-module-on-linux-kernel-3-19-running-on-altera-cyclone-v-soc-boar-bsp-yocto/354
- [ ] ejecutar script al inicio https://wiki.yoctoproject.org/wiki/Cookbook:Appliance:Startup_Scripts // https://hub.mender.io/t/startup-script-for-raspberrypi3-using-yocto/201/3  
- [ ] Ver las recetas para configuraciones mas avanzadas: https://github.com/openembedded/meta-openembedded/tree/morty/meta-oe/recipes-connectivity


## Rutas de configuración
- [ ] /home/bee/var-fsl-yocto/sources/meta-fsl-bsp-release/imx/meta-sdk/recipes-fsl/images/fsl-image-gui.bb

- [ ] /home/bee/var-fsl-yocto/sources/meta-freescale/recipes-dpaa/eth-config/eth-config_git.bb

- [ ] /home/bee/var-fsl-yocto/sources/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb

- [ ] /home/bee/var-fsl-yocto/sources/meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.26.bb

- [ ] /home/bee/var-fsl-yocto/sources/meta-openembedded/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.1g.bb

- [ ] /home/bee/var-fsl-yocto/sources/meta-openembedded/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb

# meta-myrpi

meta-myrpi is a custom, personal layer to be applied over rasperrypi yocto build, using u-boot as a preference.

## Dependencies

This rpi layer depends on:

* URI: git://git.yoctoproject.org/poky
  * branch: master

* URI: git://git.openembedded.org/meta-openembedded
  * layers: meta-oe, meta-multimedia, meta-networking, meta-python
  * branch: master

* URI: git://github.com/agherzan/meta-raspberrypi (fine for u-boot)
  * layers: meta-raspberrypi
  * branch: master

* URI: git://github.com/meta-qt5/meta-qt5
  * layers: meta-qt5
  * branch: master

## How to build 

1. Download all dependencies
2. source poky/oe-init-build-env build
3. Set local.conf with all dependency layers
4. bitbake rpi-base-image
5. dd the rpi-sdimage into an sd-card

## Devices

This images were installed in a rpi zero w.

## Thanks to

Scott Ellis (https://github.com/jumpnow), his layers helped me figure out some issues I was dealing with.

## Last build with

meta                 
meta-poky            
meta-yocto-bsp       = "master:f301a3bc110608c3684c78dd62e276beea73bd94"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "master:a19aa29f7fa336cd075b72c496fe1102e6e5422b"
meta-raspberrypi     = "master:cf9971fa8bc218f9818412781e4e1bc57133779e"
meta-qt5             = "master:bc20e3dcd0176529740beb59ccf1f170b9f828a8"

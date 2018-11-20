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

## Last build with

meta                 
meta-poky            
meta-yocto-bsp       = "master:bdffa0ce10870f70e0a7ab7636ff0d797df43e3a"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "master:c26b10b155cf7873ffc8e966f95fd4abed8230c6"
meta-raspberrypi     = "master:e1ba4484c0135e12fbbd4b7bab00d9a15d5137f2"
meta-qt5             = "master:fd1f0f47312e7ee80e5ca65b8b2992cb068b1656"
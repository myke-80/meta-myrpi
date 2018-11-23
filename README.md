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
meta-yocto-bsp       = "thud:eddff2b361928e88e3628ebc22a1a0ebb119e01b"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "thud:f1511d254632a34c1deb51f4bf8b8c21e7423f51"
meta-raspberrypi     = "master:10cee099bc6f1f805367e866598af6bf44e8f1b7"
meta-qt5             = "thud:18f82a8b32afa7de52004582c44e694cb5d54d84"

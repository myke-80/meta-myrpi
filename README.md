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
meta-yocto-bsp       = "master:960ab9ef8cb861b00b02501e9d0c8f168ca34512"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "master:4517d1c695efd0b175f4e7242e1a7bb4361527d9"
meta-raspberrypi     = "master:3b6549a5e016efe63c9d1463948b9de1ee5d89ed"
meta-qt5             = "master:65c85d36407edb113b1b6d40bf7d8966a7651ea4"
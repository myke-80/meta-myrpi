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
meta-yocto-bsp       = "master:4e884c8723cf2e3e89d6ac412fb472e64e51bac1"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "master:29e280ee11c9a6f13c004ff25299668e4616f275"
meta-raspberrypi     = "master:207efc6fcfb4279b50abf82189dca31a099997c2"
meta-qt5             = "master:e60e849de1158c879bd2c150fe79b207cdac031a"
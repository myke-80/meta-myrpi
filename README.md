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
meta-yocto-bsp       = "master:6bf94ad3b6a3f1202e86b500bfce205d0bda977e"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "master:9a64b3805de82c813d89de92163129a84c2ebf97"
meta-raspberrypi     = "master:f752e9238366db7a6e134bbc00ef1f7697cb7eba"
meta-qt5             = "master:fe453ec4a26a0e8a1c7d50800b0115db7f15f0c6"

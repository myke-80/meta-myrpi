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
meta-yocto-bsp       = "master:5fef9fcd58e88f296606ae6780904345014e4d29"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "master:b56fc26fefff498b10236ea6486a5d5624f726cc"
meta-raspberrypi     = "master:e713c3f60d74fbb864122f8f11a80ca302d53da3"
meta-qt5             = "master:0263af75c053d1d7ea4882a75cf59b230fbb88ad"
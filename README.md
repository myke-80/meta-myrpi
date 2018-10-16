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
meta-yocto-bsp       = "master:b02f3bfe2fee291a9db85094e5f31b1933acf871"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "master:d7d0cc5227d0dc7d3ff91ded9da841d65c3f3632"
meta-raspberrypi     = "master:30200f75d60a6bd041410ac2cc885c1fadfac132"
meta-qt5             = "master:5832bf2747a70257eca5c443fd487532d62c90b3"
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
meta-yocto-bsp       = "master:b78597a4e038ed64b379f11257002e5a5f24886f"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "master:a06c29be2f5bc204f965ee07298c34232c5c39fc"
meta-raspberrypi     = "master:ab8a44d655386bdac50224832585266a52ccaaf8"
meta-qt5             = "master:9ffdd55c7c03d9e608409a95ed4c51ae0fb3d511"

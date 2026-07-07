# Armbian-on-B860A-S812-TVBOX 
##  Use this Build Armbian for your ZTE  ZXV10 B860A (An Amlogic S812) TVBox.
###  The ZTE ZXV10 B860A series set-top boxes are widely used in China, predominantly utilizing the Amlogic S9XXX SoC. The B860A, an early model, features the Amlogic S812 32-bit SoC, 1GB of RAM, 4GB of eMMC, 2 USB ports, 1 TF card slot, and runs on the Android 4.4.2 operating system. 
###  The objective of this project is to develop an Armbian Linux distribution that can run on the B860A. To achieve this, I have crafted several patch scripts and device tree modifications, which I have integrated into the Armbian Build process to compile the mainline Linux kernel tailored for the B860A.  
##  Build from source like
###  $./compile.sh BOARD=aml-s812-b860 RELEASE=trixie BUILD_DESKTOP=no BUILD_MINIMAL=yes KERNEL_CONFIGURE=no
###  You can also use the image I compiled to directly boot Armbian from an SD card.
#### （The file named *_with_wifi_* support wifi on board but emmc;The file named *_with_emmc_* support emmc on board but wifi.）

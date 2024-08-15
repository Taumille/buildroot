Banana Pi BPI-F3
================
https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3

Build:
======
  $ make bananapi_f3_defconfig
  $ make

Files created in output directory
=================================

output/images
.
├── bananapi-f3.dtb
├── bootinfo_sd.bin
├── boot.vfat
├── FSBL.bin
├── fw_dynamic.bin
├── fw_dynamic.elf
├── fw_dynamic.itb
├── fw_jump.bin
├── fw_jump.elf
├── Image
├── rootfs.ext2
├── rootfs.ext4 -> rootfs.ext2
├── rootfs.tar
├── sdcard.img
├── u-boot.bin
├── u-boot-env.bin
├── u-boot.itb
└── u-boot-spl.bin

Creating bootable SD card:
==========================

Simply invoke (as root)

sudo dd if=output/images/sdcard.img of=/dev/sdX && sync

Where X is your SD card device.

Booting:
========

Serial console:
---------------
The Banana Pi BPI-F3 has a 3-pin header (J25) labeled with TX, RX and GND for
UART. Baudrate for this board is 115200.

Login:
------
Enter 'root' as login user, and the prompt is ready.

Issues:
=======

The boot of the custom kernel hangs at 'spacemit_snd_sspa_pdev_probe'. In
addition there is a bug in the source code of the custom kernel in line 1246
of sound/soc/codecs/es8326.c. Hence, CONFIG_SND_SOC_SPACEMIT and further
kernel config parameters are disabled.

Furthermore, as there currently is no device tree source file specificly for
the Banana Pi BPI-F3, the dts from the mingo board is used.

Links:
======

wiki link:
----------
https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3

forum link:
-----------
https://forum.banana-pi.org/c/risc-v/85

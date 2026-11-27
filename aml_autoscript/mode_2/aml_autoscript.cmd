# aml_autoscript.cmd （适配带env保护的B860A/S812固件）
# 1. 先初始化USB（否则扫不到U盘）
usb start
# 2. 仅在内存中设置启动变量（不写入flash，不会触发保护）
setenv start_mmc_autoscript 'if fatload mmc 0 11000000 s805_autoscript; then autoscr 11000000; fi'
setenv start_usb_autoscript 'for usbdev in 0 1 2 3; do if fatload usb ${usbdev} 11000000 s805_autoscript; then autoscr 11000000; fi; done'
setenv start_emmc_autoscript 'if fatload mmc 1 11000000 emmc_autoscript; then autoscr 11000000; fi'
setenv start_autoscript 'run start_usb_autoscript; run start_mmc_autoscript'

# 3. 直接执行启动
run start_autoscript
# SD/USB都找不到系统时，回eMMC安卓
run storeboot


# aml_autoscript.cmd  (S812 / m8)
if test -n "${bootcmd_orig}"; then echo "orig already saved"; else setenv bootcmd_orig "${bootcmd}"; fi

setenv bootcmd 'run start_autoscript; run storeboot'
setenv start_autoscript 'if usb start; then run start_usb_autoscript; fi; if mmcinfo; then run start_mmc_autoscript; fi; run start_emmc_autoscript'
setenv start_mmc_autoscript 'if fatload mmc 0 11000000 s805_autoscript; then autoscr 11000000; fi'
setenv start_usb_autoscript 'for usbdev in 0 1 2 3; do if fatload usb ${usbdev} 11000000 s805_autoscript; then autoscr 11000000; fi; done'
setenv start_emmc_autoscript 'if fatload mmc 1 11000000 emmc_autoscript; then autoscr 11000000; fi'

saveenv


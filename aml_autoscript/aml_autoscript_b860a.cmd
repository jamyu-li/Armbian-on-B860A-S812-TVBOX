# ============================================
# B860A 抗造版 aml_autoscript
# 作用：修复 env + 预初始化 USB
# 不 reset，让后续 s805_autoscript 继续执行
# ============================================

# ---------- 1. 修复 LE/Alex 留下的脏 env ----------
setenv upgrade_step 0
setenv recovery 0
setenv reboot_mode normal
setenv bootfromnand 0
setenv enablesdboot 1
setenv enableusbboot 1

# 重设 bootcmd 为 S812 公版行为：先扫 SD/USB 的 autoscript，再 fallback 到 eMMC
setenv bootcmd 'if mmc dev 0; then if fatload mmc 0 11000000 aml_autoscript; then autoscr 11000000; fi; fi; if usb start; then if fatload usb 0 11000000 s805_autoscript; then autoscr 11000000; fi; if fatload usb 1 11000000 s805_autoscript; then autoscr 11000000; fi; if fatload usb 2 11000000 s805_autoscript; then autoscr 11000000; fi; if fatload usb 3 11000000 s805_autoscript; then autoscr 11000000; fi; fi; run storeboot'

# 持久化
saveenv

# ---------- 2. 预初始化 USB（关键！）----------
usb start

# ---------- 3. 结束 ----------
# 不 reset，U-Boot 会继续执行后续的 s805_autoscript
# 由于 usb start 已经执行，s805_autoscript 里的 fatload usb 现在能成功了

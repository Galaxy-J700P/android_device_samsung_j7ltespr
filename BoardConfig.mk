#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/samsung/j7ltespr

# Inherit from samsung qcom-common
include device/samsung/qcom-common/BoardConfigCommon.mk

# Qcom
TARGET_PLATFORM_DEVICE_BASE          := /devices/soc.0/
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE   := true
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true
TARGET_USES_QCOM_BSP                 := true
TARGET_USES_NEW_ION_API              := true

# Media
TARGET_QCOM_MEDIA_VARIANT             := caf

# Custom RIL class
BOARD_RIL_CLASS := ../../../device/samsung/j7ltespr/ril/

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE        := true
BOARD_CHARGER_ENABLE_SUSPEND         := true
BOARD_CHARGING_MODE_BOOTING_LPM      := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH                       := "/sys/class/leds/lcd-backlight/brightness"
CHARGING_ENABLED_PATH                := /sys/class/power_supply/battery/batt_lp_charging

# Arch
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_CORTEX_A53 := true

# Platform
TARGET_BOARD_PLATFORM           := msm8916
TARGET_BOARD_PLATFORM_GPU       := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME    := MSM8916
BOARD_USES_CYANOGEN_HARDWARE    := true

# Assert
TARGET_OTA_ASSERT_DEVICE := j7ltespr, SM-J700P, J700P

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_QCOM                   := true
BLUETOOTH_HCI_USE_MCT                       := true

# Kernel
TARGET_KERNEL_CONFIG 		   := lineageos_j7ltespr_defconfig
TARGET_KERNEL_ARCH                 := arm
BOARD_DTBTOOL_ARG                  := -2
BOARD_KERNEL_BASE                  := 0x80000000
BOARD_KERNEL_CMDLINE               := console=null androidboot.hardware=qcom msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
BOARD_RAMDISK_OFFSET               := 0x02000000
BOARD_KERNEL_TAGS_OFFSET           := 0x01e00000
BOARD_KERNEL_PAGESIZE              := 2048
BOARD_KERNEL_SEPARATED_DT          := true
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN                   := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
TARGET_KERNEL_SOURCE               := kernel/samsung/msm8929
BOARD_CUSTOM_BOOTIMG_MK            := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_IMAGE_NAME            := zImage

# Partition sizes
TARGET_USERIMAGES_USE_EXT4          := true
BOARD_BOOTIMAGE_PARTITION_SIZE      := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 3294625792
BOARD_CACHEIMAGE_PARTITION_SIZE     := 314572800
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE   := 8388608
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 11900268544
BOARD_FLASH_BLOCK_SIZE              := 131072

# Malloc
MALLOC_SVELTE                        := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_QCOM                   := true
BLUETOOTH_HCI_USE_MCT                       := true

# Display
TARGET_CONTINUOUS_SPLASH_ENABLED      := true
TARGET_USES_OVERLAY                   := true
TARGET_HARDWARE_3D                    := false
TARGET_HAVE_HDMI_OUT                  := false
USE_OPENGL_RENDERER                   := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS       := 3
MAX_EGL_CACHE_KEY_SIZE                := 12*1024
MAX_EGL_CACHE_SIZE                    := 2048*1024
OVERRIDE_RS_DRIVER                    := libRSDriver.so

# Recovery
TARGET_RECOVERY_FSTAB                := $(DEVICE_PATH)/rootdir/fstab.qcom
TARGET_USERIMAGES_USE_EXT4           := true
BOARD_HAS_LARGE_FILESYSTEM           := true
TARGET_RECOVERY_DENSITY              := hdpi
BOARD_HAS_NO_MISC_PARTITION          := true
BOARD_HAS_NO_SELECT_BUTTON           := true
BOARD_RECOVERY_SWIPE                 := true
BOARD_USE_CUSTOM_RECOVERY_FONT       := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS                  := true
TARGET_NOT_USE_GZIP_RECOVERY_RAMDISK := true

# Enable QCOM FM feature
AUDIO_FEATURE_ENABLED_FM             := true

# Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION            := true

# Power HAL
TARGET_POWERHAL_VARIANT              := qcom

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_CTRL           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# Properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Fonts
EXTENDED_FONT_FOOTPRINT              := true

# Keylayout
PRODUCT_COPY_FILES := $(filter-out frameworks/base/data/keyboards/Generic.kl:system/usr/keylayout/Generic.kl , $(PRODUCT_COPY_FILES))

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
   device/samsung/j7ltespr/sepolicy

# Vendor Init
TARGET_UNIFIED_DEVICE                := true
TARGET_INIT_VENDOR_LIB               := libinit_j7ltespr
TARGET_RECOVERY_DEVICE_MODULES       := libinit_j7ltespr

# inherit from the proprietary version
-include vendor/samsung/j7ltespr/BoardConfigVendor.mk

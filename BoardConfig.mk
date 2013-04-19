# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

BOARD_SKIP_ANDROID_DOC_BUILD := true
BOARD_VENDOR := oppo

TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_KERNEL_SOURCE := kernel/$(BOARD_VENDOR)/$(TARGET_DEVICE)
TARGET_KERNEL_CONFIG := $(TARGET_DEVICE)_defconfig
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_DIR)/include

# Disabled
USE_CAMERA_STUB := true

# Board / Kernel Setup
TARGET_ARCH := arm
#TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -DQCOM_SSR_ENABLED
#TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp -DQCOM_SSR_ENABLED
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_FPU += neon-vfpv4
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
KERNEL_HAS_GETTIMEOFDAY_HELPER := true

# Krait Optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# Audio   
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER	:= true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
TARGET_QCOM_AUDIO_VARIANT := caf

# Bootloader
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Camera
#TARGET_PROVIDES_CAMERA_HAL := true
USE_BIONIC_HEADER := true

# Flags
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_NO_SECURE_PLAYBACK

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Graphics
BOARD_EGL_CFG := device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/egl.cfg
BUILD_EMULATOR_OPENGL := false
TARGET_NO_HW_VSYNC := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
USE_OPENGL_RENDERER := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UI_LIB := librecovery_find5

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# OPPO FIND5 PARTITION LAYOUT 
#DDR -> /dev/block/mmcblk0p15
#aboot -> /dev/block/mmcblk0p17
#boot -> /dev/block/mmcblk0p18
#cache -> /dev/block/mmcblk0p22
#m9kefs1 -> /dev/block/mmcblk0p12
#m9kefs2 -> /dev/block/mmcblk0p13
#m9kefs3 -> /dev/block/mmcblk0p14
#m9kefsc -> /dev/block/mmcblk0p16
#misc -> /dev/block/mmcblk0p23
#modem -> /dev/block/mmcblk0p1
#modemst1 -> /dev/block/mmcblk0p8
#modemst2 -> /dev/block/mmcblk0p9
#oppodycnvbk -> /dev/block/mmcblk0p10
#oppostanvbk -> /dev/block/mmcblk0p11
#pad -> /dev/block/mmcblk0p7
#persist -> /dev/block/mmcblk0p21
#recovery -> /dev/block/mmcblk0p24
#reserve1 -> /dev/block/mmcblk0p25
#reserve2 -> /dev/block/mmcblk0p26
#reserve3 -> /dev/block/mmcblk0p27
#reserve4 -> /dev/block/mmcblk0p28
#rpm -> /dev/block/mmcblk0p5
#sbl1 -> /dev/block/mmcblk0p2
#sbl2 -> /dev/block/mmcblk0p3
#sbl3 -> /dev/block/mmcblk0p4
#sdcard -> /dev/block/mmcblk0p29
#system -> /dev/block/mmcblk0p19
#tz -> /dev/block/mmcblk0p6
#userdata -> /dev/block/mmcblk0p20

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 36

BOARD_WANTS_EMMC_BOOT := true
BOARD_SUPPRESS_EMMC_WIPE := true

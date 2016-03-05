#
# Copyright (C) 2015 The CyanogenMod Project
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

# Device info
BOARD_VENDOR := IUNI
U810_PATH := device/IUNI/U810

# ReleaseTools
TARGET_RELEASETOOLS_EXTENSIONS := $(U810_PATH)/releasetools

# inherit from the proprietary version
-include vendor/IUNI/U810/BoardConfigVendor.mk

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(U810_PATH)/include

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64
COMMON_GLOBAL_CPPFLAGS += -DNO_SECURE_DISCARD

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION:= true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.selinux=disabled androidboot.hardware=qcom user_debug=22 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --kernel_offset 0x00008000 --tags_offset 0x00000100
# --dt $(U810_PATH)/dtb
BOARD_CUSTOM_BOOTIMG_MK := $(U810_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_ARCH := arm
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_SOURCE := kernel/IUNI/U810
TARGET_KERNEL_CONFIG := u810_defconfig

# Prebuilt Kernel
#--TARGET_PREBUILT_KERNEL := $(U810_PATH)/kernel

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4294967296
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true

# Graphics
BOARD_EGL_CFG := $(U810_PATH)/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_ION := true
TARGET_USE_ION_COMPAT := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE:= false
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
#NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
#TARGET_DISPLAY_INSECURE_MM_HEAP := true
#TARGET_USES_OVERLAY := true
#TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := false

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Camera
#USE_CAMERA_STUB := false
USE_DEVICE_SPECIFIC_CAMERA := true
#--COMMON_GLOBAL_CFLAGS += -DOPPO_CAMERA_HARDWARE

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_POWERHAL_VARIANT := qcom

# Audio
BOARD_USES_ALSA_AUDIO := true
#--TARGET_USES_QCOM_MM_AUDIO := true
#--AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
#--AUDIO_FEATURE_ENABLED_FLUENCE := true
#--AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
#--AUDIO_FEATURE_PCM_IOCTL_ENABLED := true
#--AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
#--AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
#--AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
#--AUDIO_FEATURE_ENABLED_USBAUDIO := true
#--AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
#--BOARD_FORTEMEDIA_QDSP_ENABLED := true

# FM Radio
QCOM_FM_ENABLED := true
AUDIO_FEATURE_ENABLED_FM := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(U810_PATH)/bluetooth
QCOM_BT_USE_SMD_TTY := true
BLUETOOTH_HCI_USE_MCT := true

# WiFi
WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"

# selinux
#include device/qcom/sepolicy/sepolicy.mk

#BOARD_SEPOLICY_DIRS += \
    $(U810_PATH)/sepolicy

#BOARD_SEPOLICY_UNION += \
    device.te \
    file_contexts \
    file.te \
    init_shell.te \
    mediaserver.te \
    mm-qcamerad.te \
    qseecomd.te \
    rmt_storage.te \
    sensors.te \
    system_app.te \
    system_server.te \
    time_daemon.te \
    thermal-engine.te \
    vold.te \
    property_contexts \
    property.te

# Recovery
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := $(U810_PATH)/rootdir/fstab.qcom
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.148/leds/lcd-backlight/brightness"

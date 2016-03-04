#
# Copyright (C) 2013 The Android Open-Source Project
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

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true

TARGET_BOOTLOADER_BOARD_NAME := U810
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Kernel
#TARGET_KERNEL_SOURCE := kernel/gm/e7
#TARGET_KERNEL_CONFIG := e7_defconfig
TARGET_PREBUILT_KERNEL := device/IUNI/U810/kernel
BOARD_KERNEL_SEPARATED_DT := false
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.selinux=disabled androidboot.hardware=qcom user_debug=22 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
#BOARD_CUSTOM_BOOTIMG_MK := device/IUNI/U810/mkbootimg.mk

# Common Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64
COMMON_GLOBAL_CPPFLAGS += -DNO_SECURE_DISCARD

# global
TARGET_SPECIFIC_HEADER_PATH := device/IUNI/U810/include

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Graphics
BOARD_EGL_CFG := $(CANCRO_PATH)/graphics/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_ION := true
TARGET_USE_ION_COMPAT := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE:= false
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_OVERLAY := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Audio
BOARD_USES_ALSA_AUDIO := true
#TARGET_USES_QCOM_MM_AUDIO := true
#AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
#AUDIO_FEATURE_ENABLED_FLUENCE := true
#AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
#AUDIO_FEATURE_PCM_IOCTL_ENABLED := true
#AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
#AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
#AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
#AUDIO_FEATURE_ENABLED_USBAUDIO := true
#AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
#BOARD_FORTEMEDIA_QDSP_ENABLED := true

# Camera
#USE_CAMERA_STUB := true
USE_DEVICE_SPECIFIC_CAMERA := true
#COMMON_GLOBAL_CFLAGS += -DOPPO_CAMERA_HARDWARE

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/IUNI/U810/bluetooth

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

BOARD_EGL_CFG := device/IUNI/U810/egl.cfg

# fix this up by examining /proc/mtd on a running device
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --kernel_offset 0x00008000 --dt device/IUNI/U810/dt.img
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RECOVERY_FSTAB := device/IUNI/U810/rootdir/fstab.qcom

TARGET_RELEASETOOLS_EXTENSIONS := device/IUNI/U810

# inherit from the proprietary version
-include vendor/IUNI/U810/BoardConfigVendor.mk

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# power hal
TARGET_PROVIDES_POWERHAL := true

# selinux
#include device/qcom/sepolicy/sepolicy.mk

#BOARD_SEPOLICY_DIRS += \
    device/IUNI/U810/sepolicy

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
    
#TWRP
TW_THEME := portrait_hdpi
TARGET_USERIMAGES_USE_EXT4 := true
TW_FLASH_FROM_STORAGE := true
#TW_INCLUDE_JB_CRYPTO := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
# The real path for this is /sys/devices/mdp.0/qcom,cmdss_fb_primary.148/leds/lcd-backlight/brightness but the comma doesn't compile correctly
TW_BRIGHTNESS_PATH := "/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.148/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

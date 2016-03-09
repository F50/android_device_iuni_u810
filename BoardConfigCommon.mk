#
# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from Oppo common
-include device/oppo/common/BoardConfigCommon.mk

# inherit from Vendor
-include vendor/IUNI/U810/BoardConfigVendor.mk

BOARD_VENDOR                                                    := IUNI
U810_PATH                                                       := device/IUNI/U810

# Include path
TARGET_SPECIFIC_HEADER_PATH                                     := $(U810_PATH)/include

# Bootloader
TARGET_NO_BOOTLOADER                                            := true
TARGET_NO_RADIOIMAGE                                            := true
TARGET_BOOTLOADER_BOARD_NAME                                    := MSM8974

# Platform
TARGET_BOARD_PLATFORM                                           := msm8974
TARGET_BOARD_PLATFORM_GPU                                       := qcom-adreno330

# Architecture
TARGET_ARCH                                                     := arm
TARGET_CPU_SMP                                                  := true
TARGET_CPU_VARIANT                                              := krait
TARGET_CPU_ABI2                                                 := armeabi
TARGET_CPU_ABI                                                  := armeabi-v7a
TARGET_ARCH_VARIANT                                             := armv7-a-neon

# Kernel
BOARD_KERNEL_PAGESIZE                                           := 2048
BOARD_KERNEL_SEPARATED_DT                                       := true
BOARD_KERNEL_BASE                                               := 0x00000000
TARGET_KERNEL_SOURCE                                            := kernel/IUNI/U810
TARGET_KERNEL_CONFIG                                            := cyanogenmod_u810_defconfig
#TARGET_PREBUILT_KERNEL                                         := $(U810_PATH)/kernel
BOARD_CUSTOM_BOOTIMG_MK                                         := $(U810_PATH)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS                                            := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
#--dt $(U810_PATH)/dtb

# Flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# QCOM hardware
BOARD_USES_QCOM_HARDWARE                                        := true
TARGET_USES_QCOM_BSP                                            := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS                                := true
TARGET_QCOM_AUDIO_VARIANT                                       := caf
TARGET_QCOM_DISPLAY_VARIANT                                     := caf-new
TARGET_QCOM_MEDIA_VARIANT                                       := caf-new

# Audio
BOARD_USES_ALSA_AUDIO                                           := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP                            := true
AUDIO_FEATURE_DISABLED_FM                                       := true
#AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL                          := true

# Bluetooth
BOARD_HAVE_BLUETOOTH                                            := true
BOARD_HAVE_BLUETOOTH_QCOM                                       := true

# CM Hardware
BOARD_HARDWARE_CLASS += $(U810_PATH)/cmhw

# SELinux
BOARD_SEPOLICY_DIRS += \
   $(U810_PATH)/sepolicy

# The list below is order dependent
BOARD_SEPOLICY_UNION += \
    file.te \
    device.te \
    app.te \
    cne.te \
    qmux.te \
    mpdecision.te \
    thermald.te \
    ueventd.te \
    vold.te \
    file_contexts \
    genfs_contexts \
    te_macros

PRODUCT_BOOT_JARS                                               := $(subst $(space),:,$(PRODUCT_BOOT_JARS))

# Graphics
BOARD_EGL_CFG                                                   := $(U810_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER                                             := true
TARGET_USES_C2D_COMPOSITION                                     := true
TARGET_USES_ION                                                 := true
OVERRIDE_RS_DRIVER                                              := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE                                              := false
VSYNC_EVENT_PHASE_OFFSET_NS                                     := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS                                  := 5000000

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE                                          := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE                                              := 2048*1024

# Lights
TARGET_PROVIDES_LIBLIGHT                                        := true

# Wifi
BOARD_HAS_QCOM_WLAN                                             := true
BOARD_HAS_QCOM_WLAN_SDK                                         := true
BOARD_WLAN_DEVICE                                               := qcwcn
WPA_SUPPLICANT_VERSION                                          := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER                                     := NL80211
BOARD_HOSTAPD_DRIVER                                            := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB                                := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_PRIVATE_LIB                                       := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_STA                                         := "sta"
WIFI_DRIVER_FW_PATH_AP                                          := "ap"
TARGET_USES_WCNSS_CTRL                                          := true
TARGET_USES_QCOM_WCNSS_QMI                                      := true
TARGET_USES_WCNSS_MAC_ADDR_REV                                  := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4                                      := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE                               := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE                             := ext4
BOARD_FLASH_BLOCK_SIZE                                          := 131072

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT                                    := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT                                  := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON                                      := true
BOARD_RECOVERY_SWIPE                                            := true

# No old RPC for prop
TARGET_NO_RPC := true

# GPS HAL lives here
TARGET_GPS_HAL_PATH                                             := $(U810_PATH)/gps
TARGET_PROVIDES_GPS_LOC_API                                     := true

# Use HW crypto for ODE
TARGET_HW_DISK_ENCRYPTION                                       := true

# Enable CNE
ifneq ($(QCPATH),)
BOARD_USES_QCNE                                                 := true
endif

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED                                              := true

# Enable CPU boosting events in the power HAL
TARGET_USES_CPU_BOOST_HINT                                      := true

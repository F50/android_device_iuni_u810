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

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Prebuilt kernel
PRODUCT_COPY_FILES += $(LOCAL_PATH)/kernel:kernel

# TWRP
PRODUCT_COPY_FILES += \
    device/IUNI/U810/rootdir/init.qcom.usb.rc:recovery/root/init.usb.rc \
    device/IUNI/U810/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab 

# E7 Init files
PRODUCT_COPY_FILES += \
    device/IUNI/U810/rootdir/init.qcom.rc:root/init.qcom.rc \
    device/IUNI/U810/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/IUNI/U810/rootdir/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    device/IUNI/U810/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    device/IUNI/U810/rootdir/init.qcom.factory.sh:root/init.qcom.factory.sh \
    device/IUNI/U810/rootdir/init.qcom.sh:root/init.qcom.sh \
    device/IUNI/U810/rootdir/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
    device/IUNI/U810/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    device/IUNI/U810/rootdir/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/IUNI/U810/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/IUNI/U810/rootdir/init.target.rc:root/init.target.rc \
    device/IUNI/U810/rootdir/fstab.qcom:root/fstab.qcom \
    device/IUNI/U810/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc
    device/IUNI/U810/mount_ext4.sh:system/bin/mount_ext4.sh

# system/etc files
PRODUCT_COPY_FILES += \
    device/IUNI/U810/rootdir/etc/hsic.control.bt.sh:system/etc/hsic.control.bt.sh \
    device/IUNI/U810/rootdir/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/IUNI/U810/rootdir/etc/usf_post_boot.sh:system/etc/usf_post_boot.sh \
    device/IUNI/U810/rootdir/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/IUNI/U810/media_codecs.xml:system/etc/media_codecs.xml \
    device/IUNI/U810/media_profiles.xml:system/etc/media_profiles.xml

# Config files for touch and input
PRODUCT_COPY_FILES += \
    device/IUNI/U810/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/IUNI/U810/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    device/IUNI/U810/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

PRODUCT_COPY_FILES += \
    device/IUNI/U810/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf \

# Wifi config
PRODUCT_COPY_FILES += \
    device/IUNI/U810/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/IUNI/U810/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/IUNI/U810/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_TAGS += dalvik.gc.type-precise

DEVICE_PACKAGE_OVERLAYS := \
    device/IUNI/U810/overlay

PRODUCT_PACKAGES += \
    dhcpcd.conf \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf \
    hostapd_default.conf \
    hostapd.accept \
    hostapd.deny

# SoftAP
PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    wcnss_service

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers
    
# Media & Audio
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libdashplayer \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw \
    qcmediaplayer

PRODUCT_BOOT_JARS += qcmediaplayer

PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio_policy.msm8974 \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix \
    libtinyxml2

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    liboverlay

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# sensors
PRODUCT_COPY_FILES += \
    device/IUNI/U810/sensor/sap.conf:system/etc/sap.conf \
    device/IUNI/U810/sensor/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# MSM IPC Router security configuration
PRODUCT_COPY_FILES += \
    device/IUNI/U810/sec_config:system/etc/sec_config

PRODUCT_COPY_FILES += \
    device/IUNI/U810/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/IUNI/U810/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/IUNI/U810/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/IUNI/U810/audio/mixer_paths_auxpcm.xml:system/etc/mixer_paths_auxpcm.xml
    
# GPS configuration
PRODUCT_COPY_FILES += \
    device/IUNI/U810/gps.conf:system/etc/gps.conf

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# for off charging mode
PRODUCT_PACKAGES += \
    charger_res_images

# Properties

# bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608 \
    persist.hwc.mdpcomp.enable=true

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=0

# Ril
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    telephony.lteOnGSMDevice=1 \
    persist.radio.add_power_save=1 \
    ro.qualcomm.cabl=1 \
    hw.cabl.level=Auto \
    ril.subscription.types=NV,RUIM
    ro.use_data_netmgrd=true
    persist.data.netmgrd.qos.enable=true
    ra.data.large_tcp_window_size=true
 
 # adb secure
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.eons.enabled=false

# Cell Broadcasts
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cellbroadcast.emergencyids=0-65534

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=9

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.recordable.rgba8888=1

# qcom
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.sensors.gestures=true \
    ro.qc.sdk.camera.facialproc=false \
    ro.qc.sdk.gestures.camera=false \
    camera2.portability.force_api=1

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.audience=true \
    persist.audio.fluence.voicecall=true \
    af.resampler.quality=4 \
    audio.offload.buffer.size.kb=32 \
    audio.offload.gapless.enabled=true \
    use.voice.path.for.pcm.voip=true \
    av.offload.enable=false \
    av.streaming.offload.enable=false \
    audio.offload.pcm.16bit.enable=true \
    audio.offload.multiple.enabled=false

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so

# gps
#system prop for switching gps driver to qmi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qmienabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1 \
    ro.sf.lcd_density=480

$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

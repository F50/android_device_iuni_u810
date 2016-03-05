# Bootanimation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
TARGET_CONTINUOUS_SPLASH_ENABLED := true

# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/IUNI/U810/device_U810.mk)

PRODUCT_NAME := cm_U810
PRODUCT_DEVICE := U810
PRODUCT_BRAND := IUNI
PRODUCT_MODEL := U810
PRODUCT_MANUFACTURER := IUNI
PRODUCT_DEFAULT_LANGUAGE := zh
PRODUCT_DEFAULT_REGION := CN
PRODUCT_LOCALES := zh_CN zh_TW en_US

$(call inherit-product-if-exists, vendor/IUNI/U810/U810-vendor.mk)

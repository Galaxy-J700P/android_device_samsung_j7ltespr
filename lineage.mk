$(call inherit-product, device/samsung/j7ltespr/full_j7ltespr.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := lineage_j7ltespr
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_DEVICE := j7ltespr

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# Inherit from common
$(call inherit-product, device/samsung/j7lte-common/omni.mk)

$(call inherit-product, device/samsung/j7ltespr/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := j7ltespr
PRODUCT_NAME := omni_j7ltespr
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J700P
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone

PRODUCT_GMS_CLIENTID_BASE := android-samsung

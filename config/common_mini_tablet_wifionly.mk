# Inherit common OwnROM stuff
$(call inherit-product, vendor/ownrom/config/common_mini.mk)

# Required OwnROM packages
PRODUCT_PACKAGES += \
    LatinIME

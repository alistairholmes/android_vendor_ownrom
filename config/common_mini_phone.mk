$(call inherit-product, vendor/ownrom/config/common_mini.mk)

# Required OwnROM packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/ownrom/config/telephony.mk)

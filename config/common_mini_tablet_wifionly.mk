# Inherit common OwnROM stuff
$(call inherit-product, vendor/ownrom/config/common_mini.mk)

# Required OwnROM packages
PRODUCT_PACKAGES += \
    LatinIME

# Copy Magisk zip
PRODUCT_COPY_FILES += \
    vendor/ownrom/prebuilt/zips/magisk.zip:system/addon.d/magisk.zip

endif

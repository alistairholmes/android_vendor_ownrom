$(call inherit-product, vendor/ownrom/config/common_mini.mk)

# Required OwnROM packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/ownrom/config/telephony.mk)

# OwnROM Bootanimation
ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/ownrom/bootanimation/320.zip:system/media/bootanimation.zip
endif

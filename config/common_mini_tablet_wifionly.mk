# Inherit common OwnROM stuff
$(call inherit-product, vendor/ownrom/config/common_mini.mk)

# Include OwnROM audio files
include vendor/ownrom/config/ownrom_audio.mk

# Required OwnROM packages
PRODUCT_PACKAGES += \
    LatinIME

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/ownrom/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
endif

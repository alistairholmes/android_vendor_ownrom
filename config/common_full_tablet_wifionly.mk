# Inherit common OwnROM stuff
$(call inherit-product, vendor/ownrom/config/common_full.mk)

# Required OwnROM packages
PRODUCT_PACKAGES += \
    LatinIME

# Include OwnROM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/ownrom/overlay/dictionaries

# OwnROM Bootanimation
ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
     PRODUCT_COPY_FILES += \
         vendor/ownrom/bootanimation/800.zip:system/media/bootanimation.zip
endif

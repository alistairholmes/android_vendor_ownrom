# Inherit common OwnROM stuff
$(call inherit-product, vendor/ownrom/config/common.mk)

# Include OwnROM audio files
include vendor/ownrom/config/ownrom_audio.mk

# Include OwnROM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/ownrom/overlay/dictionaries

# Optional OwnROM packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    PhotoTable \
    SoundRecorder \
    PhotoPhase

# Extra tools in OwnROM
PRODUCT_PACKAGES += \
    vim \
    zip \
    unrar

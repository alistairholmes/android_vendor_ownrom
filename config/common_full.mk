# Inherit common OwnROM stuff
$(call inherit-product, vendor/ownrom/config/common.mk)

# Include OwnROM audio files
include vendor/ownrom/config/ownrom_audio.mk

PRODUCT_SIZE := full

# Optional OwnROM packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    PhotoTable \
    SoundRecorder \
    PhotoPhase \
    Screencast

# Extra tools in OwnROM
PRODUCT_PACKAGES += \
    7z \
    lib7z \
    bash \
    bzip2 \
    curl \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip

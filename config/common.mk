PRODUCT_BRAND ?= OwnROM

PRODUCT_BOOTANIMATION := vendor/ownrom/prebuilt/common/bootanimation/bootanimation.zip

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# OwnROM Custom Packages
PRODUCT_COPY_FILES += \
    vendor/ownrom/prebuilt/prebuilt-apps/KernelAdiutor/KernelAdiutor.apk:system/priv-app/KernelAdiutor/KernelAdiutor.apk \
    vendor/ownrom/prebuilt/prebuilt-apps/ESFileExplorer/ESFileExplorer.apk:system/priv-app/ESFileExplorer/ESFileExplorer.apk \
    vendor/ownrom/prebuilt/prebuilt-apps/NovaLauncher/NovaLauncher.apk:system/priv-app/NovaLauncher/NovaLauncher.apk \
    vendor/ownrom/prebuilt/prebuilt-apps/GoogleChrome/GoogleChrome.apk:system/priv-app/GoogleChrome/GoogleChrome.apk
	 
# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/ownrom/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/ownrom/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/ownrom/prebuilt/common/bin/50-own.sh:system/addon.d/50-own.sh \
    vendor/ownrom/prebuilt/common/bin/blacklist:system/addon.d/blacklist
endif

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/ownrom/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/ownrom/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/ownrom/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/ownrom/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# OwnROM-specific init file
PRODUCT_COPY_FILES += \
    vendor/ownrom/prebuilt/common/etc/init.local.rc:root/init.own.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/ownrom/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is OwnROM [Based off CyanogenMod]!
PRODUCT_COPY_FILES += \
    vendor/ownrom/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Theme engine
include vendor/ownrom/config/themes_common.mk

# CyanogenMod SDK
include vendor/ownrom/config/cmsdk_common.mk

# Required OwnROM packages
PRODUCT_PACKAGES += \
    Development \
    BluetoothExt \
    Profiles

# Optional OwnROM packages
PRODUCT_PACKAGES += \
    libemoji \
    Terminal

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# Custom OwnROM packages
PRODUCT_PACKAGES += \
    AudioFX \
    Eleven \
    LockClock \
    CMSettingsProvider \
    ExactCalculator \
    LiveLockScreenService \
    WeatherProvider \
    DataUsageProvider

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in OwnROM
PRODUCT_PACKAGES += \
    libsepol \
    mke2fs \
    tune2fs \
    nano \
    htop \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz

WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

DEVICE_PACKAGE_OVERLAYS += vendor/ownrom/overlay/common

OWNROM_BUILDTYPE ?= UNOFFICIAL
OWN_VERSION := v3.0
OWNROM_VERSION := OwnROM-$(OWNROM_BUILDTYPE)-$(OWN_VERSION)-$(OWNROM_BUILD)-$(shell date +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.own.version=$(OWN_VERSION) \
  ro.ownrom.version=$(OWNROM_VERSION) \
  ro.ownrom.releasetype=$(OWNROM_BUILDTYPE) \
  ro.modversion=$(OWNROM_VERSION) 

OWNROM_DISPLAY_VERSION := $(OWNROM_BUILDTYPE)-$(OWN_VERSION)-$(shell date +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.ownrom.display.version=$(OWNROM_DISPLAY_VERSION)

-include $(WORKSPACE)/build_env/image-auto-bits.mk

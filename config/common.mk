PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/gwe/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/gwe/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/gwe/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh \
    vendor/gwe/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/gwe/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/gwe/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/gwe/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/gwe/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/gwe/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/gwe/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/gwe/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# Required CM packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME

PRODUCT_PACKAGES += \
    CellBroadcastReceiver

PRODUCT_PACKAGE_OVERLAYS += vendor/gwe/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/gwe/overlay/common

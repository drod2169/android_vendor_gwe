# Inherit AOSP device configuration for passion.
$(call inherit-product, device/htc/passion/full_passion.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_passion
PRODUCT_BRAND := google
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Nexus One
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRF83 BUILD_DISPLAY_ID=FRF83 PRODUCT_NAME=passion BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2/FRF83/42295:user/release-keys
PRIVATE_BUILD_DESC="passion-user 2.2 FRF83 42295 release-keys"

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6-$(shell date +%m%d%Y)-NIGHTLY-N1
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6.0.0-N1-test0
endif

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/passion/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/cyanogen/prebuilt/passion/media/ui/Dock.ogg:system/media/ui/Dock.ogg \
    vendor/cyanogen/prebuilt/passion/media/ui/Lock.ogg:system/media/ui/Lock.ogg \
    vendor/cyanogen/prebuilt/passion/media/ui/LowBattery.ogg:system/media/ui/LowBattery.ogg \
    vendor/cyanogen/prebuilt/passion/media/ui/Undock.ogg:system/media/ui/Undock.ogg \
    vendor/cyanogen/prebuilt/passion/media/ui/Unlock.ogg:system/media/ui/Unlock.ogg 
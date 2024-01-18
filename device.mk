#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
TARGET_IS_VAB := true

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/camera_cnf.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_cnf.txt

PRODUCT_PACKAGES += \
    libpiex_shim

# Dolby Support
TARGET_USES_MIUI_DOLBY := true

# Dolby Config File
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dolby/config/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml

# Kernel
TARGET_KERNEL_DIR ?= device/xiaomi/alioth-kernel
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image

PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/AliothNFCOverlay \
    $(LOCAL_PATH)/Mi11XOverlay \
    $(LOCAL_PATH)/POCOF3Overlay \
    $(LOCAL_PATH)/RedmiK40Overlay

# Shipping API level
BOARD_API_LEVEL := 30
BOARD_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Variant Properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,odm.*.prop,$(LOCAL_PATH)/props/,$(TARGET_COPY_OUT_ODM)) \
    $(call find-copy-subdir-files,product.*.prop,$(LOCAL_PATH)/props/,$(TARGET_COPY_OUT_PRODUCT)) \
    $(call find-copy-subdir-files,system.*.prop,$(LOCAL_PATH)/props/,$(TARGET_COPY_OUT_SYSTEM)) \
    $(call find-copy-subdir-files,system_ext.*.prop,$(LOCAL_PATH)/props/,$(TARGET_COPY_OUT_SYSTEM_EXT)) \
    $(call find-copy-subdir-files,vendor.*.prop,$(LOCAL_PATH)/props/,$(TARGET_COPY_OUT_VENDOR))

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/alioth/alioth-vendor.mk)

#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

## Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.soundtrigger@2.1-impl

## Bluetooth
ifneq ($(BOARD_HAVE_BLUETOOTH),false)
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service
endif

## Boot animation
TARGET_BOOTANIMATION_HALF_RES := true

## Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \

## DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

## Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.2-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl

PRODUCT_COPY_FILES +=  \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mesondisplay.cfg:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/mesondisplay.cfg \
    $(LOCAL_PATH)/configs/mesondisplay.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mesondisplay.cfg

# Init-Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/init.amlogic.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.board.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.board.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.media.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.media.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.usb.rc \
    $(LOCAL_PATH)/init-files/init.recovery.amlogic.rc:recovery/root/init.recovery.amlogic.rc

PRODUCT_PACKAGES += \
    fstab.amlogic

## Kernel
PRODUCT_ENABLE_UFFD_GC := false

## Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0-impl

## Media firmware
PRODUCT_COPY_FILES += \
    kernel/amlogic/kernel-modules/media-pie/firmware/h264_enc.bin:$(TARGET_COPY_OUT_VENDOR)/lib/firmware/video/h264_enc.bin \
    kernel/amlogic/kernel-modules/media-pie/firmware/video_ucode.bin:$(TARGET_COPY_OUT_VENDOR)/lib/firmware/video/video_ucode.bin

## Partitions
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

## Platform
TARGET_AMLOGIC_SOC ?= gxl

## Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service \
    power.default

## Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    bootable/deprecated-ota

## Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-service \
    android.hardware.thermal@1.0-impl

## VNDK
PRODUCT_PACKAGES += \
    libprocessgroup.vendor \
    libstagefright_softomx_plugin.vendor

PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

## Inherit from the main common tree product makefile
$(call inherit-product, device/amlogic/common/amlogic.mk)

## Inherit from the common proprietary files makefile
$(call inherit-product, vendor/amlogic/gx-common/gx-common-vendor.mk)

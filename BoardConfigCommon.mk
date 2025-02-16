#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/amlogic/gx-common

# BUILD_BROKEN_*
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

## HIDL
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml

## Kernel
TARGET_KERNEL_CLANG_COMPILE := false
TARGET_KERNEL_CONFIG ?= meson64_defconfig
TARGET_KERNEL_SOURCE := kernel/amlogic/linux-4.9-pie

ifeq ($(WITH_CONSOLE),true)
BOARD_KERNEL_CMDLINE += console=ttyS0,115200 no_console_suspend ignore_loglevel
endif

## Kernel modules
TARGET_KERNEL_EXT_MODULE_ROOT := kernel/amlogic/kernel-modules
TARGET_KERNEL_EXT_MODULES += \
    mali-driver/utgard \
    media-pie

ifneq ($(TARGET_HAS_TEE),false)
TARGET_KERNEL_EXT_MODULES += \
    optee-pie
endif

TARGET_MODULE_ALIASES += \
    mali_kbase.ko:mali.ko

## Partitions
SSI_PARTITIONS := system
TREBLE_PARTITIONS := odm vendor
ALL_PARTITIONS := $(SSI_PARTITIONS) $(TREBLE_PARTITIONS)

BOARD_ODMIMAGE_PARTITION_SIZE ?= 134217728
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 1342177280
BOARD_VENDORIMAGE_PARTITION_SIZE ?= 268435456

## Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

## Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/init-files/recovery.fstab

## Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

## SELinux
SELINUX_IGNORE_NEVERALLOWS := true

## Updater
AB_OTA_UPDATER := false

## Vendor SPL
VENDOR_SECURITY_PATCH := 2019-04-05

## Include the main common tree BoardConfig makefile
include device/amlogic/common/BoardConfigAmlogic.mk

## Include the common proprietary BoardConfig makefile
include vendor/amlogic/gx-common/BoardConfigVendor.mk

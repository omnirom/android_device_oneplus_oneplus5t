# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

VENDOR_EXCEPTION_PATHS += oneplus \
    omni

PRODUCT_BUILD_RAMDISK_IMAGE := true

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p

DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus5/overlay/common
DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus5t/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/oneplus5t/device.mk)

# get the rest of aosp stuff after ours
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system_arm64.mk)

ALLOW_MISSING_DEPENDENCIES := true
PRODUCT_SHIPPING_API_LEVEL := 26

# Verity
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/bootdevice/by-name/system
$(call inherit-product, build/target/product/verity.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_oneplus5t
PRODUCT_DEVICE := oneplus5t
PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := ONEPLUS A5010

TARGET_DEVICE := OnePlus5T
PRODUCT_SYSTEM_NAME := OnePlus5T

BUILD_FINGERPRINT := OnePlus/OnePlus5T/OnePlus5T:9/PKQ1.180716.001/1905271747:user/release-keys
OMNI_BUILD_FINGERPRINT := OnePlus/OnePlus5T/OnePlus5T:9/PKQ1.180716.001/1905271747:user/release-keys
OMNI_PRIVATE_BUILD_DESC :="'OnePlus5T-user 9 PKQ1.180716.001 1905271747 release-keys'"
TARGET_VENDOR := oneplus

PLATFORM_SECURITY_PATCH_OVERRIDE := 2019-05-01

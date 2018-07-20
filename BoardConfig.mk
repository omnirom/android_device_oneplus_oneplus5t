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

BOARD_SEPOLICY_DIRS += device/oneplus/oneplus5t/sepolicy/vendor
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/oneplus/oneplus5t/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += device/oneplus/oneplus5t/sepolicy/public

include device/oneplus/oneplus5/BoardConfig.mk


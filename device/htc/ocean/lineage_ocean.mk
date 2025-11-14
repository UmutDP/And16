#
# Copyright (C) 2024 The Android Open Source Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from ocean device
$(call inherit-product, device/htc/ocean/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier
PRODUCT_NAME := lineage_ocean
PRODUCT_DEVICE := ocean
PRODUCT_BRAND := HTC
PRODUCT_MODEL := U11 Ultra
PRODUCT_MANUFACTURER := HTC

PRODUCT_GMS_CLIENTID_BASE := android-htc

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="htc_ocndugl_00531-user 8.0.0 OPR1.170623.032 1038008.3 release-keys" \
    TARGET_DEVICE=htc_ocndugl

BUILD_FINGERPRINT := htc/htc_ocndugl_00531/htc_ocndugl:8.0.0/OPR1.170623.032/1038008.3:user/release-keys

# Bootanimation
TARGET_SCREEN_HEIGHT := 2880
TARGET_SCREEN_WIDTH := 1440

# Copyright (C) 2009 The Android Open Source Project
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
# build for nanopi2 hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Launcher, Camera and Gallery
ifeq ($(BOARD_USES_LAUNCHER3),true)
PRODUCT_PACKAGES += \
	Launcher3
endif

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	MagicSmokeWallpapers \
	VisualizationWallpapers \
	librs_jni

PRODUCT_PROPERTY_OVERRIDES := \
	net.dns1=8.8.8.8 \
	net.dns2=8.8.4.4

# Get the long list of APNs
PRODUCT_COPY_FILES := \
	device/friendly-arm/nanopi2/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, device/friendly-arm/nanopi2/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_nanopi2
PRODUCT_DEVICE := nanopi2
PRODUCT_BRAND := gzmtx
PRODUCT_MODEL := NanoPi2
PRODUCT_MANUFACTURER := FriendlyARM


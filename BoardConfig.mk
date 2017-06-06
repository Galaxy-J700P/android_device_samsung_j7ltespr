#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/j7ltespr/j7ltespr

# Assert
TARGET_OTA_ASSERT_DEVICE := j7ltespr. SM-J700P, J700P

# Kernel
TARGET_KERNEL_CONFIG := lineageos_j7ltespr_defconfig

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Vendor Init
TARGET_UNIFIED_DEVICE                := true
TARGET_INIT_VENDOR_LIB               := libinit_j7ltespr
TARGET_RECOVERY_DEVICE_MODULES       := libinit_j7ltespr

# inherit from the proprietary version
-include vendor/samsung/j7ltespr/BoardConfigVendor.mk

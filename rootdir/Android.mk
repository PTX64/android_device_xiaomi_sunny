# We're still reliant on the Android.mk file as the Android.bp file doesn't
# support the copying of fstab.default to the /first_stage_ramdisk directory.
# Failure to do so results in the system booting back into the bootloader
# when utilizing a V3, TWRP-compatible boot image.

ifneq ($(INCLUDE_VENDOR_BOOT), true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.default.vendor_ramdisk
LOCAL_MODULE_STEM  := fstab.default
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.default
LOCAL_MODULE_PATH  := $(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk
include $(BUILD_PREBUILT)

endif
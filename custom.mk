# Select the used distribution:
INCLUDE_LINEAGEOS := true
INCLUDE_CRDROID := false

# Include one of 'MindTheGApps' or 'MicroG':
INCLUDE_GAPPS := false
INCLUDE_MICROG := false

# Enable ADB insecure mode (allows ADB debugging over USB):
WITH_ADB_INSECURE := true

# Debugging and optimization settings:
PRODUCT_DEBUGGABLE := true
PRODUCT_STRIP_NATIVE := false

# Enable erofs (Enhanced Read-Only File System) instead of ext4:
INCLUDE_EROFS := false

# Enable signed vendor_boot image (prevents custom kernels and recoveries):
INCLUDE_VENDOR_BOOT := false

# Disable to remove camera support:
PRODUCT_NO_CAMERA := false

# Prebuilt Images Configuration:
INCLUDE_PREBUILT_BOOTIMAGE := false

# Include custom apps and media/theme configurations:
$(call inherit-product, device/xiaomi/sunny/custom_apps.mk)
$(call inherit-product, device/xiaomi/sunny/custom_apps_system.mk)
$(call inherit-product, device/xiaomi/sunny/custom_media.mk)

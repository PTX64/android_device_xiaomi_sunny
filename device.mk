#
# Copyright (C) 2021 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/sunny/sunny-vendor.mk)

# GApps ( https://gitlab.com/MindTheGapps/vendor_gapps/ )
ifeq ($(INCLUDE_GAPPS), true)
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
endif

# Microg ( https://github.com/yaap/vendor_microg )
ifeq ($(INCLUDE_MICROG), true)
$(call inherit-product, vendor/microg/products/gms.mk)
endif

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# A/B
ifeq ($(INCLUDE_EROFS), true)
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true
else
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true
endif

PRODUCT_PACKAGES += \
  update_engine \
  update_engine_sideload \
  update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.common@2.0-util \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@4.0-impl \
    android.hardware.audio@5.0-impl \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    audio.usb.default \
    audio.r_submix.default \
    libaudioroute.vendor \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener \
    libtinycompress

# Audio XML
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    hardware/qcom-caf/sm8150/audio/configs/msmsteppe/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    hardware/qcom-caf/sm8150/audio/configs/msmsteppe/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    hardware/qcom-caf/sm8150/audio/configs/msmsteppe/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# API level, the device has been commercially launched on
PRODUCT_SHIPPING_API_LEVEL := 30

# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio-impl \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    libdng_sdk.vendor \
    libcamera2ndk_vendor \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    android.frameworks.sensorservice@1.0.vendor

PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor

PRODUCT_PACKAGES += \
    libpiex_shim \
    camxoverridesettings.txt

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

# Charger
PRODUCT_PACKAGES += \
    libsuspend

# Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# Consumer IR
PRODUCT_PACKAGES += \
    android.hardware.ir-service.example

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Dalvik VM Configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.composer@2.2-resources.vendor \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.qti.hardware.memtrack-service \
    vendor.qti.hardware.display.allocator-service

PRODUCT_PACKAGES += \
    gralloc.qcom \
    hwcomposer.qcom

PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.mapper@1.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.composer@1.0.vendor \
    vendor.qti.hardware.display.composer@2.0.vendor \
    vendor.qti.hardware.display.allocator@1.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.1.vendor

PRODUCT_PACKAGES += \
    disable_configstore

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0.vendor \
    android.hardware.drm@1.1.vendor \
    android.hardware.drm@1.2.vendor \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm-service.clearkey

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# EPPE
TARGET_DISABLE_EPPE := false

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

PRODUCT_VENDOR_PROPERTIES += \
    ro.fastbootd.available=true

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor \
    android.hardware.biometrics.fingerprint-service.xiaomi

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# FM
ifeq ($(INCLUDE_FMRADIO), true)
PRODUCT_PACKAGES += \
    FM2 \
    qcom.fmradio
endif

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss.measurement_corrections@1.1.vendor

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti

PRODUCT_PACKAGES += \
    libbatching \
    libgeofencing \
    libgnss

PRODUCT_PACKAGES += \
    apdr.conf \
    flp.conf \
    gnss_antenna_info.conf \
    gps.conf \
    izat.conf \
    lowi.conf \
    sap.conf

PRODUCT_PACKAGES += \
    gnss@2.0-base.policy \
    gnss@2.0-xtra-daemon.policy

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0.vendor \
    android.hardware.keymaster@4.1.vendor

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/sm6150-idp-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sm6150-idp-snd-card_Button_Jack.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor

# Media
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libstagefright_omx.vendor \
    libstagefright_softomx_plugin.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml

# Netd
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.0.vendor \
    android.hardware.neuralnetworks@1.1.vendor \
    android.hardware.neuralnetworks@1.2.vendor \
    android.hardware.neuralnetworks@1.3.vendor

# Network
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

# Overlay
PRODUCT_PACKAGES += \
    ApertureSunny \
    CarrierConfigSunny \
    DisableQTIAppsSunny \
    FrameworksSunny \
    SystemUISunny \
    TelephonySunny \
    WifiSunny

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfconfigstore.xml

# Platform
TARGET_EXCLUDE_QCOM_SEPOLICY := true
MSMSTEPPE := sm6150
TARGET_BOARD_PLATFORM := $(MSMSTEPPE)

TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    media \
    perf

$(call inherit-product, device/qcom/common/common.mk)
include vendor/qcom/opensource/core-utils/build/utils.mk

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti \

PRODUCT_PACKAGES += \
    android.hardware.power@1.3.vendor

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-3.9.1-vendorcompat \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

# QMI
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# Ramdisk
PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh \
    fstab.default \
    fstab.default.vendor_ramdisk \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# RIL
PRODUCT_PACKAGES += \
    libjson \
    libril \
    librilutils \
    librmnetctl

PRODUCT_PACKAGES += \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio@1.5.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.secure_element@1.0.vendor \
    android.hardware.secure_element@1.1.vendor \
    android.hardware.secure_element@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_PACKAGES += \
    libsensorndkbridge

PRODUCT_PACKAGES += \
    android.hardware.sensors-service.xiaomi-multihal

PRODUCT_PACKAGES += \
    sensors.xiaomi.v2

# Sensors configs
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Inherit several Android Go configurations.

# Speed profile services to reduce RAM and storage usage:
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
TARGET_RECOVERY_COMPILER_FILTER := speed-profile

# Use a profile based boot image for this device. Note that this is currently a
# generic profile and not Android Go optimized:
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Disabling Scudo can help with performance in certain configurations. However, Scudo is
# generally more efficient for memory allocation in production builds. Consider
# enabling it for a more stable memory layout:
PRODUCT_DISABLE_SCUDO := false

# Dedupe VNDK libraries with identical core variants:
TARGET_VNDK_USE_CORE_VARIANT := true

# Always preopt all APKs:
PRODUCT_ALWAYS_PREOPT := true

# Adjust LMK settings to ensure that background apps are killed more aggressively,
# freeing up memory:
TARGET_LMK := true

# Do not generate libartd:
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP:
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Task Profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/profiles/task_profiles_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json \
    $(LOCAL_PATH)/configs/profiles/cgroups_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json

# Telephony
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    qti_telephony_utils_prd.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

# Touchscreen
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# USB with advanced support for USB functionality, especially for modern use cases like USB-C,
# OTG support, and devices that may act as both hosts and devices.
PRODUCT_PACKAGES += \
android.hardware.usb@1.3-service.dual_role_usb

PRODUCT_PACKAGES += \
    init.qcom.usb.rc \
    init.qcom.usb.sh

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/usb/etc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

# Vibrator
$(call inherit-product, vendor/qcom/opensource/vibrator/vibrator-vendor-product.mk)

# VNDK
PRODUCT_PACKAGES += \
    libcrypto-v33 \
    libutilscallstack.vendor:64 \
    libnetutils.vendor:64 \
    libsqlite.vendor:64 \
    libprocessgroup.vendor \
    libjsoncpp.vendor \
    libcurl.vendor \
    libpng.vendor:32

# Vulkan
PRODUCT_PACKAGES += \
    libvulkan

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    ipacm \
    IPACM_cfg.xml \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml

# WiFi Display
PRODUCT_PACKAGES += \
    android.media.audio.common.types-V2-cpp \
    libavservices_minijail_32 \
    libdisplayconfig.qti \
    libdisplayconfig.system.qti \
    libnl \
    libqdMetaData \
    libqdMetaData.system

# WiFi Firmware Symlinks
PRODUCT_PACKAGES += \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

# Wlan
PRODUCT_CFI_INCLUDE_PATHS += \
    hardware/qcom-caf/wlan/qcwcn/wpa_supplicant_8_lib

# Kernel and System Settings
# ----------------------------------------------------------------------------
# Enable erofs instead of ext4 (default: false)
BUILD_WITH_EROFS := false

# Enable signed vendor_boot (default: false)
# WARNING: Custom kernels and recoveries may not work with vendor_boot enabled
BUILD_WITH_VENDOR_BOOT := false

# Enable Kprofiles (default: true)
BUILD_WITH_KPROFILES := true

# Storage and System Management
# ----------------------------------------------------------------------------
# Disable the storagemanager by default (default: false)
DEFAULT_STORAGEMANAGER_ENABLED := false

# Apps and Features to Include
# ----------------------------------------------------------------------------
# Only include Mind the GApps -or- MicroG (default: false)
BUILD_WITH_GAPPS := false
BUILD_WITH_MICROG := false

# Include all default sounds instead of a smaller collection (default: false)
INCLUDE_ALL_DEFAULT_SOUNDS := false

# Include AudioFX equalizer (default: false)
INCLUDE_AUDIOFX := false

# Include Basic Dreams (default: false)
INCLUDE_BASICDREAMS := false

# Include the bookmarkprovider (default: false)
INCLUDE_BOOKMARKPROVIDER := false

# Include the calculator (default: true)
INCLUDE_CALCULATOR := true

# Include support for Captive Portals (used in many public WiFi's) (default: true)
INCLUDE_CAPTIVEPORTAL := true

# Include support for using the device as a webcam (default: false)
INCLUDE_DEVICEASWEBCAM := false

# Include the Android Eastereggs (default: false)
INCLUDE_EASTEREGG := false

# Include the Music Player (default: true)
INCLUDE_TWELVE := true

# Include the Camelot File Manager (default: true)
INCLUDE_CAMELOT := true

# Include the calendar (default: true)
INCLUDE_ETAR := true

# Include extra themes, fonts, icons, shapes, and styles (default: false for each)
INCLUDE_EXTRA_CLOCKTHEMES := false
INCLUDE_EXTRA_FONTS := false
INCLUDE_EXTRA_ICONS := false
INCLUDE_EXTRA_ICONSHAPES := false
INCLUDE_EXTRA_NAVBARSHAPES := false
INCLUDE_EXTRA_NAVBARSTYLES := false
INCLUDE_EXTRA_QSUISTYLES := false
INCLUDE_EXTRA_SIGNALICONS := false
INCLUDE_EXTRA_WIFIICONS := false

# Include Faceunlock (default: true)
INCLUDE_FACEUNLOCK := true

# Include the FM Radio (default: false)
INCLUDE_FMRADIO := false

# Include gamespace (default: false)
INCLUDE_GAMESPACE := false

# Include the default browser (default: false)
INCLUDE_JELLY := false

# Include support for KVM (default: false)
INCLUDE_KVM := false

# Include Matlog (default: true)
INCLUDE_MATLOG := true

# Include MusicFX (default: false)
INCLUDE_MUSICFX := false

# Include Omnijaws (default: false)
INCLUDE_OMNIJAWS := false

# Include multiple printer services (default: true)
# WARNING: Disabling will prevent access to the personal bluetooth and printer settings menu
INCLUDE_PRINTSERVICES := true

# Include profiles (default: false)
INCLUDE_PROFILES := false

# Include the voice recorder (default: true)
INCLUDE_RECORDER := true

# Include screen record functionality (default: true)
INCLUDE_SCREENRECORD := true

# Include Seedvault (default: false)
INCLUDE_SEEDVAULT := false

# Include the updater app (default: true)
INCLUDE_UPDATER := true

# Include the user dictionary provider (default: false)
# WARNING: Disabling will prevent access to the personal keyboard settings menu
INCLUDE_USERDICTIONARYPROVIDER := false

# Include VPN services (default: true)
INCLUDE_VPN := true

# Aperture camera app enabled (default: false)
PRODUCT_NO_CAMERA := false

# Prebuilt Images
# ----------------------------------------------------------------------------
# Use the prebuild boot.img and dtbo.img images located in the root of this map
# WARNING: Always test if the system works properly. If not, change slots
# and restore the original boot.img to boot_a and boot_b (fastboot flash
# boot_a boot.img; fastboot flash boot_b boot.img)
PREBUILT_WITH_BOOTIMAGE := false

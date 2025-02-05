#!/bin/bash

# Prebuilt image paths:
BOOT_IMG_SRC="prebuild/boot.img"
DTBO_IMG_SRC="prebuild/dtbo.img"

# Target paths for boot image:
BOOT_IMG_DEST1="../../../out/target/product/sunny/obj/PACKAGING/target_files_intermediates/lineage_sunny-target_files/IMAGES/boot.img"
BOOT_IMG_DEST2="../../../out/target/product/sunny/boot.img"

# Target paths for DTBO image:
DTBO_IMG_DEST1="../../../out/target/product/sunny/obj/PACKAGING/target_files_intermediates/lineage_sunny-target_files/IMAGES/dtbo.img"
DTBO_IMG_DEST2="../../../out/target/product/sunny/obj/DTBO_OBJ/arch/arm64/boot/dtbo.img"
DTBO_IMG_DEST3="../../../out/target/product/sunny/dtbo.img"

# Copy prebuilt boot image to target locations:
echo -e "\nCopying boot.img to target locations...\n"
cp -af "$BOOT_IMG_SRC" "$BOOT_IMG_DEST1"
cp -af "$BOOT_IMG_SRC" "$BOOT_IMG_DEST2"

# Copy prebuilt DTBO image to target locations:
echo -e "\nCopying dtbo.img to target locations...\n"
cp -af "$DTBO_IMG_SRC" "$DTBO_IMG_DEST1"
cp -af "$DTBO_IMG_SRC" "$DTBO_IMG_DEST2"
cp -af "$DTBO_IMG_SRC" "$DTBO_IMG_DEST3"

echo -e "\nScript completed successfully.\n"

#!/bin/bash
# Fomenko A V  2025 (c)

cp -vf photosort deb/photo_sort/usr/bin/photosort

chmod +x deb/photo_sort/usr/bin/photosort

echo "Previous $(cat deb/photo_sort/DEBIAN/control | grep '^Version:')"
echo "Enter new version (x.x-x.x):"
read VERSION

rm -rfv deb/photo_sort/DEBIAN/control 

CONTROL_FILE="Package: photosort
Version: $VERSION
Section: graphics
Architecture: all
Priority: optional
Depends: python3, python3-pip, python3-exifread
Maintainer: Alex <alexfomg@gmail.com>
Description: Programm for sorting shots by creation date
Installed-Size: $(du -sb deb/photo_sort | grep -o '^[0-9]*')" 

echo "$CONTROL_FILE" > deb/photo_sort/DEBIAN/control 

cd deb/
./make_deb.sh 

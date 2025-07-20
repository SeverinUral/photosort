#!/bin/bash
# Fomenko A V  2025 (c)
mkdir -pv deb/photo_sort/{DEBIAN/,usr/bin/}

cp -vf photosort deb/photo_sort/usr/bin/photosort
chmod +x deb/photo_sort/usr/bin/photosort

echo "Previous version $(ls *.deb | grep -o '[0-9]*.[0-9]*-[0-9]*.[0-9]*')"
read -p "Enter Version (x.x-x.x): " VERSION

rm -rfv *.deb

CONTROL_FILE="Package: photosort
Version: $VERSION
Section: graphics
Architecture: all
Priority: optional
Depends: python3, python3-pip, python3-exifread, python3-pymediainfo
Maintainer: Alex <alexfomg@gmail.com>
Description: Programm for sorting shots by creation date
Installed-Size: $(du -sb deb/photo_sort | grep -o '^[0-9]*')" 

echo "$CONTROL_FILE" > deb/photo_sort/DEBIAN/control 

cd deb/

fakeroot dpkg-deb --build photo_sort .

mv *.deb ..

cd ..

rm -rf deb

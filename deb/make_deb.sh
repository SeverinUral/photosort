#!/bin/bash
# Fomenko A V (c)

#version="1.0-1"

fakeroot dpkg-deb --build photo_sort .
 
#mv photo_sort.deb "photo_sort_${version}_all.deb"

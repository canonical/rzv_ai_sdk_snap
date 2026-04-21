#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: rzv-ai-sdk-collection.object-counter <COCO|animal|vehicle> <USB|MIPI>"
    exit 1
fi

cd $SNAP/usr/q08/bin && exec \
`LD_LIBRARY_PATH=$SNAP/usr/lib:$SNAP/usr/lib/aarch64-linux-gnu/:$SNAP/usr/lib/aarch64-linux-gnu/lapack:\
$SNAP/usr/lib/aarch64-linux-gnu/blas:$SNAP/usr/lib/aarch64-linux-gnu/pulseaudio \
XDG_RUNTIME_DIR=/run/user/1000 \
WAYLAND_DISPLAY=wayland-0 \
QT_QPA_PLATFORM=wayland-egl \
QT_QPA_PLATFORM_PLUGIN_PATH=$SNAP/usr/lib/aarch64-linux-gnu/qt5/plugins \
XKB_CONFIG_ROOT=$SNAP/usr/share/X11/xkb \
__EGL_VENDOR_LIBRARY_DIRS=$SNAP/usr/share/glvnd/egl_vendor.d \
./object_counter "$@"`

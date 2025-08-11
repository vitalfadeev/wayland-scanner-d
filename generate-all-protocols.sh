#!/bin/sh

DEST=protocol

[ -d $DEST ] || mkdir $DEST

./wayland-scanner-d /usr/share/wayland/wayland.xml > $DEST/wayland.d

for NAME in wayland-protocols/stable/*/*
do
  ./wayland-scanner-d $NAME > $DEST/`basename $NAME | cut -f 1 -d '.' | tr - _`.d
done


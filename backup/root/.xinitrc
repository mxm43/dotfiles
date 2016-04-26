#!/usr/bin/env bash

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

#export XDG_MENU_PREFIX=gnome-
#exec gnome-session

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

#required by awesome
#open screensaver
#exec gnome-screensaver &
#open your theme, otherwise it's ugly
#exec /usr/libexec/gnome-settings-daemon &    
#open power manager
exec xfce4-power-manager &      
#open net work manager
#exec /usr/bin/nm-applet &           
#open auto update
#exec update-notifier &

volumeicon &
exec ck-launch-session dbus-launch awesome

#!/usr/bin/env bash

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

compton --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc --unredir-if-possible -b

#export XDG_MENU_PREFIX=gnome-
#exec gnome-session

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx &

#required by awesome
#open screensaver
#exec gnome-screensaver &
#open your theme, otherwise it's ugly
#exec /usr/libexec/gnome-settings-daemon &    
#open power manager
xfce4-power-manager &      
#open net work manager
nm-applet &           
#open auto update
#exec update-notifier &

#exec ck-launch-session dbus-launch awesome
#exec startxfce4

# set $XDG_MENU_PREFIX to "xfce-" so that "xfce-applications.menu" is picked
# over "applications.menu" in all Xfce applications.
if test "x$XDG_MENU_PREFIX" = "x"; then
  XDG_MENU_PREFIX="xfce-"
  export XDG_MENU_PREFIX
fi

# merge in X cursor settings
test -r "$BASEDIR/Xcursor.xrdb" && XRESOURCES="$XRESOURCES $BASEDIR/Xcursor.xrdb"

# ~/.Xresources contains overrides to the above
test -r "$HOME/.Xresources" && XRESOURCES="$XRESOURCES $HOME/.Xresources"

# load all X resources (adds /dev/null to avoid an empty list that would hang the process)
cat /dev/null $XRESOURCES | xrdb -nocpp -merge -

# Use dbus-launch if installed.
if test x"$DBUS_SESSION_BUS_ADDRESS" = x""; then
  if which dbus-launch >/dev/null 2>&1; then
    eval `dbus-launch --sh-syntax --exit-with-session`
    # some older versions of dbus don't export the var properly
    export DBUS_SESSION_BUS_ADDRESS
  else
    echo "Could not find dbus-launch; Xfce will not work properly" >&2
    fi
fi

xfsettingsd &
xsetroot -bg white -fg red  -solid black

exec ck-launch-session dbus-launch awesome

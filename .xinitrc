#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#[[-f ~/.Xresources ]] && xrdb -merge ~/.Xresources

sudo rfkill unblock wlan
sudo systemctl start postgresql.service
setxkbmap -option ctrl:nocaps
touchegg &
xset -dpms
xset s off
exec i3

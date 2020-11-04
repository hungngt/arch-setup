
#!/bin/bash

# small power menu using rofi, i3, systemd and pm-utils
# (last 3 dependencies are adjustable below)
# tostiheld, 2016

lock_command="betterlockscreen -l dim & sleep 10 && xset dpms force off"
poweroff_command="systemctl poweroff"
reboot_command="systemctl reboot"
logout_command="bspc quit"
#hibernate_command="systemctl hibernate"
suspend_command="systemctl suspend"

# you can customise the rofi command all you want ...
rofi_command="rofi -sort false -width 13 -hide-scrollbar true -lines 5"

options=$'poweroff\nreboot\nlock\nlogout\nsuspend' 

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
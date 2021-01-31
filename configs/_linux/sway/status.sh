#!/bin/bash

function print_status {

    # The Sway configuration file in ~/.config/sway/config calls this script.
    # You should see changes to the status bar after saving this script.
    # If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

    # Produces "21 days", for example
    #uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

    # The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
    # like 2018-10-06 and the time (e.g., 14:01). Check `man date` (%p for AM/PM)
    date_formatted=$(date "+%a %F | %H:%M:%S ")

    # symbolize the time of day (morning, midday, evening, night)
    h=$(date "+%H")
    if (($h>=22 || $h<=5)); then
        time_of_day_symbol='夜'
    elif (($h>=17)); then
        time_of_day_symbol='夕'
    elif (($h>=11)); then
        time_of_day_symbol='昼'
    else
        time_of_day_symbol='朝'
    fi

    # Get the Linux version but remove the "-1-ARCH" part
    #linux_version=$(uname -r | cut -d '-' -f1)

    # Get Batteries Status and AC power
    powerAC=$(< /sys/class/power_supply/AC/online)
    if ((powerAC==1)); then
        powerAC_info='<span color="yellow">🗲</span>'
    else
        powerAC_info='🗲'
    fi
    batt0_info=$(< /sys/class/power_supply/BAT0/capacity )
    batt1_info=$(< /sys/class/power_supply/BAT1/capacity )
    battery_info="$batt1_info%/$batt0_info%"

    # Get volume and mute status with PulseAudio
    volume=$(pactl list sinks | grep Volume | head -n1 | awk '{print $5}')
    audio_info="VOLUME: $volume 🕩"

    # To get signal strength, use iw wlp2s0 link
    # This is empty if we are not connected via WiFi
    #ssid=$(iw wlp2s0 info | grep -Po '(?<=ssid ).*')
    #default_gateway=$(ip route show default | awk '{print $3}' | uniq)
    #private_ip=$(hostname -i)
    interface=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
    # interface_easyname grabs the "old" interface name before systemd renamed it
    #interface_easyname=$(dmesg | grep $network | grep renamed | awk 'NF>1{print $NF}')
    net_stat=$(ip -br link | grep $interface | awk '{print $2}')

    if [ -z "$net_stat" ]; then
      net_stat='DOWN'
    fi
    network_info=" $interface $net_stat"

    # JAPANESE CHAR
    jp_test="あいうえおかき   アイウエオカキ    "

     echo " ⇋ $network_info ⎮ $audio_info ⎮ $powerAC_info BATT: $battery_info ⎮ $time_of_day_symbol ⎮ $date_formatted"
}

# The argument to `sleep` is in seconds
while true; do print_status; sleep 1; done

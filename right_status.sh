#!/bin/bash

# apt install acpi
# si no funciona corregir ubicacion /sys/class/power_suply ACAD y BAT1
function battery_meter() {

  if [ "$(which acpi)" ]; then

    local fgdefault='#[default]'

    if [ "$(cat /sys/class/power_supply/ACAD/online)" == 1 ] ; then
      local charging='+'
    else
      local charging='-'
    fi
    # Check for existence of a battery.
    if [ -x /sys/class/power_supply/BAT1 ] ; then
      local batt0=$(acpi -b 2> /dev/null | awk '/Battery 0/{print $4}' | cut -d, -f1)

      case $batt0 in
        100%|9[0-9]%|8[0-9]%|7[5-9]%) fgcolor='#[fg=brightgrey]'
          ;;
        7[0-4]%|6[0-9]%|5[0-9]%) fgcolor='#[fg=brightgreen]'
          ;;
        4[0-9]%|3[0-9]%|2[5-9]%) fgcolor='#[fg=brightyellow]'
          ;;
        2[0-4]%|1[0-9]%|[0-9]%) fgcolor='#[fg=brightred]'
          ;;
      esac

            # Display the percentage of charge the battery has.
            printf "%s " "${fgcolor}${charging}${batt0}${fgdefault}"

    fi
  fi
}

function cpu_temperature() {
  # Display the temperature of CPU core 0 and core 1.
  sensors | awk '{printf $2" "}' | awk '{printf $7}' | awk '{a=$1} END {printf("%5.0fºC", a)}'
}

function ip_address() {
  # Loop through the interfaces and check for the interface that is up.
  for file in /sys/class/net/*; do

    iface=$(basename $file);

    read status < $file/operstate;

    [ "$status" == "up" ] && ip addr show $iface | awk '/inet /{printf $2" "}'

  done
}


function main() {
  bat=$(battery_meter)
  temp=$(cpu_temperature)
  ip=$(ip_address)
  # memory_usage
  # vpn_connection

  printf "%s" "${ip}| ${bat}|${temp}"
}

main

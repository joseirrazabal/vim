#!/bin/bash

# Función para medir el estado de la batería
battery_meter() {
    if [ -d /sys/class/power_supply/BAT1 ]; then
        local capacity=$(cat /sys/class/power_supply/BAT1/capacity)
        local status=$(cat /sys/class/power_supply/BAT1/status)

        case $status in
            "Charging")
                echo "Bat: ${capacity}% Cargando"
                ;;
            "Discharging")
                echo "Bat: ${capacity}% Descargando"
                ;;
            *)
                echo "Bat: ${capacity}% Enchufada"
                ;;
        esac
    else
        echo "No hay batería"
    fi
}

# Función para medir el uso del CPU y la memoria
cpu_mem_usage() {
    local cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}')
    local mem=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
    echo "CPU: $cpu, Mem: $mem"
}

# Función para medir la temperatura de la CPU
cpu_temperature() {
    sensors | awk '{printf $2" "}' | awk '{printf $7}' | awk '{a=$1} END {printf("%5.0fºC", a)}'
}

# Función para obtener la dirección IP
ip_address() {
    local ip=$(curl -s https://ifconfig.me)
    echo "IP: $ip"
}

# Función principal que combina todas las anteriores
main() {
    bat=$(battery_meter)
    # temp=$(cpu_temperature)
    ip=$(ip_address)
    usage=$(cpu_mem_usage)

    # printf "%s | %s | %s | %s" "$ip" "$bat" "$temp" "$usage"
    printf "%s | %s | %s" "$ip" "$bat" "$usage"
}

main

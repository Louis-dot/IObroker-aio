#!/bin/bash

# Array mit den Namen der gewünschten Adapter
adapters=("telegram" "mqtt" "influxdb" "mysql" "hue" "knx" "sonos" "zigbee" "zwave" "modbus" "shelly" "homematic" "google-shared-devices" "wled" "openweathermap" "ioBroker.vis" "javascript" "scenes" "history" "vis-materialdesign" "mobile" "alexa2" "lgtv" "shelly-iot" "rfxcom" "miele" "enocean" "greekairquality" "boschindoor" "amazon-dash" "pushover" "harmony" "lgtv-serial" "smartmeter" "sma-sunnyboy" "shelly-rgbw2" "bravia" "tp-link" "volkszaehler" "roomba" "govee" "mercedes-me" "samsungtv" "tradfri" "wiffi")

# Funktion zum Überprüfen der Adapterinstallation
check_adapter_installed() {
    local adapter_name=$1
    iobroker list | grep "^$adapter_name" > /dev/null
}

# Funktion zum Installieren eines Adapters
install_adapter() {
    local adapter_name=$1
    echo "Installiere $adapter_name Adapter..."
    iobroker add $adapter_name
    iobroker install $adapter_name
}

# Überprüfen und Installieren der Adapter
for adapter in "${adapters[@]}"; do
    check_adapter_installed $adapter
    if [ $? -eq 0 ]; then
        echo "$adapter Adapter ist bereits installiert."
    else
        install_adapter $adapter
    fi
done

echo "Alle wichtigen Adapter wurden installiert."

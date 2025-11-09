# gl-e750-monitor-mqtt-ha

My personal configuration based on [gl-e750-monitor repo](https://github.com/mazzz1y/gl-e750-monitor) using mqtt to publish data and alert messages to [Home Assistant](https://www.home-assistant.io/).

## Requirements
1. Follow instructions in https://github.com/mazzz1y/gl-e750-monitor
2. Place alert.sh and monitor.sh in a folder of your choice (e.g. /monitor) on the Mudi
3. Make sure you give execution permission to both scripts
4. Use this example configuration in your Home Assitant configuration.yaml:
```
# mqtt devices
mqtt:
  sensor:
    - name: "MCU Temperature"
      unique_id: "mcu_t"
      state_class: "measurement"
      state_topic: "openwrt/mcu_t"
      device_class: "temperature"
      suggested_display_precision: 1
      unit_of_measurement: "°C"
      icon: "mdi:thermometer"
      device: {"identifiers":"openwrt_mcu","name":"Openwrt MCU Monitor","sw_version":"1.0.0","manufacturer":"GL.iNET","model":"Mudi"}
    - name: "Battery SoC"
      unique_id: "mcu_b"
      state_class: "measurement"
      state_topic: "openwrt/mcu_b"
      device_class: "battery"
      suggested_display_precision: 0
      unit_of_measurement: "%"
      icon: "mdi:battery"
      device: {"identifiers":"openwrt_mcu","name":"Openwrt MCU Monitor","sw_version":"1.0.0","manufacturer":"GL.iNET","model":"Mudi"}
    - name: "Alert Message"
      unique_id: "mudi_alert"
      state_topic: "openwrt/alert"
      device: {"identifiers":"openwrt_mcu","name":"Openwrt MCU Monitor","sw_version":"1.0.0","manufacturer":"GL.iNET","model":"Mudi"}
  binary_sensor:
    - name: "Battery State"
      unique_id: "mcu_c"
      state_topic: "openwrt/mcu_c"
      device_class: "battery_charging"
      payload_on: "1"
      payload_off: "0"
      icon: "mdi:battery-charging"
      device: {"identifiers":"openwrt_mcu","name":"OpenWrt Monitor","sw_version":"1.0.0","manufacturer":"GL.iNET","model":"Mudi"}
```
## Result
![Screen Shot 2024-01-02 at 20 36 09](https://github.com/russilui/gl-e750-monitor-mqtt/assets/64688653/b8edd482-5917-48ef-8604-76aa398a4537.png)

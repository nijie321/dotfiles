#!/bin/bash

nmcli connection add type wifi con-name eduroam ifname <INTERFACE_NAME> ssid "eduroam" -- wifi-sec.key-mgmt wpa-eap 802-1x.eap ttls 802-1x.identity <EMAIL> 802-1x.phase2-auth mschapv2 

nmcli connection up eduroam --ask


nmcli con add \
  type wifi \
  con-name eduroam \
  ifname <INTERFACE_NAME> \
  ssid "eduroam" \
  wifi-sec.key-mgmt wpa-eap \
  802-1x.identity <EMAIL> \
  802-1x.phase2-auth mschapv2
  
 nmcli connection up eduroam --ask

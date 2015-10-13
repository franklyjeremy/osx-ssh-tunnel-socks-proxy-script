#!/bin/bash
disable_proxy() 
{
        networksetup -setsocksfirewallproxystate Wi-Fi off
        networksetup -setsocksfirewallproxystate Ethernet off
        networksetup -setsocksfirewallproxystate "Thunderbolt Ethernet" off
        echo "Proxy Tunnel Disabled."
}
trap disable_proxy INT
 
networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 7941
networksetup -setsocksfirewallproxy Ethernet 127.0.0.1 7941
networksetup -setsocksfirewallproxy "Thunderbolt Ethernet" 127.0.0.1 7941
networksetup -setsocksfirewallproxystate Wi-Fi on
networksetup -setsocksfirewallproxystate Ethernet on
networksetup -setsocksfirewallproxystate "Thunderbolt Ethernet" on
echo "Proxy Tunnel Enabled."
echo "You're Currently Tunneling... Ctrl C to Disable"
ssh your-ssh--user@your.vps.of.choice.com -D 7941 -N

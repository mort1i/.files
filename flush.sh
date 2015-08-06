#!/bin/bash
# Morten Iversen @mnemonic.no
# Clear firewall 2015

## Opens firewall completely
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

## Prints the current rules
iptables -vL

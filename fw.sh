#!/bin/bash
# Morten Iversen @mnemonic.no
# Basic firewall 2015

## Variable definitions
AppPorts=1024:65535	# Unknown ports / application ports

## Setting default policy (drop everything)
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

## Allowing established and related connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

## Allowing outgoing connections
iptables -A OUTPUT -m state --state NEW -j ACCEPT

## Allow SSH in from the outside
#iptables -A INPUT --dport 22 --sport $AppPorts -m state --state NEW -j ACCEPT

## Prints current rules
iptables -vL

## Safety (use when testing rules from the outside)
## Sleeps for 1 minute then opens the firewall
#sleep 60
#./flush.sh

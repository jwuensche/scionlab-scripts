#!/usr/bin/env sh

curl -L https://github.com/fin-ger/gts-port-cfg/releases/download/v0.4.0/gts-port-cfg --output /tmp/gts-port-cfg && curl https://raw.githubusercontent.com/fin-ger/gts-port-cfg/master/data/dfn-scionlab.yml --output /tmp/scion.yml && chmod +x /tmp/gts-port-cfg && /tmp/gts-port-cfg /tmp/scion.yml | bash

IP_ADDRESS=$(ip -f inet addr show ens7 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')

case $IP_ADDRESS in
    10.43.43.1)
        sudo ip link set dev ens10 down
        sudo ip addr flush dev ens10
        sudo ip addr add 10.1.10.4 dev ens10
        sudo ip link set dev ens10 up
        sudo ip route add 10.1.10.1 dev ens10
        ;;
    10.43.43.2)
        sudo ip link set dev ens10 down
        sudo ip addr flush dev ens10
        sudo ip addr add 10.1.11.4 dev ens10
        sudo ip link set dev ens10 up
        sudo ip route add 10.1.11.1 dev ens10
        ;;
    10.43.43.3)
        sudo ip link set dev ens10 down
        sudo ip addr flush dev ens10
        sudo ip addr add 193.174.10.21/24 dev ens10
        sudo ip link set dev ens10 up
        sudo ip route add 193.174.10.0/24 dev ens10 src 193.174.10.21 table rt2
        sudo ip route add default via 193.174.10.17 dev ens10 table rt2
        sudo ip rule add from 193.174.10.21/32 table rt2
        sudo ip rule add to 193.174.10.21/32 table rt2
        ;;
    10.43.43.4)
        sudo ip link set dev ens10 down
        sudo ip addr flush dev ens10
        sudo ip addr add 193.174.10.20/24 dev ens10
        sudo ip link set dev ens10 up
        sudo ip route add 193.174.10.0/24 dev ens10 src 193.174.10.20 table rt2
        sudo ip route add default via 193.174.10.17 dev ens10 table rt2
        sudo ip rule add from 193.174.10.20/32 table rt2
        sudo ip rule add to 193.174.10.20/32 table rt2
        ;;
 esac

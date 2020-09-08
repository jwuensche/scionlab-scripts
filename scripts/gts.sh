#!/usr/bin/env sh

IP_ADDRESS=$(ip -f inet addr show eno1 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')

case "$IP_ADDRESS" in
    "172.16.0.11")
        # LOCAL LINKS
        ip link add link enp5s0f0 name ams type vlan id 10
        ip link add link enp5s0f0 name ham type vlan id 30
        ip link set dev enp5s0f0 up
        ip link set dev ams up
        ip link set dev ham up
        ip addr add 10.42.42.3 dev par
        ip addr add 10.42.42.3 dev ams
        ip addr add 10.42.42.3 dev ham
        ip route add 10.42.42.1 dev ams
        ip route add 10.42.42.2 dev ham
        # EXTERNAL LINKS
        # SWITCH
        ip link add link enp5s0f0 name switch type vlan id 35
        ip addr add 10.1.6.1 dev switch
        ip link set dev switch up
        ip route add 10.1.6.0/24 dev switch
        # VIRTUAL WALL
        ip link add link enp5s0f0 name vwall type vlan id 37
        ip addr add 10.1.1.1 dev vwall
        ip link set dev vwall up
        ip route add 10.1.1.0/24 dev vwall
        # DFN
        ip link add link enp5s0f0 name dfn type vlan id 33
        ip addr add 10.1.11.1 dev dfn
        ip link set dev dfn up
        ip route add 10.1.11.0/24 dev dfn
        # GRID 5000
        ip link add link enp5s0f0 name grid5000 type vlan id 1390
        ip addr add 10.1.8.1 dev grid5000
        ip link set dev grid5000 up
        ip route add 10.1.8.0/24 dev grid5000
        ;;
    "172.16.0.10")
        # LOCAL LINKS
        ip link add link enp5s0f0 name par type vlan id 30
        ip link add link enp5s0f0 name ams type vlan id 20
        ip link set enp5s0f0 up
        ip link set dev ams up
        ip link set dev par up
        ip addr add 10.42.42.2 dev ams
        ip addr add 10.42.42.2 dev par
        ip route add 10.42.42.3 dev par
        ip route add 10.42.42.1 dev ams
        # EXTERNAL LINKS
        # SWITCH
        ip link add link enp5s0f0 name switch type vlan id 44
        ip addr add 10.1.12.1 dev switch
        ip link set dev switch up
        ip route add 10.1.12.0/24 dev switch
        # SIDN
        ip link add link enp5s0f0 name sidn type vlan id 40
        ip addr add 10.1.3.1 dev sidn
        ip link set dev sidn up
        ip route add 10.1.3.0/24 dev sidn
        # DFN
        ip link add link enp5s0f0 name dfn type vlan id 26
        ip addr add 10.1.10.1 dev dfn
        ip link set dfn up
        ip route add 10.1.10.0/24 dev dfn
        ;;
    "172.16.0.20")
        # LOCAL LINKS
        ip link set dev enp5s0f0 up
        ip link add link enp5s0f0 name par type vlan id 10
        ip link add link enp5s0f0 name ham type vlan id 20
        ip link set dev ham up
        ip link set dev par up
        ip addr add 10.42.42.1 dev par
        ip addr add 10.42.42.1 dev ham
        ip link set dev ham up
        ip link set dev par up
        ip route add 10.42.42.2 dev ham
        ip route add 10.42.42.3 dev par
        # EXTERNAL LINKS
        # SIDN
        ip link add link enp5s0f0 name sidn type vlan id 34
        ip addr add 10.1.2.1 dev sidn
        ip link set dev sidn up
        ip route add 10.1.2.0/24 dev sidn
        # VIRTUAL WALL
        ip link add link enp5s0f0 name vwall type vlan id 25
        ip addr add 10.1.7.1 dev vwall
        ip link set dev vwall up
        ip route add 10.1.7.0/24 dev vwall
        # GRID 5000
        ip link add link enp5s0f0 name grid5000 type vlan id 50
        ip addr add 10.1.9.1 dev grid5000
        ip link set grid5000 up
        ip route add 10.1.9.0/24 dev grid5000
        ;;
esac

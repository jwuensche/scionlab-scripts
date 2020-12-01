#!/usr/bin/env bash
set -euo pipefail

if test "${USER}" != "root"
then
    echo "This script needs to be run as root!"
    exit 1
fi

setup_public_ip() {
    vlan=$1
    gateway=$2

    GENI_GET_INFO='/tmp/geni-get-info.py'

    curl -s https://www.wall2.ilabt.iminds.be/geni-get-info.py -O "${GENI_GET_INFO}" || exit 10
    chmod u+x "${GENI_GET_INFO}"
    pub_dev=$(${GENI_GET_INFO} controldevname)
    if test "$(${GENI_GET_INFO} pubip | wc -l)" -gt 1
    then
        select ip in $(${GENI_GET_INFO} pubip)
        do
            pub_ip="${ip}"
        done
    else
        pub_ip=$(${GENI_GET_INFO} pubip)
    fi

    #Add now
    modprobe 8021q
    vconfig add "${pub_dev}" "${vlan}"
    ifconfig "$vlan${vlan}" "${pub_ip}" netmask 255.255.255.192
    route del default gw "${GW}" || echo "Not deleting default gateway since none existed"
    route add default gw "${gateway}" || true

    #Add on reboot
    echo 8021q | sudo tee -a /etc/modules
    cat >> /etc/network/interfaces <<EOF

    auto ${pub_dev}.${vlan}
    iface ${pub_dev}.${vlan} inet static
    address ${pub_ip}
    netmask 255.255.255.192
    gateway ${gateway}
    vlan-raw-device ${pub_dev}
    pre-up route del default gw ${GW}
    post-down route add default gw ${gateway}

EOF

    # echo "Configured Public IP is: ${pub_ip}"
    echo "{ \"changed\": true, \"msg\": \"Succesfully setup public IPv4 ${pub_ip}\" }"
}

# ignore other cases than vwall2
setup_public_ip '29' '193.190.127.193'

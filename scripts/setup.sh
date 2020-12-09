#!/usr/bin/env sh

if test "${USER}" != "root"
then
    echo "This script needs to be run as root!"
    exit 1
fi

HOSTNAME=$(hostname)

echo "Starting setup on ${HOSTNAME}..."
echo "Installing Grid5000 frontend SSH keys on ${HOSTNAME}..."
mv scionlab.prv .ssh/id_rsa
cat scionlab.pub >> .ssh/authorized_keys

echo "Creating scionlab user on ${HOSTNAME}..."
useradd scionlab
usermod -aG sudo scionlab

echo "Creating homedir for scionlab user on ${HOSTNAME}..."
mkdir /home/scionlab
chown -R scionlab /home/scionlab

echo "Changing default shell for scionlab user on ${HOSTNAME}"
chsh -s /bin/bash scionlab

echo "Granting scionlab user root access on ${HOSTNAME}..."
echo 'scionlab ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

echo "Installing SSH keys for scionlab user on ${HOSTNAME}..."
mkdir -p /home/scionlab/.ssh
cat <<EOF > /home/scionlab/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDN2DRwQzmsywlXfve9GSS0nxMkLZUADBxRelGODXjm++BN2y/09ADwHc9Z9ihFS1P1DgAo3H180UtM2I2mtxpkE0RVNLt9/6l8pP7x+VR9KOy08Tzp/hsf47zFHEZQoDUPV4refuBOX4eTG/gLnOxJjmYKloov8ArnGd3jnOgK/OIGtjIhg6a8200wqFYCiDoZzc68TMtToSs37jJgY2ERjL0AUk/eOpvcovNBpFnyykBbAEbj/Fh3C+xv/pg/AVOLadIwxdM/rwLfMuhQvJPCD4dq+8mJ33plw8F+CSa06ZfE+hnTr69T9i2/tYSOaTk/fYEGlCit/pWVDkoy1JO1N7BKX+ZH4idyMzIuE3jU0qIglNEHzvjAsSfUTOuyRIs3NAqX2IB20SEFIHmJK5/MVi31cTZkjfGF9OiGiitA3rIQBz5nhzEQWg/g3HI9Z/J144gEIyclskH6ugyT4iBNHk6TQS4KBAxdigGPqfykw9WwsfGIeeBaoH6lqtM6z93ICglBHACIjnUjyx/uXNU9x+6JakTb7PHN32+F4DuRv+IkTR2Q6XcqYBju4jjZkUHsf93leghjiBSFtXT2XF1QAjnUxkJi/vy59CwJXapCpUWIn2TxKSZCriuX4uyOxqfXc767QsfAmVIQT5osDtucmQScfBeuY9MPTsMsARI2oQ== scion-ansible-key
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTS3Euq1SXQ0wQsMrAdGgNhAJ7qHg/cSrDfCbZAOAj4/xOyEM5OFXrshtYDwbPqGA7Rtf4eq5ZCFSWaLh2aXSAr++I0X1av8rRXrizloWA2NjtkBVIJ/cuGty/lbNGFCa6KRgBOpd7c4lMTe/2AEAXM6azynMJJJ1eS8o+PZWcyEbCF36aOyF9kPoJ4by7gfXD3JGAXg3GltSBUURKzCvq9wCgvA9ZYApn+6Me1GrVbL0HhIm2mZXBVEYyqDSOQ9gjCz51K1eNp3kAabgxI5p9UEbJxN0emGHJt7PPOquZe9bbx/F7HxzzkOpatczyo45faj5u/s1y3vUohyy6E2GRSe/1rQVRxV7t4ENBUApt5Nd56fg0k/DGcnaVKnu0Kex0wY6jI4MwMS7DdB2cWsBkCCGwod8ybP7jDHLWC1siXY5bVA1ubCVeTNMgzpyWAgm8rqWlxtM6nqLTCb0oqPET7Y+q1ii8e+C5Y0Agd60Dq1Qi3TrSci2PsRI3hp6fuCawWVhpk/8yzCcAKKmfuCM8gTp+L7Y9IE99KBT1cfLMVNbA3FGC7SAJVCPSddCdxscwPZwAOfUSEKkQcWHqRO5PN32OogKq3liraCdVMfXlLOEGqpUJFnUnahQXLTHS+oHuHPPCDn/FjLAe2nivt7n0u4iTPQBhYFZIRHMmNCwEZQ== wirzf@inf.ethz.ch
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILeAq6yZUre/TNKXFe9KLrWYlB+92pfAVGFKP2HjeaRs meury.cedric@inf.ethz.ch
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC5RjfMFXQhu6rhiuq4wCgkb02YXrrTZtUW9NwQaqbveBlbDnzCdmXA9aPXq7E4yZttVFyQc+skiyZ/JlQGaDHUCWf02Jq0qIUxx458xPmzYG3MT4C/HPDw3DMMbr36xij9FuHt5litZ7874vjBYkbfPzh4WS/78+tt8gtS6HZG1I+jpdi2ucJIlha5Z52u6ItavYZiOWaASr8vC59kCd1OdtO3gowJPAz6/38WJ4TTzJrkoRSdaMZxoYh07xwg2Zn+ulKGZPoH33mwL2JtUPowFtBKe5YdYftbfT7n0jMBVMXYR6XsQ9VL/mpwTkSUe3W6hrsF+nZdk0hSt86QLvRRY7x07VkD25l3oyufiMW7ZdpWO87JI9OTgZluNFf1Vh6BucNrjiSxnKHnhHs4naOcLMBbfJLjDAaFe4bXZ3aHKw0wZZGpUApYKe/9nJqlP4lmZNlWoSZESXFndZiqQMixIoynNG7k4vuVp8zoXCmD6AduFRTv59p3g2tB0fHaFyuoIV3M4ffghdqayTJDRFn8KpeRfko/GR5Zo4/0GSLRTDiI5pScLb0EAbtoWJJFuJDt8wtbMUrPaN/i5QAhXOq9mvmAcnVigeWcIcrebA9EAv47y1ePrlyFh3l2eBr65MicrPjD+S9i4qxS7ryDsHJdd10WCuhX9rET/2QHaHsdlw== juan.garcia@inf.ethz.ch
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDsmeslOcAxeDlcjS6aCFTU0SJckSHNg/Y7AFQj0R1dtJ//SMGv0StYTTrV7fCeALjVhzji0BJeE6VdJs5BZFz3lLZhq/JoSGYX2DHfLTclvch73sH7gM/u9nr7uyTLPZNauPCV+7lXt7tLqxyBb/hcr/j4k44U4nUR/R2ChPL3l7HFv3Iaxa61vNVzL8MIqcCCxd8lqZ4gUfZuP5aSZTdVE6CJdKY6pPz0ch0deL2+ndQMr2O8dqZUEJHwA4WB9SSrWoezgxOHyLkENhOPOPMqFMKwn8VasWmtYywyj0NjFRPKJdhIrJy/DNjJXavOMlAIbwwTcbdJNbSpuDL4t0cz jkwon@ict-networks-192-168-001-003.fwd-v4.ethz.ch
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwzZKvVxcsWFpJOgnKwfpmEC3t8LIAwQMIyjzS2lEQGtJa1jTay2p8oOH8J4YZc5fcNS0f94HuRBttTWbV5Vzs1GJs/o8bwUXfxKC+nqvzoLQs+AsQiXwnzz6JJxBN8CAtUZJ9Oi39kuDz3LHJMocM5VqTiIFVKBBpTyHrKapGZBH/vbJfoIcAM8LKl/BiV01hYTOVaq/LU/QyiUus0/Wl0QuY097KFQb3x6dgSfJo1+1oUJ3pfnTDsqWLNFkphTjZETZRdB53sGBIbWYumtGyVeY5scYTUPQ1iqbF8uWndyka/FE4LhR3ytboTlaSo6nCzr02uyP/kpy83yAgPwh3Q== hausheer@pc-hausheer
command="sudo scionlab-config" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnVk9YOZmt3JatkxZ6RcY/g/Sp4GjMTIcgrrYwzafZtaq6jDg1/aQCZovJjF+49j3K7T0oOjC7ncx5G/bE2g3Ay7bf2fzDHoiyK1PC4fYgw1YItYGGZxSkj6nQGu4IN4RWeTwwD3fnRzPuB44n71fe7G2Cnwc6i8sqtimowKledtVgi3IQ3ISXE2BZ5CnyCj9l81RYqPa3sBFyfSwwSPBz6IQvyYRFAF1h+XNI8qpEAoHqztaiuoRvV5kMxqyS3kDRxsEPuyR4JbDhGFs0l+b0K22XEl30a/vVRnMCVScx1AM/eJ3uELp4q/Vf6GXWtKQ/Hhbs3/Di1c67AIsRTaOX auto-deploy@scionlab.org
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC30UWfMgQcNFR4U2pGEqfcOQm2holD6kPjTLxYKevYOldtm4h5tSJCRfhCn7e0Bi0uTCQBJNLu+JWrje8OK8SKQypnXoKmcJqp8mN2v3w6iyX2xB9cFNP9F7zV8vdrWXPJB1NRMvunTmo2GwoNGASe5+ysBvfW2hIBuUN+8HrS9ZftRJFfoAlnaJFo6mnmLyCCo601xhQnSvoIib29GyPQ56qOeVVvXMEM3KU/eaZ0RP3TkEDSBMVEtak54yAx83u3SXE4Eopd5d0Ycn+t3jxWk7XMYzIytHXYrPtTAfTYCy+GnmoBE3kaDvs/zc+y3+WjfUMhcUXD3P8HbARvmMOv skamila-yknano/cardno:000610303896
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNO+fLmv6gywbDiYIstcNrlm9TgSuRWcxcTYrPgGefh2eJcYpbaQK1PrrwswuZpdFK0OBEtnlKLGKmhLafKsfY5EkZRqHKXQAiFvP9PTaU1k9roUGB4QUCOvXz8dMjSKVQ40hT36yxIXVE6qETK29lP0WHaN1MGyIHTpFOmidDmQxrJZYXKk1oJW4aw2mq7gK+AF0ii0Me8NtreEmsFXf2aKMXv22SuaL9S7w51W59jzE2ThGvT/Qwn89Vyrj3N51GKWxbznQ8IxYrq/h0pU2Xq8IhYiCfjJZ/sXYVHUxML+Of0KV2xTUjV87Ks5jxbpeWqSbA2F7TE+PPL6O8G5hz skamila-ykneo/cardno:000603638283
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKG2M3UbpyJGAF1xxjRrYvol+tcyxdMlgXCuaGiKTbuz matfrei@inf.ethz.ch
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDmAztsnrE8u3IiKiPZ/ys+8eDr33BNO1FWlYDfVaaz69U/cdRUqDralByFZRjJunEazIIQ/lYqROeXmnYUW/+28/TVa3asdL4INjZoDayGpxj+zEAVVK3BU/vtU7W3q9lErapncl+MRsXmG/UexH7kGkxUo3T0IBEjAaQDAhfvA1OR426e+1GXFVlqppIJoG1awz2R9k1SSUGRns2DZ0ZYPb6YM1kwAp3MA+1d42VYlr3kSXPiLS/yIWbyH1KIZyOGR6VF79/av7WsH8ddQIunyaz4e0u9GZKS/Lrbp3sMl7264B48bJgfWEBKJ98WiLqsjA7cvOn3d4gCIlMt1hQ0t+QZXhQr0jfKxvK132/o7AvfMYH9N/1Krih5beRsgMPRUxIOhCMdBlbU5ChtffUHjyr03e+R9E27wT1AXRnJM70o3SUDwOQOSqGIv8gkluRYWS5fOSNhwD+B+SX4O0OjAfea2pyk3q7X97WYAYVvBHbtXj+mj0eSoNY5C7edos4qRL9rWnBln8kbfgrr2WGPSVzoCcRPtqVizcUyOfnZbU0MLPbUFf8lFsoGM/MO9DBHzXynjyxINHZwXTsMOyC0H6jFmBpvLdFwmTgL+Q9r7fCa8x4g/d4hE8DcBjvYmKf0aKVBUtqjmT0ysWIdxS7p7ii+EkB2SFlYcnD9LYE0+Q== matthias-frei:cardno:000610303898
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILwpdjGYdUL498BpaIfARfrqoe8WBaaEO+b5vBef4xxV matzf@thumper
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQCxIhVVb4r+7/OGpEkWCfSh8jSqjPQsb4h2Jorxw+tikaxPEk4tawjcVzn29aKqHZswMQ/Zhc0F7uHVAiv4JXWbVIqG3fhe1r1ZHWGmAbftF4aMDxUVMj0J4xyO/TPHJbEChqAhx6LZHxRjQi2wGMGWbYcaINEN6IExc5C+SBqs8DJSBeF0TTkGhRFkgAlp7kPSVlyGkys/uhGPzniTpjk3ROjHqlCnDPCqWqxXqFbWAgZYAt7MvxiED/IoVRZqeFuEWPni0rhB40JuIkqLumbrUDVnbIP7yBVCHpJWvW03we4dUGxzkcQAdAVXJY1Icn9k7+IK3d/fSIh4T70J3VsHXwuAMLG5tHiIqUnoxAjxy30Wj5HzvaQnP9TkP627HdUbD6EXyJrwwxzi6MdQR14IRQfauzCBraCArm22BKeaNh3bjAv4URCm7I2GlJnF0oofufjJ9AbGq/6xjnDhCJIdgaYWNjbPj2GZRQNK18xzxCPvpHZDg9k37Jpgp+gUG0bbA7AayFapMFE1v0OoqvwHPamDUavKkP49Kfog1yeW5NzWy9wrZyP+ZVYRuKqqK548SWIw1rYCv8OETJWTtmD6zgmFeCNXIqE+PYxd9lXpQHKSfBCvwUYhLjXL3zm8J3UGGXsZorUDjChTfXILSeMOoldahej7dGNrU9aqstixMKVO3zIYjCllF7yO/0FqmoHqpCX1dp9ExIqsdlQUoqBszR2diOyfJV1lijTUbGPI8qcQKCSjaE4FpCFrRekNvkZlmqvQGY1wFe+kpXKvkbxFWK2AdxAv0i3f/HaytjSbx9riaG6usp2G/xgVkJTHFkzf4qGzVN030O0kvvz5Zy8C8depsib7x8KqTFGEMTPtPALs0JhFV6jK/U7sT6KK8xqwhijrcX/F4xTXExIoGjwR2RYCwiNO8qxT6aoFAHk1mYBRizTIrTJRfni2YKvIU00MaVyVdOGUuRws1CZNQzJaaM4IMOxQY+JPKy1BqSz5fiZSc1eedo6hXrW7G2cFIEbVT39ospum9nlUEWF+g12yxhXiMK3NmxU47d3jpI55919o9fQeV52houqJBQfWxeZOnD89VluMK9T7oUjvoNLDTKpCQuovTlnw0ZEWGsjVDEffarf8DCL1RhhTXsy8k83pxHVPsKT5J7K4sb4BWPef18OtLq+qvssEAJa5wTALlYKTrpY8EswkTSwGp4sNMQ35ZcS7shQwKeL+XqkqsS1+s3+zt7fAcfacwzDI6sCCiJiKkIwkyLbpDXJYy1sdkQEt3JTPbdNrRcshFfgaR1kkYvFJydvPQK0l3/kNa2KGdfpmmEL1uBEV/1wnwQRpYGZpyfert08SdP9VTVuPwx+B jwuensch@byzantium
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbsc2usPibQ8Jq6ZeUBtM1ML5qFx8qvWtcn42p7rUJVS0QKAIRpyZTae1TdzpigcK8HU7MAExCEwyGOLZiyQoE07eDbcuryB1UT7GsUlfPtIMIOjUEiTybkXwwK/EPsiOL+4U1XCEtkJtI006bmE4Lzw3J/I/LvMA/6GqH9BOGUlFUntmjcQKblhD9eobSNjVCsegncpu/5tpwv9Mc9aQSxL7mq5ytdEiO2AAYvWC5rf3XF18vUIJwdSPB9SisLLV91lvO7DLP1/kQ5fTEeXu+FOmTqSmlnrxgQp4H+HHCOXjmtr5MoneoijQXbk/KPkfX91qORZImYrDlNUh7uJikHT92jmvC2dE0w+f5hAzn5aAVmafX58BfwBrX1K970ZxRfoe8W6ICBw2SDhIhDoh4CQkTNnjDmTLUrbnBatUpECFWizkYfoE5qQ8kYprrRA9K4bv/nNYmChn5kx604aMKX/mMSnvVaphf6MyzVaRx9HEQCgodLdqNW7SE4CW0Kjs= marcfrei
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDaGpk/mUd0aDPYvLWbKvg8aDNkWbDw+xbuAjkHheXUmkNRAQqV2IlsNHGAtZRPH+SJlW+mRSUavVexcFPqyKb8VF9RYcdSWn+tjUvIoY81rIfO0gKYzr4G2ACWEV+vey1VlP7if8k3boNZbCG1EklwEnpl7P5fZoAsDhWJguh/9xIDEhq1bh6H7GfQJagcnS+rUvtXbqwqiPVDYKO3BJaALVukOcLdpxcEDQ5q4Qv5fNUBeQBliIKS7FrWsZNdVhJPi8TYWFmgyRGXzVj2EYX/vIcX0ezj7f5QIQacJUnSRg6eozYyO/4ESgRKjyn+toTENjrMChy7XjUIsqMWwshUX68OnzSBOhEgbkqCroYDVtHg4/OmgsVd9sJWWCT40Z0lfWVPISG/pCNrS4srUTyTyfA2SDyv+3WAWL4VG+lh/duFte2qKxRVOPKs/eg7gRUQJAGlYZBhl2FOWZGn5r60wX3Hh4zp0qEOyq2ULO8uCd4E46RqXL61kVHUL/v/yVmcB8XPmpAJaFJyASIzYNsre1oI6Axvhk8eUwWeZHKCl5tZckHh1D+Y+3fx9bkgsa12c44U1ErkRrLInK1uLdHuRMAN6DQpNJPcDzp/dWDzpBiZmIaW47mcQjgcjj+OEVoASX2s7QV6dis8wfg6yGl35bz3Xgd9YWigOPWFcRbTqeZCi2N0Wg6Fn9eoV9qBSrs+81t7LGRCGw7UtU4YDbMlIu6SnAEKFbGg2ylOvO5LEAdaMuWq14uC8HWigp2kLlkOlzE0ZBES5N65gLouAs44CcV7hj52sN4MdY4T7nh35Zrjks1h8nCcs5kvB2fE0imjD5R1YNHa37xQrHYajQ4xlYCXDiZkFX7O2gRT9gaLJ4NV8jcOIKRap7XgppcSswEV9X4MzmpyYkOcAVGqm/Bfeig46UOnY+TKn1VQVqSx9iWzCpyEWdHELh2ku1mH7yEWFlNQCfg0Y65KN6DTmQUvPzUSsS7lHDzvNdnyJ/g9dSgI9Vo7cOdM+pYPsMjFuDasUGdt9nlxjFOiv4clcIzuhGqhtOMhTNrSAdAqIQIc9Tv1p+R5b5nUDfYs5hCCylT/WBVfMPPowjYYsIzAGYOW6ka+kYLCWFPWjdPaQdq1LQXU+YIVbVZBoIyv50PD/IoWBNbeOBbHwqN4OHcp9Pobv449qrGz1VYvEFWLSGQNxS7RpNZQsbJ0w5FZaL9nEbNIWLJfr+6D78nHu7DycY0JCwmcKK7bmEVzgUIUfBPcHgl9+OsZE2MLxPTe61Pj/zhYE4UPnKQMd5xcHv0pd7p4TT40Vm4jkabdhBcTGpwmZTbxRfAGyNfpUyg0gjAQDlY3rMeZIXA0/Sh6X2cR4z51 fin.christensen@st.ovgu.de
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQC4w8jzlzKHNewJg1umykExiaYv8Dqwb1WvpzwV1Bq3WlX1Ov2RQS+rd6hpN+DW2guNWkPajrLDIO0a6QeG8MDO/M7z7o559F26HZpNdJjsE6aUOHmJB6YzX8CZoeIsdNj25TSjUvE5roLIvnpsF2dBqKVgS6yJh/ywNPC+oitEbu91BLF+JXqBkF8Y8e5FYyI22WPQS1qvf/80fu0LyHBs6RAxRpeIcX3h2YAUlzppc5QXKyECsLhNDGz1ZPsJuM5h+ULT/PIKPkO4kRCq8Anyzhcki/BCxQXIW5VeAhctAB0UbvbcVyMCud3UyH7UCTDApJCs4CPlSUUsUR8XpT2xueSKyhLFrTTzm3kHcQzkTi6b5mlJvli02pPgljum4EHYdps/vguVwbf2bUybKtxdam21OAXttoBQVIcVRwOYvCnfXrNvQI9GPMOE93ltfWl9cPwh4n9iTTj60NtAO8LGo1mssmFJZ3DgFQg5GGfMMoOOkEE21psvTQ0zpP6nMMVZrwFx81LH8NWauX7fHXLylwu8gO9VINSQNU+8hAkHKNZIfKYpQpyPrPfPK5Yo+M6lJ4faJugGpquprRlWD0BNWxfgjDGzXGKdfUMJTkeEfJH5V5yssHFCf+bro+vNkpx2hpuRMj2BjPtG8lxNdi8D635jmU/hFlfH/qdOdbTOf4YGXtwjUFtkSiI1+kX5JUlV5dHDwEDEPtGoJfYpJ4X+sH3dudNYmWsR9CbbCLGH6Rih/fH8ndXDeCuEqSUtJgIeyLWAcBoOhs/CfEL6XDOg6br4AlgsWfLTRacu3XRJvra7S5BOXzCKExiP5d6VqQ1nNGXblknOISNo/Ke4R5icT4HEqdO843YftOEX7k9uEkUX224GOlg9WC2WFdz5L6vGNhMV8WFKlcj1cLEqQkqEkfNsYGC8Dn306BTaewtvGRAyd1yISc2bXokTULO/8BQRDxf4aI12wBuOfPP2oMhyH2JwQbA5+eTwOicpo/mc1veCAYlcMwYIcqCw2ryc6zA5F7KfXKa3yaf/bzI8NPtTB2twUDdlfzJDhLKp+9JqZPbB3cyyIaRsYJWiNxUTpoVbY2tl8cxAJnmWu0Bv/K8xan/kHwlif1LQVRTLePtjWHKK6g/nJZIfeJTLjvHLjg7B2r53NdwYcFY67dk/vJNQgPUa95VKx6+gEixfjC9oBQl8yreiQWYFD50VEfBHO6ChNUqBxRmY0+3Zym+kXY8WZJqU2cyojO9+CJTmg4M3V4imqcmMYn8kVAZlmymLZcwFiP0z4iUwIQgThTqGv9bAaruOOpcLRyYxY2ejkvkKxSOAPeFLiIEcuHljjpdfp25wwH7+REkmTo8FB5xWJI85 cedric@ThinkPad-P40
EOF

echo "Finished!"
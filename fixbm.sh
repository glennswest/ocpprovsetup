export PUB_CONN=ens224
nmcli con down "$PUB_CONN"
nmcli con delete "$PUB_CONN"
nmcli connection add ifname baremetal type bridge con-name baremetal
nmcli con add type bridge-slave ifname "$PUB_CONN" master baremetal
pkill dhclient;dhclient baremetal


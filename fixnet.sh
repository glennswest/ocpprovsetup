nmcli con delete bridge-slave
nmcli con delete provisioning 
export PROV_CONN=ens192
echo $PROV_CONN
nmcli con down "$PROV_CONN"
nmcli con delete "$PROV_CONN"
# RHEL 8.1 appends the word "System" in front of the connection, delete in case it exists
nmcli con down "$PROV_CONN"
nmcli con delete "$PROV_CONN"
nmcli connection add ifname provisioning type bridge con-name provisioning
nmcli con add type bridge-slave ifname "$PROV_CONN" master provisioning
nmcli connection modify provisioning ipv4.addresses 172.22.0.1/24 ipv4.method manual
nmcli con down provisioning
nmcli con up provisioning


useradd kni
passwd kni
echo "kni ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/kni
chmod 0440 /etc/sudoers.d/kni
subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms --enable=rhel-8-for-x86_64-baseos-rpms
dnf install -y libvirt qemu-kvm mkisofs python3-devel jq ipmitool
usermod --append --groups libvirt kni
systemctl start firewalld
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload
systemctl start libvirtd
systemctl enable libvirtd --now
virsh pool-define-as --name default --type dir --target /var/lib/libvirt/images
virsh pool-start default
virsh pool-autostart default

#dnf install -y podman
#firewall-cmd --add-port=8080/tcp --zone=public --permanent
rm -r -f  /home/kni/rhcos_image_cache
mkdir /home/kni/rhcos_image_cache
chown kni /home/kni/rhcos_image_cache
semanage fcontext -a -t httpd_sys_content_t "/home/kni/rhcos_image_cache(/.*)?"
restorecon -Rv /home/kni/rhcos_image_cache/
cp get-rhcos-images.sh /home/kni
chown kni /home/kni/get-rhcos-images.sh
su - kni /home/kni/get-rhcos-images.sh

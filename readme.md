## Initial bootstrapping of a Raspberry PI ##

Minimal installation / bootstrap of the Raspberry Pi

### To use the image that we have ###

   dd if=boostrap.img of=/dev/disk1 bs=4m

   echo 'ssid' > /Volumes/SDCARD/wlan.conf
   echo 'wlan-key' >> /Volumes/SDCARD/wlan.conf


### To build a brand new image ###

Start off with loading up a disk image of Arch

    dd if=archlinux-hf-2013-07-22.img of=/dev/disk1 bs=4m

Boot the Raspberry Pi with a network cable plugged in and DHCP

   arp -a

Should get you the IP address of the machine

Follow the instructions for getting Docker up and running

   curl https://raw.github.com/resin-io/docker-install-script/master/install.sh | sh


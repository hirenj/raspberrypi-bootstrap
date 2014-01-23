## Initial bootstrapping of a Raspberry PI ##

Minimal installation / bootstrap of the Raspberry Pi

### To use the image that we have ###

   dd if=boostrap.img of=/dev/disk1 bs=4m

   echo 'ssid' > /Volumes/SDCARD/wlan.conf
   echo 'wlan-key' >> /Volumes/SDCARD/wlan.conf


### To build a brand new image from Arch ###

Start off with loading up a disk image of Arch

    dd if=archlinux-hf-2013-07-22.img of=/dev/disk1 bs=4m

Boot the Raspberry Pi with a network cable plugged in and DHCP

   arp -a

Should get you the IP address of the machine

Follow the instructions for getting Docker up and running

   curl https://raw.github.com/resin-io/docker-install-script/master/install.sh | sh

Install our bits and pieces

Enable ntp

   systemctl enable ntpd
   systemctl start ntpd


## To build a brand new image from a minimal image ##

    http://www.linuxsystems.it/raspbian-wheezy-armhf-raspberry-pi-minimal-image

    apt-get update
    apt-get install -y vim wpasupplicant
    update-rc.d wlanconf-copy defaults

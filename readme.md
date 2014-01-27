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
    apt-get install -y curl vim wpasupplicant resolvconf
    update-rc.d wlanconf-copy defaults


## To build node-openvg

    apt-get install -y libfreetype6 libfreetype6-dev libfreeimage3 libfreeimage-dev libglfw2 libglew1.7 libglew-dev libglfw-dev python
    apt-get install -y g++ make
    curl -O -L https://gist.github.com/raw/3245130/v0.10.24/node-v0.10.24-linux-arm-armv6j-vfp-hard.tar.gz
    mkdir /usr/local/node && cd /usr/local/node && tar zxvf ~/node-v0.10.24-linux-arm-armv6j-vfp-hard.tar.gz --strip=1 && export PATH=$PATH:/usr/local/node/bin
    apt-get install ttf-dejavu 
    apt-get install daemon fbset 
    # In the directory where we want the module 
    npm install openvg-canvas --save


## To install Chromium

   apt-get install -y xserver-xorg xinit xserver-xorg-video-fbdev matchbox chromium x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 libnss3 

## To resize partition

   fdisk /dev/mmcblk0
   Delete partitions 2 + 3
   d, 3 #Get rid of swap
   d, 2 #Get rid of main
   n p 2 #Create new partition at same start as old (10448)
   w    #Write partition table
   Reboot
   resize2fs /dev/mmcblk0p2

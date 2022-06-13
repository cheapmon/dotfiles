#!/usr/bin/env bash

# Verify the boot mode
echo "> Verifying the boot mode"
ls /sys/firmware/efi/efivars

if [ $? == 0 ]; then
  echo "! UEFI mode is enabled"
  echo
else
  echo "! UEFI mode not enabled. Quitting..."
  exit 1
fi

# Connect to the internet
echo "> Connecting to the internet"
ping -c 1 archlinux.org

if [ $? == 0 ]; then
  echo "! Internet is connected"
  echo
else
  echo "! Internet not connected. Quitting..."
fi

# Update the system clock
echo "> Updating the system clock"
timedatectl set-ntp true
echo

# Partition the disks
echo "> Partitioning the disks"
echo
lsblk -f
echo
echo "? Disk: "
read DISK
cfdisk $DISK
echo

# Format the partitions
echo "> Formatting the partitions"
echo
lsblk -f
echo
echo "? Boot partition: "
read BOOT_PARTITION
echo "? Root partition: "
read ROOT_PARTITION
mkfs.fat -F 32 $BOOT_PARTITION
mkfs.ext4 $ROOT_PARTITION
echo

# Encrypt root partition
echo "> Encrypting the root partition"
cryptsetup luksFormat $ROOT_PARTITION
cryptsetup luksOpen $ROOT_PARTITION root
echo

# Setup LVM
echo "> Setting up LVM"
pvcreate /dev/mapper/root
vgcreate vg /dev/mapper/root
echo "? Swap size: "
read SWAP_SIZE
lvcreate --name swap -L $SWAP_SIZE vg
echo "? Root size: "
read ROOT_SIZE
lvcreate --name root -L $ROOT_SIZE vg
lvcreate --name home -l 100%FREE vg
mkswap /dev/mapper/vg-swap
mkfs.ext4 /dev/mapper/vg-root
mkfs.ext4 /dev/mapper/vg-home
echo

# Mount the file systems
echo "> Mounting the file systems"
mount /dev/mapper/vg-root /mnt
mount --mkdir $BOOT_PARTITION /mnt/boot
mount --mkdir /dev/mapper/vg-home /mnt/home
swapon /dev/mapper/vg-swap
echo

# Install essential packages
echo "> Installing essential packages"
pacstrap /mnt base base-devel linux linux-firmware
echo

# Fstab
echo "> Fstab"
genfstab -U /mnt >> /mnt/etc/fstab
echo

# Prepare 2.sh
echo "> Preparing 2.sh"
pacman -Sy wget
wget https://raw.githubusercontent.com/cheapmon/dotfiles/main/.config/seims/init/2.sh
mv 2.sh /mnt/root/.bashrc
echo

# Done
echo "    arch-chroot /mnt"
echo

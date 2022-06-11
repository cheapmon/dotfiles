#!/usr/bin/env bash

# CPU
echo "> CPU"
echo "? CPU (amd/intel): "
read CPU
echo

# GPU
echo "> GPU"
echo "? GPU (amd/intel/nvidia): "
read GPU
case $GPU in
  amd)
    export GPU_DEPS="xf86-video-amdgpu mesa"
    ;;
  intel)
    export GPU_DEPS="xf86-video-intel mesa"
    ;;
  nvidia)
    export GPU_DEPS="nvidia nvidia-utils"
    ;;
esac

# Dependencies
pacman -S --noconfirm \
  networkmanager grub efibootmgr lvm2 $CPU-ucode xorg $GPU_DEPS sudo neovim \
  i3-gaps xmonad xmonad-contrib lightdm pulseaudio pulseaudio-alsa \
  pavucontrol zsh code firefox-developer-edition element-desktop ruby git \
  alacritty rofi dunst polybar flameshot clipmenu thunderbird feh picom \
  redshift network-manager-applet blueman gnome-keyring unclutter ripgrep fd \
  alsa-utils arandr autorandr xdotool baobab bat bluez-utils cmatrix cowsay \
  lolcat cups curlie docker docker-compose eog evince exa fzf \
  gnome-themes-extra gopass gource htop neofetch pamixer sl simple-scan \
  python-pip rsync rustup simple-scan solaar thefuck tmux tokei vlc wget \
  words youtube-dl jq yq ttf-font-awesome ttf-jetbrains-mono acpi rofi-pass \
  starship magic-wormhole upower

# Time zone
echo "> Time zone"
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo

# Localization
echo "> Localization"
echo "de_DE.UTF-8 UTF-8
en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo

# Network configuration
echo "> Network configuration"
echo "? Hostname: "
read HOSTNAME
echo "$HOSTNAME" > /etc/hostname
systemctl enable NetworkManager
echo

# Root password
echo "> Root password"
passwd
echo

# Boot loader
echo "> Boot loader"
lscpu
echo
export CRYPTDEVICE=$(lsblk -f | grep "crypto_LUKS" | tr -s " " | cut -d" " -f4)
echo "IyB2aW06c2V0IGZ0PXNoCiMgTU9EVUxFUwojIFRoZSBmb2xsb3dpbmcgbW9kdWxlcyBhcmUgbG9h
ZGVkIGJlZm9yZSBhbnkgYm9vdCBob29rcyBhcmUKIyBydW4uICBBZHZhbmNlZCB1c2VycyBtYXkg
d2lzaCB0byBzcGVjaWZ5IGFsbCBzeXN0ZW0gbW9kdWxlcwojIGluIHRoaXMgYXJyYXkuICBGb3Ig
aW5zdGFuY2U6CiMgICAgIE1PRFVMRVM9KHBpaXggaWRlX2Rpc2sgcmVpc2VyZnMpCk1PRFVMRVM9
KCkKCiMgQklOQVJJRVMKIyBUaGlzIHNldHRpbmcgaW5jbHVkZXMgYW55IGFkZGl0aW9uYWwgYmlu
YXJpZXMgYSBnaXZlbiB1c2VyIG1heQojIHdpc2ggaW50byB0aGUgQ1BJTyBpbWFnZS4gIFRoaXMg
aXMgcnVuIGxhc3QsIHNvIGl0IG1heSBiZSB1c2VkIHRvCiMgb3ZlcnJpZGUgdGhlIGFjdHVhbCBi
aW5hcmllcyBpbmNsdWRlZCBieSBhIGdpdmVuIGhvb2sKIyBCSU5BUklFUyBhcmUgZGVwZW5kZW5j
eSBwYXJzZWQsIHNvIHlvdSBtYXkgc2FmZWx5IGlnbm9yZSBsaWJyYXJpZXMKQklOQVJJRVM9KCkK
CiMgRklMRVMKIyBUaGlzIHNldHRpbmcgaXMgc2ltaWxhciB0byBCSU5BUklFUyBhYm92ZSwgaG93
ZXZlciwgZmlsZXMgYXJlIGFkZGVkCiMgYXMtaXMgYW5kIGFyZSBub3QgcGFyc2VkIGluIGFueSB3
YXkuICBUaGlzIGlzIHVzZWZ1bCBmb3IgY29uZmlnIGZpbGVzLgpGSUxFUz0oKQoKIyBIT09LUwoj
IFRoaXMgaXMgdGhlIG1vc3QgaW1wb3J0YW50IHNldHRpbmcgaW4gdGhpcyBmaWxlLiAgVGhlIEhP
T0tTIGNvbnRyb2wgdGhlCiMgbW9kdWxlcyBhbmQgc2NyaXB0cyBhZGRlZCB0byB0aGUgaW1hZ2Us
IGFuZCB3aGF0IGhhcHBlbnMgYXQgYm9vdCB0aW1lLgojIE9yZGVyIGlzIGltcG9ydGFudCwgYW5k
IGl0IGlzIHJlY29tbWVuZGVkIHRoYXQgeW91IGRvIG5vdCBjaGFuZ2UgdGhlCiMgb3JkZXIgaW4g
d2hpY2ggSE9PS1MgYXJlIGFkZGVkLiAgUnVuICdta2luaXRjcGlvIC1IIDxob29rIG5hbWU+JyBm
b3IKIyBoZWxwIG9uIGEgZ2l2ZW4gaG9vay4KIyAnYmFzZScgaXMgX3JlcXVpcmVkXyB1bmxlc3Mg
eW91IGtub3cgcHJlY2lzZWx5IHdoYXQgeW91IGFyZSBkb2luZy4KIyAndWRldicgaXMgX3JlcXVp
cmVkXyBpbiBvcmRlciB0byBhdXRvbWF0aWNhbGx5IGxvYWQgbW9kdWxlcwojICdmaWxlc3lzdGVt
cycgaXMgX3JlcXVpcmVkXyB1bmxlc3MgeW91IHNwZWNpZnkgeW91ciBmcyBtb2R1bGVzIGluIE1P
RFVMRVMKIyBFeGFtcGxlczoKIyMgICBUaGlzIHNldHVwIHNwZWNpZmllcyBhbGwgbW9kdWxlcyBp
biB0aGUgTU9EVUxFUyBzZXR0aW5nIGFib3ZlLgojIyAgIE5vIHJhaWQsIGx2bTIsIG9yIGVuY3J5
cHRlZCByb290IGlzIG5lZWRlZC4KIyAgICBIT09LUz0oYmFzZSkKIwojIyAgIFRoaXMgc2V0dXAg
d2lsbCBhdXRvZGV0ZWN0IGFsbCBtb2R1bGVzIGZvciB5b3VyIHN5c3RlbSBhbmQgc2hvdWxkCiMj
ICAgd29yayBhcyBhIHNhbmUgZGVmYXVsdAojICAgIEhPT0tTPShiYXNlIHVkZXYgYXV0b2RldGVj
dCBibG9jayBmaWxlc3lzdGVtcykKIwojIyAgIFRoaXMgc2V0dXAgd2lsbCBnZW5lcmF0ZSBhICdm
dWxsJyBpbWFnZSB3aGljaCBzdXBwb3J0cyBtb3N0IHN5c3RlbXMuCiMjICAgTm8gYXV0b2RldGVj
dGlvbiBpcyBkb25lLgojICAgIEhPT0tTPShiYXNlIHVkZXYgYmxvY2sgZmlsZXN5c3RlbXMpCiMK
IyMgICBUaGlzIHNldHVwIGFzc2VtYmxlcyBhIHBhdGEgbWRhZG0gYXJyYXkgd2l0aCBhbiBlbmNy
eXB0ZWQgcm9vdCBGUy4KIyMgICBOb3RlOiBTZWUgJ21raW5pdGNwaW8gLUggbWRhZG0nIGZvciBt
b3JlIGluZm9ybWF0aW9uIG9uIHJhaWQgZGV2aWNlcy4KIyAgICBIT09LUz0oYmFzZSB1ZGV2IGJs
b2NrIG1kYWRtIGVuY3J5cHQgZmlsZXN5c3RlbXMpCiMKIyMgICBUaGlzIHNldHVwIGxvYWRzIGFu
IGx2bTIgdm9sdW1lIGdyb3VwIG9uIGEgdXNiIGRldmljZS4KIyAgICBIT09LUz0oYmFzZSB1ZGV2
IGJsb2NrIGx2bTIgZmlsZXN5c3RlbXMpCiMKIyMgICBOT1RFOiBJZiB5b3UgaGF2ZSAvdXNyIG9u
IGEgc2VwYXJhdGUgcGFydGl0aW9uLCB5b3UgTVVTVCBpbmNsdWRlIHRoZQojICAgIHVzciwgZnNj
ayBhbmQgc2h1dGRvd24gaG9va3MuCkhPT0tTPShiYXNlIHVkZXYgYXV0b2RldGVjdCBrZXlib2Fy
ZCBrZXltYXAgY29uc29sZWZvbnQgbW9kY29uZiBibG9jayBsdm0yIGVuY3J5cHQgZmlsZXN5c3Rl
bXMgZnNjaykKCiMgQ09NUFJFU1NJT04KIyBVc2UgdGhpcyB0byBjb21wcmVzcyB0aGUgaW5pdHJh
bWZzIGltYWdlLiBCeSBkZWZhdWx0LCB6c3RkIGNvbXByZXNzaW9uCiMgaXMgdXNlZC4gVXNlICdj
YXQnIHRvIGNyZWF0ZSBhbiB1bmNvbXByZXNzZWQgaW1hZ2UuCiNDT01QUkVTU0lPTj0ienN0ZCIK
I0NPTVBSRVNTSU9OPSJnemlwIgojQ09NUFJFU1NJT049ImJ6aXAyIgojQ09NUFJFU1NJT049Imx6
bWEiCiNDT01QUkVTU0lPTj0ieHoiCiNDT01QUkVTU0lPTj0ibHpvcCIKI0NPTVBSRVNTSU9OPSJs
ejQiCgojIENPTVBSRVNTSU9OX09QVElPTlMKIyBBZGRpdGlvbmFsIG9wdGlvbnMgZm9yIHRoZSBj
b21wcmVzc29yCiNDT01QUkVTU0lPTl9PUFRJT05TPSgpCg==" | base64 -d > /etc/mkinitcpio.conf
echo "IyBHUlVCIGJvb3QgbG9hZGVyIGNvbmZpZ3VyYXRpb24KCkdSVUJfREVGQVVMVD1zYXZlZApHUlVC
X1RJTUVPVVQ9NQpHUlVCX0RJU1RSSUJVVE9SPSJBcmNoIgpHUlVCX0NNRExJTkVfTElOVVhfREVG
QVVMVD0ibG9nbGV2ZWw9MyBxdWlldCByb290PS9kZXYvbWFwcGVyL3ZnLXJvb3QgcmVzdW1lPS9k
ZXYvbWFwcGVyL3ZnLXN3YXAgY3J5cHRkZXZpY2U9VVVJRD14eHh4OnJvb3QiCkdSVUJfQ01ETElO
RV9MSU5VWD0iIgoKIyBQcmVsb2FkIGJvdGggR1BUIGFuZCBNQlIgbW9kdWxlcyBzbyB0aGF0IHRo
ZXkgYXJlIG5vdCBtaXNzZWQKR1JVQl9QUkVMT0FEX01PRFVMRVM9InBhcnRfZ3B0IHBhcnRfbXNk
b3MiCgojIFVuY29tbWVudCB0byBlbmFibGUgYm9vdGluZyBmcm9tIExVS1MgZW5jcnlwdGVkIGRl
dmljZXMKR1JVQl9FTkFCTEVfQ1JZUFRPRElTSz15CgojIFNldCB0byAnY291bnRkb3duJyBvciAn
aGlkZGVuJyB0byBjaGFuZ2UgdGltZW91dCBiZWhhdmlvciwKIyBwcmVzcyBFU0Mga2V5IHRvIGRp
c3BsYXkgbWVudS4KR1JVQl9USU1FT1VUX1NUWUxFPW1lbnUKCiMgVW5jb21tZW50IHRvIHVzZSBi
YXNpYyBjb25zb2xlCkdSVUJfVEVSTUlOQUxfSU5QVVQ9Y29uc29sZQoKIyBVbmNvbW1lbnQgdG8g
ZGlzYWJsZSBncmFwaGljYWwgdGVybWluYWwKI0dSVUJfVEVSTUlOQUxfT1VUUFVUPWNvbnNvbGUK
CiMgVGhlIHJlc29sdXRpb24gdXNlZCBvbiBncmFwaGljYWwgdGVybWluYWwKIyBub3RlIHRoYXQg
eW91IGNhbiB1c2Ugb25seSBtb2RlcyB3aGljaCB5b3VyIGdyYXBoaWMgY2FyZCBzdXBwb3J0cyB2
aWEgVkJFCiMgeW91IGNhbiBzZWUgdGhlbSBpbiByZWFsIEdSVUIgd2l0aCB0aGUgY29tbWFuZCBg
dmJlaW5mbycKR1JVQl9HRlhNT0RFPWF1dG8KCiMgVW5jb21tZW50IHRvIGFsbG93IHRoZSBrZXJu
ZWwgdXNlIHRoZSBzYW1lIHJlc29sdXRpb24gdXNlZCBieSBncnViCkdSVUJfR0ZYUEFZTE9BRF9M
SU5VWD1rZWVwCgojIFVuY29tbWVudCBpZiB5b3Ugd2FudCBHUlVCIHRvIHBhc3MgdG8gdGhlIExp
bnV4IGtlcm5lbCB0aGUgb2xkIHBhcmFtZXRlcgojIGZvcm1hdCAicm9vdD0vZGV2L3h4eCIgaW5z
dGVhZCBvZiAicm9vdD0vZGV2L2Rpc2svYnktdXVpZC94eHgiCiNHUlVCX0RJU0FCTEVfTElOVVhf
VVVJRD10cnVlCgojIFVuY29tbWVudCB0byBkaXNhYmxlIGdlbmVyYXRpb24gb2YgcmVjb3Zlcnkg
bW9kZSBtZW51IGVudHJpZXMKR1JVQl9ESVNBQkxFX1JFQ09WRVJZPXRydWUKCiMgVW5jb21tZW50
IGFuZCBzZXQgdG8gdGhlIGRlc2lyZWQgbWVudSBjb2xvcnMuICBVc2VkIGJ5IG5vcm1hbCBhbmQg
d2FsbHBhcGVyCiMgbW9kZXMgb25seS4gIEVudHJpZXMgc3BlY2lmaWVkIGFzIGZvcmVncm91bmQv
YmFja2dyb3VuZC4KI0dSVUJfQ09MT1JfTk9STUFMPSJsaWdodC1ibHVlL2JsYWNrIgojR1JVQl9D
T0xPUl9ISUdITElHSFQ9ImxpZ2h0LWN5YW4vYmx1ZSIKCiMgVW5jb21tZW50IG9uZSBvZiB0aGVt
IGZvciB0aGUgZ2Z4IGRlc2lyZWQsIGEgaW1hZ2UgYmFja2dyb3VuZCBvciBhIGdmeHRoZW1lCiNH
UlVCX0JBQ0tHUk9VTkQ9Ii9wYXRoL3RvL3dhbGxwYXBlciIKI0dSVUJfVEhFTUU9Ii9wYXRoL3Rv
L2dmeHRoZW1lIgoKIyBVbmNvbW1lbnQgdG8gZ2V0IGEgYmVlcCBhdCBHUlVCIHN0YXJ0CiNHUlVC
X0lOSVRfVFVORT0iNDgwIDQ0MCAxIgoKIyBVbmNvbW1lbnQgdG8gbWFrZSBHUlVCIHJlbWVtYmVy
IHRoZSBsYXN0IHNlbGVjdGlvbi4gVGhpcyByZXF1aXJlcwojIHNldHRpbmcgJ0dSVUJfREVGQVVM
VD1zYXZlZCcgYWJvdmUuCkdSVUJfU0FWRURFRkFVTFQ9dHJ1ZQoKIyBVbmNvbW1lbnQgdG8gZGlz
YWJsZSBzdWJtZW51cyBpbiBib290IG1lbnUKI0dSVUJfRElTQUJMRV9TVUJNRU5VPXkKCiMgUHJv
YmluZyBmb3Igb3RoZXIgb3BlcmF0aW5nIHN5c3RlbXMgaXMgZGlzYWJsZWQgZm9yIHNlY3VyaXR5
IHJlYXNvbnMuIFJlYWQKIyBkb2N1bWVudGF0aW9uIG9uIEdSVUJfRElTQUJMRV9PU19QUk9CRVIs
IGlmIHN0aWxsIHdhbnQgdG8gZW5hYmxlIHRoaXMKIyBmdW5jdGlvbmFsaXR5IGluc3RhbGwgb3Mt
cHJvYmVyIGFuZCB1bmNvbW1lbnQgdG8gZGV0ZWN0IGFuZCBpbmNsdWRlIG90aGVyCiMgb3BlcmF0
aW5nIHN5c3RlbXMuCiNHUlVCX0RJU0FCTEVfT1NfUFJPQkVSPWZhbHNlCg==" | base64 -d > /etc/default/grub
sed -i "s/xxxx/$CRYPTDEVICE/g" /etc/default/grub
mkinitcpio -P
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo

# Bluetooth
echo "> Services"
systemctl enable bluetooth
systemctl enable cups
systemctl enable docker
echo

# Superuser
echo "> Superuser"
EDITOR=nvim visudo
echo

# Groups
echo "> Groups"
groupadd -f docker
groupadd -f video
groupadd -f wheel
groupadd -f plugdev
groupadd -f dots
echo

# User
echo "> User"
useradd -m -s $(which zsh) seims
usermod -aG docker seims
usermod -aG video seims
usermod -aG wheel seims
usermod -aG plugdev seims
usermod -aG dots seims
passwd seims
echo

# Done
echo "    reboot"
echo

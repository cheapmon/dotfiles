{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/41aa3bd5-f4ca-47df-acc7-bee7c946819b";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-07952ed2-8a16-41a4-84e7-a8455de14b8a".device = "/dev/disk/by-uuid/07952ed2-8a16-41a4-84e7-a8455de14b8a";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8DA4-BFC7";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  fileSystems."/mnt" = {
    device = "/dev/disk/by-uuid/82E0DB93E0DB8BB3";
    fsType = "ntfs-3g";
    options = ["rw" "uid=1000"];
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 20 * 1024;
    }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

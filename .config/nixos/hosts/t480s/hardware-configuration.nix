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

  boot.initrd.availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/32a16691-2bc5-45d1-8fce-836a75dc8b9d";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-7ecb880f-36a6-4f2c-9fbb-9468199d17ea".device = "/dev/disk/by-uuid/7ecb880f-36a6-4f2c-9fbb-9468199d17ea";
  boot.initrd.luks.devices."luks-e5ebf916-fe8b-4928-b687-7911d37fc6a8".device = "/dev/disk/by-uuid/e5ebf916-fe8b-4928-b687-7911d37fc6a8";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/32F5-966D";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/77c918d3-250f-4ef3-9f95-43225ef56d4c";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

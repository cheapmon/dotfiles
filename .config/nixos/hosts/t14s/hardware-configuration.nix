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

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "thunderbolt" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e42c7741-10d4-4814-8649-7ca69b1060e7";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-10d5c8a8-e4fa-4f55-b7d7-8d0e9fee5926".device = "/dev/disk/by-uuid/10d5c8a8-e4fa-4f55-b7d7-8d0e9fee5926";
  boot.initrd.luks.devices."luks-f84b0751-275e-4fdb-9b30-8c2d8296253e".device = "/dev/disk/by-uuid/f84b0751-275e-4fdb-9b30-8c2d8296253e";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A1EC-02EB";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/5126d342-7e82-491b-b8ac-c415e81a6744";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

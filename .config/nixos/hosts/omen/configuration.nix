{config, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  system.stateVersion = "23.11";

  networking.hostName = "omen";

  boot.loader.grub.useOSProber = true;

  # Debugging hard freezes: turn lockups into panics + reboot so a dump
  # lands in pstore, and allow full SysRq to test if the kernel is alive.
  boot.kernel.sysctl = {
    "kernel.sysrq" = 1;
    "kernel.panic" = 10;
    "kernel.hardlockup_panic" = 1;
    "kernel.softlockup_panic" = 1;
  };
  services.journald.settings.Journal.SyncIntervalSec = "5s";

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.sessionVariables = {
    MONITOR = "";
    MONITOR_LEFT = "HDMI-A-1";
    MONITOR_RIGHT = "DP-1";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}

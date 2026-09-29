{pkgs, ...}: {
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  boot.extraModprobeConfig = "options hid_apple fnmode=0";
  boot.blacklistedKernelModules = ["pcspkr"];

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      default = "saved";
      # /boot is only 256M and each kernel+initrd pair is ~50M, so keep this low.
      # Older generations stay in the profile (see programs.nh.clean).
      configurationLimit = 2;
      theme = "${
        pkgs.catppuccin.override {
          variant = "mocha";
          accent = "sapphire";
          themeList = ["grub"];
        }
      }/grub";
    };
  };

  boot.plymouth = {
    enable = true;
    theme = "catppuccin-mocha";
    themePackages = [
      (pkgs.catppuccin.override {
        variant = "mocha";
        accent = "sapphire";
        themeList = ["plymouth"];
      })
    ];
  };
}

{
  config,
  pkgs,
  inputs,
  ...
}: {
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
      default = "saved";
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

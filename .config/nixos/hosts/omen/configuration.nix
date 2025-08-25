{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/defaults.nix
    ../../modules/work.nix
  ];

  system.stateVersion = "23.11";

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
    default = "saved";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "omen";

  environment.sessionVariables = rec {
    MONITOR = "";
    MONITOR_LEFT = "HDMI-A-1";
    MONITOR_RIGHT = "DP-1";
    AUTORANDR_PROFILE = "omen";

    WORK = "yes";
    TOUCHPAD = "";

    VIM_COLORSCHEME = "catppuccin-mocha";
    FZF_DEFAULT_OPTS = ''
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
      --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    '';
  };
}

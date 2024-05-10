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
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "omen";

  environment.sessionVariables = rec {
    MONITOR = "";
    MONITOR_LEFT = "DP-1";
    MONITOR_RIGHT = "HDMI-1";
    AUTORANDR_PROFILE = "omen";

    WORK = "yes";
    TOUCHPAD = "";

    VIM_COLORSCHEME = "catppuccin-latte";
    TMUX_COLORSCHEME = "latte";
    FZF_DEFAULT_OPTS = ''
      --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
      --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
      --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
    '';
  };
}

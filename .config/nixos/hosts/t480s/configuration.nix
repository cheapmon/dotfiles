{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/defaults.nix
  ];

  system.stateVersion = "23.11";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "t480s";

  environment.sessionVariables = rec {
    MONITOR = "eDP-1";
    MONITOR_LEFT = "";
    MONITOR_RIGHT = "";
    AUTORANDR_PROFILE= "t480s";

    WORK = "";
    TOUCHPAD = "Elan Touchpad";

    VIM_COLORSCHEME = "catppuccin-mocha";
    TMUX_COLORSCHEME = "mocha";
    FZF_DEFAULT_OPTS = ''
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
      --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    '';
  };
}

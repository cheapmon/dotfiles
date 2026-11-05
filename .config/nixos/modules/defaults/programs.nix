{pkgs, ...}: {
  programs.dconf.enable = true;
  programs.zsh = {
    enable = true;
    # ~/.zshrc runs compinit itself and uses starship for the prompt
    enableGlobalCompInit = false;
    promptInit = "";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # uwsm starts graphical-session.target (needed by xdg-desktop-portal).
    # It also matches the cached nixpkgs build, which has uwsm enabled.
    withUWSM = true;
  };

  programs.hyprlock.enable = true;

  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      openssl
    ];
  };
  programs.steam.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/seims/.config/nixos";
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 7d";
    };
  };
}

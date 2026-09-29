{
  pkgs,
  inputs,
  ...
}: {
  programs.dconf.enable = true;
  programs.zsh = {
    enable = true;
    # ~/.zshrc runs compinit itself and uses starship for the prompt
    enableGlobalCompInit = false;
    promptInit = "";
  };

  imports = [inputs.hyprland.nixosModules.default];
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    plugins = [inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3];
  };

  # Hyprland (launched directly from SDDM, without uwsm) never activates
  # graphical-session.target on its own, and that target refuses manual
  # `systemctl start` (RefuseManualStart=yes). Without it, xdg-desktop-portal
  # (Requisite=graphical-session.target) can never start, breaking screen
  # sharing entirely. This proxy target BindsTo it so hyprland's exec-once
  # (`systemctl --user start hyprland-session.target`) can pull it in as a
  # dependency, which systemd allows.
  systemd.user.targets.hyprland-session = {
    description = "hyprland compositor session";
    bindsTo = ["graphical-session.target"];
    wants = ["graphical-session-pre.target"];
    after = ["graphical-session-pre.target"];
  };

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

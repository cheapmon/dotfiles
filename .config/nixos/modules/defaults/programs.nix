{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.dconf.enable = true;
  programs.zsh.enable = true;

  imports = [inputs.hyprland.nixosModules.default];
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    plugins = [inputs.hy3.packages.x86_64-linux.hy3];
  };

  # Hyprland (launched directly from GDM, without uwsm) never activates
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
}

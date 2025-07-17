{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
}

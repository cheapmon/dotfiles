{
  config,
  pkgs,
  inputs,
  ...
}: {
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term
    nerd-fonts.jetbrains-mono
    material-icons
    roboto
    scientifica
  ];
}

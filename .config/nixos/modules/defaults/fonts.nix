{
  config,
  pkgs,
  inputs,
  ...
}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["IosevkaTerm" "JetBrainsMono"];})
    material-icons
    roboto
    scientifica
  ];
}

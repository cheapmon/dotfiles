{ config, pkgs, inputs, ... }:

{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
    material-icons
  ];
}

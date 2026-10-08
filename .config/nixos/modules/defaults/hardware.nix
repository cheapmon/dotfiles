{
  pkgs,
  inputs,
  ...
}: let
  # Hyprland's flake pins its own nixpkgs; its libgbm must match the system
  # Mesa driver or GBM init fails and Hyprland aborts on startup.
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    package = pkgs-hyprland.mesa;
    package32 = pkgs-hyprland.pkgsi686Linux.mesa;
  };
  # Installs solaar and its udev rules (hidraw access for the receiver).
  programs.solaar.enable = true;
}

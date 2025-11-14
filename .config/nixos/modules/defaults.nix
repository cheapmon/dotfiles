{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./defaults/console.nix
    ./defaults/environment.nix
    ./defaults/fonts.nix
    ./defaults/hardware.nix
    ./defaults/home-manager.nix
    ./defaults/i18n.nix
    ./defaults/networking.nix
    ./defaults/nix.nix
    ./defaults/nixpkgs.nix
    ./defaults/programs.nix
    ./defaults/security.nix
    ./defaults/services.nix
    ./defaults/time.nix
    ./defaults/users.nix
    ./defaults/virtualisation.nix
  ];
}

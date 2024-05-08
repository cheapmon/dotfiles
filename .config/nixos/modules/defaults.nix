{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
    ./defaults/console.nix
    ./defaults/environment.nix
    ./defaults/fonts.nix
    ./defaults/home-manager.nix
    ./defaults/i18n.nix
    ./defaults/networking.nix
    ./defaults/nix.nix
    ./defaults/nixpkgs.nix
    ./defaults/programs.nix
    ./defaults/services.nix
    ./defaults/time.nix
    ./defaults/users.nix
  ];
}

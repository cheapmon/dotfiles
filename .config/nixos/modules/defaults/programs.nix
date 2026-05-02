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

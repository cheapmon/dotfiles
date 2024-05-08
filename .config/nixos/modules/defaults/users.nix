{ config, pkgs, inputs, ... }:

{
  users.users.seims = {
    isNormalUser = true;
    description = "Simon Kaleschke";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.defaultUserShell = pkgs.zsh;
}

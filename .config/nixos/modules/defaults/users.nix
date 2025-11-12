{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.groups.plugdev = {};
  users.extraGroups.vboxusers.members = ["seims"];

  users.users.seims = {
    isNormalUser = true;
    description = "Simon Kaleschke";
    extraGroups = ["networkmanager" "wheel" "audio" "docker" "plugdev"];
  };

  users.defaultUserShell = pkgs.zsh;
}

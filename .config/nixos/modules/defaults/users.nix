{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.seims = {
    isNormalUser = true;
    description = "Simon Kaleschke";
    extraGroups = ["networkmanager" "wheel" "audio" "docker"];
  };

  users.defaultUserShell = pkgs.zsh;
}

{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.seims = {
    isNormalUser = true;
    description = "Simon Kaleschke";
    extraGroups = ["networkmanager" "wheel" "audio"];
  };

  users.defaultUserShell = pkgs.zsh;
}

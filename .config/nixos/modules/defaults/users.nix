{pkgs, ...}: {
  users.groups.plugdev = {};

  users.users.seims = {
    isNormalUser = true;
    description = "Simon Kaleschke";
    extraGroups = ["networkmanager" "wheel" "audio" "docker" "plugdev" "vboxusers"];
    linger = true;
  };

  users.defaultUserShell = pkgs.zsh;
}

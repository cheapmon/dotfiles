{pkgs, ...}: {
  users.users.seims = {
    isNormalUser = true;
    description = "Simon Kaleschke";
    extraGroups = ["networkmanager" "wheel" "audio" "docker" "vboxusers"];
    linger = true;
  };

  users.defaultUserShell = pkgs.zsh;
}

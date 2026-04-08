{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Create /bin and /usr/bin symlinks for compatibility with non-NixOS tooling
  system.activationScripts.bincompat = ''
    mkdir -p /bin
    ln -sfn ${pkgs.coreutils}/bin/mkdir /bin/mkdir
    ln -sfn ${pkgs.coreutils}/bin/install /bin/install
    mkdir -p /usr/bin
    ln -sfn ${pkgs.coreutils}/bin/install /usr/bin/install
  '';
}

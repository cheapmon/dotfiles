{
  config,
  pkgs,
  inputs,
  ...
}: {
  security.rtkit.enable = true;
}

{...}: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import ./_overlays/bubblewrap-capabilities.nix)
    (import ./_overlays/waybar-hyprland-lua-dispatch.nix)
    (import ./_overlays/opencode-node-modules-hash.nix)
  ];
}

# opencode 2.2.5's node_modules fixed-output hash is wrong on Linux.
# Fixed upstream in nixpkgs c399e1b7fb ("opencode: fix hash").
# TODO: drop once nixos-unstable has it.
final: prev: {
  opencode = prev.opencode.overrideAttrs (oldAttrs: {
    node_modules = oldAttrs.node_modules.overrideAttrs {
      outputHash = "sha256-prx9dX7kUvs/E3zopkaPk5LXh3xJAy5sZeum/W8L7cA=";
    };
  });
}

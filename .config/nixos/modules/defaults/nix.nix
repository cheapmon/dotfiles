{...}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];

    # Hyprland and hy3 come from their own flakes, not nixpkgs, so without
    # this cache every update compiles them from source.
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}

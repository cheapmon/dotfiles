{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    import-tree = {
      url = "github:denful/import-tree";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland?ref=v0.55.4";
    };
    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.55.0";
      inputs.hyprland.follows = "hyprland";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations = nixpkgs.lib.genAttrs ["default" "t480s" "omen" "l16"] (host:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          inputs.home-manager.nixosModules.default
          (inputs.import-tree ./modules/defaults)
          (inputs.import-tree ./modules/extras)
          ./hosts/${host}/configuration.nix
        ];
      });

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}

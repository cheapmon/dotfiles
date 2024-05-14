{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          inputs.home-manager.nixosModules.default
          ./hosts/default/configuration.nix
        ];
      };
      t480s = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          inputs.home-manager.nixosModules.default
          ./hosts/t480s/configuration.nix
        ];
      };
      omen = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          inputs.home-manager.nixosModules.default
          ./hosts/omen/configuration.nix
        ];
      };
      t14s = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          inputs.home-manager.nixosModules.default
          ./hosts/t14s/configuration.nix
        ];
      };
    };
  };
}

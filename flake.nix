{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
        url = "github:nix-community/home-manager/release-24.11"
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs: {

        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
                ./configuration.nix
                inputs.home-manager.nixusModules.default
            ]
        }
    #   packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    #   packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    };
}

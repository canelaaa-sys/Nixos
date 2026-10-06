{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
  };
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      specialArgs = { inherit inputs; };

      modules = [
        ./hardware-configuration.nix
	./configuration.nix
      ];

    };

  };

}

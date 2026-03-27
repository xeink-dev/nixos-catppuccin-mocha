{
  description = "My own NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        c = import ./home/xeink/mocha.nix;
      };
      modules = [
        stylix.nixosModules.stylix
      	./hosts/default/default.nix
	home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit inputs;
            c = import ./home/xeink/mocha.nix;
          };
          home-manager.users.xeink = import ./home/home.nix;
	}
      ];
    };
  };
}

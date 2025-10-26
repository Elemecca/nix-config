{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, lanzaboote, home-manager, ... }: {
    nixosConfigurations.selkie = nixpkgs.lib.nixosSystem {
      modules = [
        lanzaboote.nixosModules.lanzaboote
        ./hosts/selkie

	home-manager.nixosModules.home-manager {
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.maia = import ./home;
	}
      ];
    };
  };
}


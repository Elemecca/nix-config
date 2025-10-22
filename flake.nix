{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, lanzaboote, ... }: {
    nixosConfigurations.selkie = nixpkgs.lib.nixosSystem {
      modules = [
        lanzaboote.nixosModules.lanzaboote
        ./hosts/selkie
      ];
    };
  };
}


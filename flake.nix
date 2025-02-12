{
  description = "My nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    ...
  } @ inputs: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#trinculo
    darwinConfigurations.trinculo = nix-darwin.lib.darwinSystem {
      modules = [ ./nix/home ];
    };
  };
}

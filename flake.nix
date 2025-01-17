{
  description = "My nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#akiomi@trinculo'
    homeConfigurations = {
      "akiomi@trinculo" = home-manager.lib.homeManagerConfiguration {
        # NOTE: home-manager does not support per-system configulation
        #       https://github.com/nix-community/home-manager/issues/3075
        pkgs = nixpkgs.legacyPackages.aarch64-darwin; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          # > Our main home-manager configuration file <
          ./nix/home
        ];
      };
    };
  };
}

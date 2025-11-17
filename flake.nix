{
  description = "morning flake";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eden = {
      url = "github:grantimatter/eden-flake";
    };
    helium.url = "github:FKouhai/helium2nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak/";
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, stylix, nvf, nur, eden, helium, nixvim, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations.snowflake = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        nur.modules.nixos.default
        nixvim.nixosModules.default
        eden.nixosModules.default
        stylix.nixosModules.stylix
        nvf.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.mine = import ./home.nix;
        }
      ];

      specialArgs = { inherit inputs; };
    };
  };
}


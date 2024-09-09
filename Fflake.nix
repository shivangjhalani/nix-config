{
  description = ":)";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
<<<<<<< HEAD

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    spicetify-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
    host = "laptop";
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        modules = [./hosts/${host}/configuration.nix];
      };
    };
    homeConfigurations = {
      shivang = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./hosts/${host}/home.nix
        ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit inputs;
          inherit spicetify-nix;
=======
  outputs = { self, nixpkgs, home-manager, nixvim, spicetify-nix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      lib = nixpkgs.lib;
      host = "laptop";
    in {
      packages.${system} = {
        default = pkgs.writeShellScriptBin "hello" ''
          echo "Hello from ${host}!"
        '';
      };
      nixosConfigurations = {
        ${host} = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./hosts/${host}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.sjay = import ./hosts/${host}/home.nix;
              home-manager.extraSpecialArgs = { inherit inputs spicetify-nix; };
            }
          ];
>>>>>>> 8e2eb364174c90b4ba8e3fcfbd570398a05d2d33
        };
      };
    };
  };
}

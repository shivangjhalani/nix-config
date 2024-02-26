{
  description = ":)";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
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


  outputs = { self, nixpkgs, home-manager, nixvim, spicetify-nix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
      lib = nixpkgs.lib;
      host = "laptop";
    in {
      nixosConfigurations = {
	nixos = lib.nixosSystem {
	  modules = [ ./hosts/${host}/configuration.nix	];
	};
      };
      homeConfigurations = {
	sjay = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  # Specify your home configuration modules here, for example,
	  # the path to your home.nix.
	  modules = [ 
	    ./hosts/${host}/home.nix 
	  ];
	  # Optionally use extraSpecialArgs
	  # to pass through arguments to home.nix
	  extraSpecialArgs = { inherit inputs; inherit spicetify-nix;};
        };
      };
    };
}

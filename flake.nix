{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    nixpkgs-master.url = "github:nixos/nixpkgs";

    # Flakes
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # impermanence = {
    #   url = "github:nix-community/impermanence";
    # };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyperland / Wayland related flakes
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Catppuccin theming
    nix-colors = {
      url = "github:misterio77/nix-colors";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Custom Flakes
    # nixvim = {
    #   url = "github:dc-tec/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # niks-cli.url = "github:dc-tec/niks-cli";

    # Others
    nur.url = "github:nix-community/NUR";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Upstream sources
    # llama-cpp-src = {
    #   url = "github:ggml-org/llama.cpp";
    #   flake = false;
    # };

    # Documentation
    ndg.url = "github:feel-co/ndg";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      # impermanence,
      hyprland,
      hyprpaper,
      hyprlock,
      # nixvim,
      nur,
      # niks-cli,
      nix-colors,
      catppuccin,
      sops-nix,
      # nixos-wsl,
      # firefox-addons,
      # darwin,
      ndg,
      pre-commit-hooks,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];

      lib =
        system:
        nixpkgs.lib.recursiveUpdate (import ./lib {
          pkgs = nixpkgs.legacyPackages.${system};
          lib = nixpkgs.lib;
        }) nixpkgs.lib;

      sharedModules = [
        (
          {
            inputs,
            outputs,
            lib,
            config,
            pkgs,
            ...
          }:
          {
            nixpkgs = {
              overlays = [
                (import ./overlays { inherit inputs; }).additions
                (import ./overlays { inherit inputs; }).stable-packages
                (import ./overlays { inherit inputs; }).force-latest
              ];
            };
          }
        )
        ./modules/shared
      ];

      nixosModules = [
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager
        catppuccin.nixosModules.catppuccin
        nur.modules.nixos.default

        ./modules/nixos
      ];
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          rawModules = [
            ./modules/shared
            ./modules/nixos # linux-specific bits
            ./modules/darwin # macOS-specific bits
          ];
        in
        (import ./pkgs { inherit pkgs; })
        // {
          docs = ndg.packages.${system}.ndg-builder.override {
            title = "NixOS Configuration";
            inputDir = ./docs;
            rawModules = rawModules;
            optionsDepth = 3;
          };
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default =
            with pkgs;
            mkShell {
              inherit (self.checks.${system}.pre-commit-check) shellHook;
              NIX_CONFIG = "experimental-features = nix-command flakes";
            };
        }
      );

      formatter = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        pkgs.nixfmt-rfc-style
      );

      checks = forAllSystems (system: {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            statix.enable = false;
            nixfmt-rfc-style.enable = true;
          };
        };
      });

      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        swift = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            lib = lib "x86_64-linux";
          };
          modules = sharedModules ++ nixosModules ++ [ ./machines/swift/default.nix ];
        };
      };
    };
}

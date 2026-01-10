{
  inputs,
  lib,
  pkgs,
  config,
  outputs,
  ...
}:
{
  imports = [
    #../features/nvim
    # ./nixvim
    ./direnv.nix

  ]
  ++ (builtins.attrValues outputs.homeModules);

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      #      experimental-features = [
      #        "nix-command"
      #        "flakes"
      #        "ca-derivations"
      #      ];
      warn-dirty = false;
    };
  };

  home = {
    packages = with pkgs; [
      inputs.nixvim.packages.${pkgs.system}.default
    ];
  };

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "shivang";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "24.05";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      FLAKE = "$HOME/Documents/NixConfig";
    };
  };
}

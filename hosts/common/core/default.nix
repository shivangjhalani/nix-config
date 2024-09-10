# This file (and the global directory) holds config that i use on all hosts
{
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      inputs.home-manager.nixosModules.home-manager
      ./zsh.nix
      ./nix.nix
      ./locale.nix
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=120 # only ask for password every 2h
    # Keep SSH_AUTH_SOCK so that pam_ssh_agent_auth.so can do its magic.
    # Defaults env_keep + =SSH_AUTH_SOCK
  '';

  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
}

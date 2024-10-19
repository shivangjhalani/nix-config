{ pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
    };

  };
  users.users.shivang.extraGroups = [ "docker" ];
}

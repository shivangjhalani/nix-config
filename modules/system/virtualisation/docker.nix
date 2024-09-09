{
  #https://nixos.wiki/wiki/Docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = ["shivang"];
  virtualisation.docker.daemon.settings = {
    data-root = "/home/shivang/shivang/dev/docker/data-root/";
  };

  #To make sure some docker containers are running as systemd services, you can use 'oci-containers':
  #virtualisation.oci-containers = {
  #  backend = "docker";
  #  containers = {
  #    foo = {
  #    # ...
  #    };
  #  };
  #};
}

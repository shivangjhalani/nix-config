{
#https://nixos.wiki/wiki/Docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "sjay" ];
  virtualisation.docker.daemon.settings = {
    #data-root = "/some-place/to-store-the-docker-data";
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

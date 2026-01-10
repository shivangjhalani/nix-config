{
  inputs,
  outputs,
  config,
  ...
}:
{
  imports = [
    #../features/nvim
    ./virtualisation
    ./steam
  ];

  # services.zerotierone = {
  #   enable = true;
  #   joinNetworks = [
  #     "af78bf94369980a7"
  #   ];
  # };

  # services.avahi.enable = true;
  # services.avahi.nssmdns = true;
  # services.avahi.openFirewall = true;
  # services.avahi.publish = {
  #   enable = true;
  #   addresses = true;
  #   userServices = true;
  #   domain = true;
  #   workstation = true;
  # };
}

{
  virtualisation = {
    virtualbox = {
      host = {
        enable = true;
      };
      guest = {
        enable = true;
        clipboard = true;
      };
    };
  };
  users.extraGroups.vboxusers.members = [ "shivang" ];
}

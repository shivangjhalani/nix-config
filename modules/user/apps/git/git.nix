{ config, pkgs, ... }:

{
  #home.packages = [ pkgs.git ];
  programs.git = {
    enable = true;
    userName = "shivangjhalani";
    userEmail = "shivang2004jhalani@gmail.com";
    extraConfig = {
      credential.helper = "${
	pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
      init.defaultBranch = "main";
    };
  };
}

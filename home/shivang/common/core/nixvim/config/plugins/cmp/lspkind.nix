#CURRENTLY CLASHES WITH CMP
{
  programs.nixvim = {
    plugins.lspkind = {
      cmp.enable = true;
      symbolMap = {
        Copilot = "";
      };
      enable = true;
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };
}

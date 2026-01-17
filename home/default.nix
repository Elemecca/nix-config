{ config, pkgs, ... }:

{
  home.username = "maia";
  home.homeDirectory = "/home/maia";

  imports = [
    ./devtools.nix
    ./mail.nix
    ./security.nix
    ./shell.nix
  ];

  programs.discord.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}

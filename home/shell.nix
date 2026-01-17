{ config, pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "Solarized_Dark";
    settings = {
      enable_audio_bell = false;
      window_padding_width = 1;
    };
  };

  home.shellAliases = {
    ls = "ls -Alh";
    psf = "ps -fN --pid 2 --ppid 2 --forest";
    vim = "nvim";
    view = "nvim -R";
  };

  home.shell.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}

{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    devenv
    jetbrains.phpstorm
  ];

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    lfs.enable = true;
    settings = {
      user.name = "Sam Hanes";
      user.email = "sam@maltera.com";
      core.whitespace = "tabwidth=4";
      push.default = "upstream";
      pull.rebase = false;
      color.ui = "auto";
    };
  };
}

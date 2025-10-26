{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.maia = {
    isNormalUser = true;
    description = "Maia";
    extraGroups = [ "wheel" ];
  };
}

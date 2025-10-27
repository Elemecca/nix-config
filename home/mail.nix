{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    protonmail-bridge
  ];

  systemd.user.services.protonmail-bridge = {
    Unit = {
      Description = "Proton Mail Bridge";
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.protonmail-bridge} --noninteractive";
      Restart = "always";
    };
  };
}

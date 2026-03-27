{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extest.enable = true;
  };

  programs.gamemode.enable = true;

  programs.gamescope.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
  ];
}

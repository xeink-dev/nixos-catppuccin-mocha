{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    catppuccin-kvantum
  ];

  qt = {
    enable = true;
    platformTheme.name = lib.mkForce "kvantum";
    style.name = lib.mkForce "kvantum";
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Catppuccin-Mocha-Mauve
  '';
}

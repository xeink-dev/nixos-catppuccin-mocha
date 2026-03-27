{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = "catppuccin-sddm-corners";

    settings = {
      General = {
        InputMethod = "";
      };
      Theme = {
        CursorTheme = "catppuccin-mocha-rosewater-cursors";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    catppuccin-sddm-corners

    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtsvg
  ];
}

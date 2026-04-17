{ pkgs, ... }:

{

  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    # wayland.enable = true;

    theme = "catppuccin-sddm-corners";

    settings = {
      General = {
        InputMethod = "";
      };
      Theme = {
        CursorTheme = "catppuccin-mocha-rosewater-cursors";
      };
    };

    extraPackages = with pkgs; [
      kdePackages.qt5compat
      kdePackages.qtdeclarative
      kdePackages.qtsvg
    ];
  };

  environment.systemPackages = with pkgs; [
    catppuccin-sddm-corners
  ];
}

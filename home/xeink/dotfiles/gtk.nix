{ pkgs, c, lib, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = lib.mkForce "catppuccin-mocha-mauve-standard";
      package = lib.mkForce (pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        variant = "mocha";
      });
    };

    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = lib.mkForce (pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      });
    };
  };
}

{ pkgs, ... }:

{
    home.pointerCursor = {
        package = pkgs.catppuccin-cursors.mochaRosewater;
        name = "catppuccin-mocha-rosewater-cursors";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };
}

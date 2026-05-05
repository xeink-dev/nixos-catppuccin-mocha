{ pkgs, ... }:

let
  wall = "/home/xeink/nixos/home/xeink/dotfiles/SPACE/wall.png";
in
{
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wall}

    wallpaper = ,${wall}

    splash = false

    ipc = on
  '';
}

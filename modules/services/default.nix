{ ... }:

{
  imports = [
    ./dbus.nix
    ./printing.nix
    ./disk.nix
    ./bluetooth.nix
    ./throne.nix
    ./sddm.nix
    ./tailscale.nix
    # ./flclashx.nix
    # ./steam.nix
  ];
}

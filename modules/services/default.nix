{ ... }:

{
  imports = [
    ./dbus.nix
    ./printing.nix
    ./disk.nix
    ./bluetooth.nix
    ./vpn.nix
    ./sddm.nix
    ./tailscale.nix
    # ./ai.nix
    ./steam.nix
  ];
}

{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    fastfetch
    btop
    pkgs.polkit_gnome
    xhost
    nano
    appimage-run
    iptables
    iproute2
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;
}

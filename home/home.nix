{ config, pkgs, c, ... }:

let
  core = with pkgs; [
    gparted
    atuin
    bat
    zsh
    eza
    yazi
    ouch
    kdePackages.ark
    bluetuith
    pulsemixer
    popsicle
    fish
    grc
    qalculate-gtk
  ];

  gui = with pkgs; [
    kitty
    kdePackages.qt6ct
    nwg-look
    nemo
    rofi
    mako
    waybar
    hypridle
    hyprlock
    swaybg
    hyprpicker
    wl-clipboard
    playerctl

    # SCREENSHOT
    grim
    slurp
    swappy

    # ANIMATIONS
    asciiquarium
    cmatrix
    cava

  ];

  dev = with pkgs; [
    zed-editor
    neovim
    lazygit
    gh

    # SYSTEM
    gcc
    pkg-config
    openssl
    binutils
    gnumake

    # RUST
    (rust-bin.stable.latest.default.override {
     extensions = [
       "rust-src"
       "rust-analyzer"
       "clippy"
       "rustfmt"
     ];
    })

    # PYTHON
    python3
    pyright
    black

  ];

  web = with pkgs; [
    firefox
    chromium
    ayugram-desktop
    qbittorrent
  ];

  media = with pkgs; [
    kdePackages.okular
    imv
    mpv
  ];

  daily = with pkgs; [
    obsidian
    vitetris
  ];
in

{
  home.username = "xeink";
  home.homeDirectory = "/home/xeink";

  # home.backupFileExtension = "backup";

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";

  home.packages =
    core ++
    gui ++
    dev ++
    web ++
    media ++
    daily;

  imports = [
    ./xeink/dotfiles
    ./xeink/programs
    ./xeink/dirs.nix
  ];
}

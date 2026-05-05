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
    peazip
    kdePackages.ark
    bluetuith
    pulsemixer
    popsicle
    fish
    grc
    qalculate-gtk
    bottles
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
    hyprpaper
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
    vscode
    neovim
    lazygit
    gh
    bun
    pencil

    # SYSTEM
    pkg-config
    openssl

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

    # GO
    go
    gopls

    # FREE PASCAL
    fpc

    # ASSEMBLER
    nasm
    binutils
    gdb

    # C & C++
    gcc
    clang-tools
    gnumake

  ];

  web = with pkgs; [
    firefox
    chromium
    ayugram-desktop
    qbittorrent
    tor-browser
  ];

  media = with pkgs; [
    kdePackages.okular
    eog
    vlc
    kdePackages.kdenlive
    gimp2-with-plugins
    youtube-music
  ];

  daily = with pkgs; [
    obsidian
    libreoffice
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

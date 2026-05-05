{ ... }:

{
  imports = [
    ./boot.nix
    ./packages.nix
    ./network.nix
    ./clean.nix
    ./shell.nix
    ./tlp.nix
    ./nix-ld.nix
    ./swap.nix
  ];
}

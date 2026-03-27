{ pkgs, ... }:

{
  # programs.zsh.enable = true;
  programs.fish.enable = true;

  users.users.xeink.shell = pkgs.fish;
}

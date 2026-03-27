{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.xeink.shell = pkgs.zsh;
}

{ c, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "extract" ];
    };

    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza -lgh --icons";
      la = "eza -lagh --icons";
      tree = "eza --tree";
      cat = "bat";
      ff = "fastfetch";
      clean = "sudo nix-collect-garbage -d";
      switch = "sudo nixos-rebuild switch --flake .#default";
      upd = "nix flake update";
      add = "git add .";
      cdn = "cd nixos";
      tea = "ssh uchebnick@100.64.70.125";
      teacode = "ssh -N -L 18080:127.0.0.1:18080 uchebnick@100.64.70.125";
    };

    initExtra = ''
      # zstyle ':completion:*' list-colors "di=38;2;${c.blue}:ln=38;2;${c.teal}:ex=38;2;${c.green}"

      # PROMPT='%F{${c.green}}%n%f%F{${c.yellow}}@%f%F{${c.blue}}%m%f %F{${c.red}}%~>%f '

      eval "$(atuin init zsh)"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      format = "$username$hostname$directory$git_branch$character";

      username = {
        show_always = true;
        style_user = "bold red";
        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        style = "bold blue";
        format = "[@](green)[$hostname]($style) ";
      };

      directory = {
        style = "bold yellow";
        format = "[$path]($style)[$read_only]($read_only_style) ";
      };

      character = {
        success_symbol = "[~>](bold green)";
        error_symbol = "[~>](bold red)";
      };
    };
  };
}

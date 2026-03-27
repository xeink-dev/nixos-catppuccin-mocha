{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting ""

      ${pkgs.atuin}/bin/atuin init fish | source

      # fastfetch
    '';

    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza -lgh --icons";
      la = "eza -lagh --icons";
      tree = "eza --tree";
      cat = "bat";
      ff = "fastfetch";
      clean = "sudo nix-collect-garbage -d";
      nixsw = "sudo nixos-rebuild switch --flake .#default";
      upd = "nix flake update";
      add = "git add .";
      cdn = "cd ~/nixos";
      tea = "ssh uchebnick@100.64.70.125";
      teacode = "ssh -N -L 18080:127.0.0.1:18080 uchebnick@100.64.70.125";
      commit = "git commit -m \"update: $(date +%Y-%m-%d-%H:%M)\"";
      lg = "lazygit";

        sync = "git add . && git commit -m 'sync: $(date +%H:%M)' && git push origin main && sudo nixos-rebuild switch --flake .#default";

        rm = "rm -i";

        h = "history | grep";

        ".." = "cd ..";
        "..." = "cd ../..";

        top = "btop";

        nix-logs = "journalctl -u nixos-rebuild --since '10 minutes ago'";

        grep = "rg";
    };

    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "done"; src = pkgs.fishPlugins.done.src; }
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
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

      git_branch = {
        symbol = " ";
        format = "[$symbol$branch]($style) ";
        style = "bold purple";
      };
    };
  };
}

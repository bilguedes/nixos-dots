{ config, pkgs, ...}:

{
  home.username = "mine";
  home.homeDirectory = "/home/mine";
  home.stateVersion = "25.11";

  programs.git.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "i use nixOS, btw";
      ff = "fastfetch";
      neofetch = "fastfetch -c neofetch";
      config = "sudo -E nvim /etc/nixos/configuration.nix";
      home = "sudo -E nvim /etc/nixos/home.nix";
      flake = "sudo -E nvim /etc/nixos/flake.nix";
      rebuild = "nh os switch /etc/nixos";
      boot = "nh os boot /etc/nixos";
    };
   # initExtra = ''
    #  export PS1='\[\e[38;5;112m\]\u@\h\[\e[0m\] \[\e[38;5;69m\]\W\[\e[0m\] \\$ '   
    #  '';
  };

  programs.nushell = {
    enable = true;
    extraConfig = ''
     $env.config = {
        show_banner: false,
     }
    '';
    shellAliases = {
      btw = "i use nixOS, btw";
      ff = "fastfetch";
      neofetch = "fastfetch -c neofetch";
      config = "sudo -E nvim /etc/nixos/configuration.nix";
      home = "sudo -E nvim /etc/nixos/home.nix";
      flake = "sudo -E nvim /etc/nixos/flake.nix";
      rebuild = "nh os switch /etc/nixos";
      boot = "nh os boot /etc/nixos";
    };
  };

  programs.starship = {
      enable = true;
  };

  programs.kitty = {
      enable = true;
      settings = {
          shell = "nu";
          editor = "nvim";
          window_margin_width = 8;
          placement_strategy = "center";
      };
      # font = {
      #     name = "Iosevka NF";
      #     size = 14;
      # };
      # themeFile = "gruvbox-dark-soft";
  };

  programs.alacritty = {
      enable = true;
      settings = {
          # window.opacity = 1;
      #     font.normal = {
      #         family = "Iosevka NF";
      #         style = "Regular";
      #     };
      # font.size = 14;
      };
  };

  programs.firefox = {
      enable = true;
      profiles.mine = {
         extensions = {
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              privacy-badger
              ublock-origin
              darkreader
              violentmonkey
            ];
        };
         settings = {
            "browser.search.defaultenginename" = "duckduckgo";
            "extensions.autoDisableScopes" = 0;
            "browser.search.suggest.enabled.private" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.pinned" = [
          {
            title = "youtube";
            url = "https://www.youtube.com/";
           }
          {
            title = "reddit";
            url = "https://reddit.com/";
           }
          {
            title = "nixos-search";
            url = "https://search.nixos.org/";
          }
          {
            title = "mynixos";
            url = "https://mynixos.com/";
          }
          {
            title = "gitlab";
            url = "https://www.gitlab.com/";
          }
          {
            title = "github";
            url = "https://www.github.com/";
          }
          {
            title = "chatgpt";
            url = "https://chatgpt.com/";
          }
          {
            title = "grok";
            url = "https://grok.com/";
          }
        ];
        };
      };
  };

  home.packages = with pkgs; [
   fastfetch
   pfetch
   btop
   unimatrix
  ];
}

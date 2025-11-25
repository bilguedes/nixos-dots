{ config, pkgs, ... }:

{
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      fonts.sansSerif = {
        package = pkgs.noto-fonts-cjk-sans;
        name = "Noto Sans CJK Sans";
      };
      fonts.emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      fonts.monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka NF";
      };
      image = ./walls/mountains.jpg;
    };
}

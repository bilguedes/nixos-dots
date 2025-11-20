{ config, pkgs, ... }:
{
  stylix.enable = true;
  
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

  stylix.fonts.sansSerif = {
    package = pkgs.noto-fonts-cjk-sans;
    name = "Noto Sans CJK Sans";
  };

  stylix.fonts.emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
  };

  stylix.fonts.monospace = {
    package = pkgs.nerd-fonts.iosevka;
    name = "Iosevka NF";
  };
  stylix.image = ./walls/mountains.jpg;
}

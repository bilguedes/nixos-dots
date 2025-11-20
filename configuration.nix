{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nixvim.nix
      ./stylix.nix
    ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;
  # boot.plymouth.theme = "bgrt";

  networking.hostName = "snowflake";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # services.desktopManager.gnome.enable = true;
  # services.displayManager.gdm.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # programs.hyprland.enable = true;

  # services.displayManager.ly = {
  #  enable = true;
  #  settings = {
  #    animate = true;
  #    animation = "matrix";
  #    clock = "%c";
  #    bigclock = true;
  #    hide_f1_commands = true;
  #   };
  # };

  console.keyMap = "br-abnt2";

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.mine = {
    isNormalUser = true;
    description = "mine";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  services.flatpak.packages = [
   "org.vinegarhq.Sober"
   "com.usebottles.bottles"
  ];

  environment.systemPackages = with pkgs; [
   audacity
   bat
   # nautilus
   # showtime
   vesktop
   firefox
   ungoogled-chromium
   unzip
   unrar
   # nwg-look
   hydralauncher
   qbittorrent
   inputs.kwin-effects-forceblur.packages.${stdenv.hostPlatform.system}.default
   inputs.helium.defaultPackage.${stdenv.hostPlatform.system}
   prismlauncher
   dconf
   ollama
   distrobox
   hyprshot
   nh
   # wofi
   # waybar
   obs-studio
   # bibata-cursors
   # adwaita-icon-theme
   gimp
   parsec-bin
   base16-schemes
   hyprpaper
   hyprlock
   kdePackages.kdenlive
   jdk
   zed-editor
   zed-discord-presence
  ];

  programs.nix-ld.enable = true;

  programs.steam.enable = true;

  programs.eden = {
    enable = true;
    enableCache = true;
  };

  fonts.packages = with pkgs; [
  inter
  nerd-fonts.iosevka-term
  nerd-fonts.iosevka
  nerd-fonts.jetbrains-mono
  nerd-fonts.fira-code
  ];

  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };

  services.devmon.enable = true;
  services.gvfs.enable = true; 
  services.udisks2.enable = true;
 
  virtualisation.docker = {
    enable = true;
  };
  users.extraGroups.docker.members = [ "mine" ];
  
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.clipboard = true;
  users.extraGroups.vboxusers.members = [ "mine" ];

  services.power-profiles-daemon.enable = true;
  
  services.blueman.enable = true;

  hardware.bluetooth = { 
    enable = true;
    powerOnBoot = true;
  };

  system.stateVersion = "25.05";

}

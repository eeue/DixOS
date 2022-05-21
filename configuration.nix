# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "heaven"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "US/Eastern";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp6s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable DE
  services.xserver.desktopManager.gnome.enable = true;
  # Exclude Unused Gnome Packages
  environment.gnome.excludePackages = [
    pkgs.gnome.totem
    pkgs.gnome.eog
    pkgs.gnome.ghex
    pkgs.gnome.gedit
    pkgs.gnome.cheese
    pkgs.gnome.gnome-maps
    pkgs.gnome-photos
    pkgs.gnome.gnome-music
    pkgs.gnome.gucharmap
    pkgs.epiphany
    pkgs.gnome-online-accounts
    pkgs.gnome.gnome-weather
    pkgs.gnome-connections
    pkgs.gnome.gnome-terminal
    pkgs.gnome.gnome-calculator
    pkgs.evince
    pkgs.gnome.gnome-characters
    pkgs.gnome.simple-scan
    pkgs.gnome.gnome-contacts
    pkgs.gnome.geary
    pkgs.gnome.gnome-font-viewer
  ];

  # Auto Login
  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.displayManager.defaultSession = "none+i3";
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "ares";

  # Enable nvidia drivers for the GPU.
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  services.xserver.screenSection = ''
    Option         "metamodes" "1920x1080_240 +0+0 {ForceFullCompositionPipeline=On}"
    Option         "AllowIndirectGLXProtocol" "off"
    Option         "TripleBuffer" "on"
  '';

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound; Disable PulseAudio.
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  # Enabling PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  # X Compositor
  services.picom = {
    enable = true;
    fade = true;
    inactiveOpacity = 0.9;
    shadow = true;
    fadeDelta = 4;
    backend = "glx";
  };

  system.autoUpgrade.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ares = {
    home = "/home/ares";
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    micro # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    alacritty
    wine-staging
    winePackages.stagingFull
    firefox
    discord
    pipewire
    xsel
    neofetch
    awesome
    fish
    picom
    lightdm
    lutris
    steam
    steamPackages.steam-runtime
    i3-gaps
    zip
    unzip
    gnome.gnome-tweaks
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

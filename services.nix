{
# X.org/Display Services

services.xserver.enable = true;

services.xserver.displayManager.gdm.enable = true;

services.xserver.desktopManager.gnome.enable = true;

services.xserver.videoDrivers = ["nvidia"];

hardware.opengl.enable = true;

services.xserver.screenSection = ''
      Option         "metamodes" "1920x1080_240 +0+0 {ForceFullCompositionPipeline=On}"
      Option         "AllowIndirectGLXProtocol" "off"
      Option         "TripleBuffer" "on"
 '';

# Configure Keymap In X.org

## services.xserver.layout = "us";
## services.xserver.xkbOptions = "eurosign:e";

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Audio Services

sound.enable = true;
hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

# Printing Services

# Enable CUPS to print documents.
# services.printing.enable = true;

# Networking Services

# Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
 

}

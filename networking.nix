{
networking.hostName = "heaven"; # Define your hostname.
#networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant

# The global useDHCP flag is deprecated, therefore explicitly set to false here.
# Per-interface useDHCP will be mandatory in the future, so this generated config
# replicates the default behaviour.
networking.useDHCP = false;
networking.interfaces.enp6s0.useDHCP = true;

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}

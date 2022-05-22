{ config, pkgs, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.ares = {
     home = "/home/ares";
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   };

# Define default user shell. I like fish.
users.defaultUserShell = pkgs.fish;
}

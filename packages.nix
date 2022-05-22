{ config, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
   micro # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   alacritty
   neofetch
   wget
   git
   curl
   fish
   xsel
   discord
   firefox
   pipewire
   ];

   nixpkgs.config.allowUnfree = true;
}

{ inputs, hostname, username, fullname, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  disabledModules = [
    ./modules/xserver.nix
  ];

  nixpkgs.overlays = [ inputs.polymc.overlay ];

  networking.hostName = ${hostname}; # Define your hostname.

  time.timeZone = "America/Grenada"; # Set your time zone.

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

  system.stateVersion = "23.05"; # Don't change it bro
}

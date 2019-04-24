{ config, pkgs, ... }:

let 
  vimConfigured = import ./vim.nix { inherit pkgs; };
in {
  imports = [
    <home-manager/nix-darwin/default.nix>
  ];

  environment.systemPackages = [
    vimConfigured 
  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  users.users = {
    sueiraj = {
      name = "sueiraj";
      home = "/Users/sueiraj";
    };
  };

  nixpkgs.config = import ./config.nix;

  home-manager.users = {
    sueiraj = import ./home.nix { inherit pkgs; };
  };

  programs = {
    bash.enable = true;

    tmux = {
      enable = true;
      enableVim = true;
    };
  };

  system.stateVersion = 3;

  nix.maxJobs = 12;
  nix.buildCores = 12;
}

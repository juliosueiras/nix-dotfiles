{ pkgs, ... }:

let
  vimConfigured = import ./vim.nix { inherit pkgs; };

  hashicorp-tools = with pkgs; [
    terraform
    consul
    vault
    packer
    vagrant
    nomad
  ];
in {

  nixpkgs.config = import ./config.nix;

  home = {
    sessionVariables = {
      EDITOR = "${vimConfigured}";
    };

    packages = with pkgs; [
      docker
      vimConfigured
    ] ++ hashicorp-tools;
  };

  programs = {
    command-not-found = {
      enable = true;
    };

    home-manager = {
      enable = true;
    };
  };
}

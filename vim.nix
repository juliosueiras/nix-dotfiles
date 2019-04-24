{ pkgs, ... }:

pkgs.vim_configurable.override {
  python = pkgs.python3;
}

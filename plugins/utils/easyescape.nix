{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.programs.nixneovim.plugins.easyescape;
  helpers = import ../helpers.nix { inherit lib; };
in
{
  options = {
    programs.nixneovim.plugins.easyescape = {
      enable = mkEnableOption "Enable easyescape";
    };
  };
  config = mkIf cfg.enable {
    programs.nixneovim = {
      extraPlugins = with pkgs.vimPlugins; [
        vim-easyescape
      ];
    };
  };
}

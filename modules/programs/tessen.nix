{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkPackageOption mkIf;

  cfg = config.programs.tessen;
in

{
  options.programs.tessen = {
    enable = mkEnableOption "A bash script that can autotype and copy data from password-store and gopass files.";
    package = mkPackageOption pkgs "tessen" { };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];    
  };
}

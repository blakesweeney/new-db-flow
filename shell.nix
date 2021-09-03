{ pkgs ? import <nixpkgs> {} }:
pkgs.devshell.mkShell {
  motd = "";

  packages = with pkgs; [
    mustache-go
  ];
}

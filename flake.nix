{
  description = "A flake for adding new xref/database to rnacentral";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils = { url = "github:numtide/flake-utils"; inputs.nixpkgs.follows = "nixpkgs"; };
    devshell = { url = "github:numtide/devshell"; inputs.nixpkgs.follows = "nixpkgs"; };
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (
    system:
    let
      pkgs = import nixpkgs { 
        inherit system; 
        overlays = [
          inputs.devshell.overlay
        ];
      };
    in
    {
      devShell = import ./shell.nix {
        inherit pkgs;
      };
    }
    );
  }

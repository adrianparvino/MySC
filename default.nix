{ pkgs ? import <nixpkgs> {config = (import ./config.nix) pkgs "ghc802" "ghcjsHEAD";}
}:

let fix = f: let result = f result; in result;
in pkgs.hpkgs.mysc-server

{ pkgs ? import <nixpkgs> {config = (import ./config.nix) pkgs "ghc802" "ghcjsHEAD";}
}:

let fix = f: let result = f result; in result;
in
pkgs.stdenv.mkDerivation {
  name = "MySC";
  version = "0.1.0.0";

  phases = [ "installPhase" ];

  buildInputs = [
    pkgs.hpkgs.mysc-server
    pkgs.hjspkgs.mysc-client
  ];
  
  meta = {
    license = pkgs.stdenv.lib.licenses.gpl3;
  };
}

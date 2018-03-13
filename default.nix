{ pkgs ? import <nixpkgs> {config = (import ./config.nix) pkgs "ghc802" "ghcjsHEAD";}
}:

let fix = f: let result = f result; in result;
in
pkgs.stdenv.mkDerivation {
  name = "mysc";
  version = "0.1.0.0";

  phases = [ "installPhase" ];

  installPhase = ''
    true
    mkdir -p $out/bin/
    cp ${pkgs.hpkgs.mysc-server}/bin/heroku-comment-server $out/bin/
    cp ${pkgs.hjspkgs.mysc-client}/index.html $out/
    cp ${pkgs.hjspkgs.mysc-client}/all.min.js $out/
  '';
  
  meta = {
    license = pkgs.stdenv.lib.licenses.gpl3;
  };
}

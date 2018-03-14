{ pkgs ? import <nixpkgs> {config = (import ./config.nix) pkgs "ghc802" "ghcjsHEAD";}
}:
let static-dir = pkgs.runCommand "static-dir" {} ''
  mkdir $out
  ${pkgs.hpkgs.mysc-common}/bin/mysc-html > $out/index.html
  cp ${pkgs.hjspkgs.mysc-client}/all.min.js $out/all.min.js
  '';
in
pkgs.writeScriptBin "run-mysc-server" ''
  #!${pkgs.stdenv.shell}
  ${pkgs.hpkgs.mysc-server}/bin/mysc-server -p 8080 -d ${static-dir}/
''

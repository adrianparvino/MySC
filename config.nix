nixpkgs: ghc: ghcjs:
{
  packageOverrides = pkgs: rec {
    webkitgtk = pkgs.webkitgtk216x;
    hpkgs = (pkgs.callPackage ./pkgs/ghc {}).override {
      overrides = self: super: {
        mysc-common = self.callPackage ./mysc-common { haskellPackages = self; };
        mysc-server = self.callPackage ./mysc-server { haskellPackages = self; };

        bytestring-builder = pkgs.haskell.lib.dontHaddock super.bytestring-builder;
        nats = pkgs.haskell.lib.dontHaddock super.nats;

        reflex-dom-contrib = self.callPackage ./pkgs/reflex-dom-contrib.nix {};

        reflex-bulma = self.callPackage /home/myrl/Development/reflex-bulma {};
        reflex = self.callPackage (pkgs.fetchFromGitHub {
          owner = "reflex-frp";
          repo = "reflex";
          rev = "4a03273794aa4c9a9965e3e6a45fa3c68fa4659a";
          sha256 = "0iwn5vjqk4nrxy0ihyrhxirlwbabs7dcr7wkvd0h6rw4yap7ay8p";
        }) {};
      } // (import (pkgs.fetchFromGitHub {
          owner = "reflex-frp";
          repo = "reflex-dom";
          rev = "df9fff3a0f4e393db6af0beecabd38156c82aedc";
          sha256 = "04zb388xdiarpilr0q0b3pb34h6dycr7y0jgrb3q4zx4dbksq7br";
      }) self nixpkgs);
    };
    hjspkgs = (pkgs.callPackage ./pkgs/ghcjs {}).override {
      overrides = self: super: {
        mysc-common = self.callPackage ./mysc-common { haskellPackages = self; };
        mysc-client = self.callPackage ./mysc-client { haskellPackages = self; };

        font-awesome-type = pkgs.haskell.packages.ghcjsHEAD.font-awesome-type;

        ref-tf = pkgs.haskell.packages.ghcjsHEAD.ref-tf;
        prim-uniq = pkgs.haskell.packages.ghcjsHEAD.prim-uniq;
        ghcjs-base = pkgs.haskell.packages.ghcjsHEAD.ghcjs-base;
        ghcjs-dom = pkgs.haskell.packages.ghcjsHEAD.ghcjs-dom;
        ghcjs-dom-jsffi = pkgs.haskell.packages.ghcjsHEAD.ghcjs-dom-jsffi;
        jsaddle = pkgs.haskell.packages.ghcjsHEAD.jsaddle;
        jsaddle-webkit2gtk = pkgs.haskell.packages.ghcjsHEAD.jsaddle-webkit2gtk;
        jsaddle-wkwebview = pkgs.haskell.packages.ghcjsHEAD.jsaddle-wkwebview;
        jsaddle-warp = pkgs.haskell.packages.ghcjsHEAD.jsaddle-warp;
        jsaddle-clib = pkgs.haskell.packages.ghcjsHEAD.jsaddle-clib;
        dependent-sum-template = pkgs.haskell.packages.ghcjsHEAD.dependent-sum-template;
        zenc = pkgs.haskell.packages.ghcjsHEAD.zenc;
        bytestring-builder = pkgs.haskell.lib.dontHaddock super.bytestring-builder;
        nats = pkgs.haskell.lib.dontHaddock super.nats;

        reflex-dom-contrib = self.callPackage ./pkgs/reflex-dom-contrib.nix {};

        reflex-bulma = self.callPackage /home/myrl/Development/reflex-bulma {};
        reflex = self.callPackage (pkgs.fetchFromGitHub {
          owner = "reflex-frp";
          repo = "reflex";
          rev = "4a03273794aa4c9a9965e3e6a45fa3c68fa4659a";
          sha256 = "0iwn5vjqk4nrxy0ihyrhxirlwbabs7dcr7wkvd0h6rw4yap7ay8p";
        }) {};
      } // (import (pkgs.fetchFromGitHub {
          owner = "reflex-frp";
          repo = "reflex-dom";
          rev = "df9fff3a0f4e393db6af0beecabd38156c82aedc";
          sha256 = "04zb388xdiarpilr0q0b3pb34h6dycr7y0jgrb3q4zx4dbksq7br";
      }) self nixpkgs);
    };
  };
}

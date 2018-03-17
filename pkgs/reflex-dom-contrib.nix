{ mkDerivation, aeson, base, base64-bytestring, bifunctors, bytestring
, containers, data-default, exception-transformers, ghcjs-dom, http-types
, jsaddle, lens, mtl, random, readable, ref-tf, reflex, reflex-dom-core, safe
, stm, string-conv, text, time, transformers, uri-bytestring
, fetchFromGitHub, stdenv
}:
mkDerivation {
  pname = "reflex-dom-contrib";
  version = "0.5.1.0";
  src = fetchFromGitHub {
    owner = "reflex-frp";
    repo = "reflex-dom-contrib";
    rev = "b47f90c810c838009bf69e1f8dacdcd10fe8ffe3";
    sha256 = "0yvjnr9xfm0bg7b6q7ssdci43ca2ap3wvjhshv61dnpvh60ldsk9";
  };
  
  libraryHaskellDepends = [
    aeson base base64-bytestring
    bifunctors bytestring containers data-default
    exception-transformers ghcjs-dom http-types jsaddle lens
    mtl random readable ref-tf reflex reflex-dom-core safe stm
    string-conv text time transformers uri-bytestring
  ];
            
  license = stdenv.lib.licenses.bsd3;
}

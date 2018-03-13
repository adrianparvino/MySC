{ mkDerivation, base, bytestring, deepseq, stdenv }:
mkDerivation {
  pname = "bytestring-builder";
  version = "0.10.8.1.0";
  sha256 = "6d7404773621efb88b256ff88912a7dbcebc7fb86d27868ef58478249892dbc2";
  libraryHaskellDepends = [ base bytestring deepseq ];
  description = "The new bytestring builder, packaged outside of GHC";
  license = stdenv.lib.licenses.bsd3;
}

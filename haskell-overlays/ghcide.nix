self: super:
let
  pkgs = self.callPackage ({ pkgs }: pkgs) { };
  inherit (pkgs.haskell.lib) dontCheck justStaticExecutables;
  inherit (pkgs.haskellPackages) callHackageDirect callHackage;

in {
  ghcide = justStaticExecutables (dontCheck (callHackageDirect {
    pkg = "ghcide";
    ver = "1.5.0.1";
    sha256 = "XK9g2/6J+twhAOaweajVqWV69psNV5EtVg6DeCw8fJE=";
  } rec {
    ghc-check = callHackageDirect {
      pkg = "ghc-check";
      ver = "0.5.0.6";
      sha256 = "9a845cf69f8943bf8eb9f1df07dd9a6cd26f005a973243f649725034e5728d91";
    } { };
    lsp-test = dontCheck (callHackage "lsp-test" "0.14.0.1" { });
    haddock-library = dontCheck (callHackage "haddock-library" "1.10.0" { });
    haskell-lsp = dontCheck (callHackageDirect {
      pkg = "haskell-lsp";
      ver = "0.24.0.0";
      sha256 = "2fde650a1f7405c663cb3ca4224bae5be63c387d83d3e8c8c60086e47942823f";
    } { inherit haskell-lsp-types; });
    haskell-lsp-types = dontCheck (callHackageDirect {
      pkg = "haskell-lsp-types";
      ver = "0.24.0.0";
      sha256 = "764d51c6b0e52bbafe042f10ad69fdaddcc31007d78a6fada6be24ddc513f3dc";
    } { });
    regex-tdfa = dontCheck (callHackage "regex-tdfa" "1.3.1.0" {
      regex-base = dontCheck (callHackage "regex-base" "0.94.0.0" { });
    });
    shake = dontCheck (callHackage "shake" "0.19.6" { });
    hie-bios = dontCheck (callHackageDirect {
      pkg = "hie-bios";
      ver = "0.8.0";
      sha256 = "7b673282dc5e54c653c193b049a266749149a13018c2a58f338967a7da3ffeaa";
    } { });
  }));
}

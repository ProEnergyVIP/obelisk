{ hackGet }:

# Fix misc upstream packages
self: super:

let
  pkgs = self.callPackage ({ pkgs }: pkgs) {};
  haskellLib = pkgs.haskell.lib;
in

{
  git = self.callCabal2nix "git" (hackGet ../dep/hs-git) {};
  # hdevtools = haskellLib.markUnbroken super.hdevtools;
  # reflex-ghci = haskellLib.markUnbroken super.reflex-ghci;
  # reflex-process = haskellLib.markUnbroken super.reflex-process;
  # reflex-vty = haskellLib.markUnbroken super.reflex-vty;
  # reflex-fsnotify = haskellLib.markUnbroken super.reflex-fsnotify;
  universe-base = haskellLib.doJailbreak super.universe-base;
  universe-reverse-instances = haskellLib.doJailbreak super.universe-reverse-instances;
  universe-instances-extended = haskellLib.doJailbreak super.universe-instances-extended;
  stylish-haskell = null; # FIXME

  # https://github.com/haskell/hackage-security/issues/247
  hackage-security = haskellLib.dontCheck super.hackage-security; # only tests use aeson and are not compat with 1.5;
  heist = haskellLib.doJailbreak super.heist; # aeson 1.5 bump
  #aeson = super.aeson_1_5_2_0; # TODO: bump reflex-platform aeson to 1.5
  aeson-gadt-th = haskellLib.doJailbreak super.aeson-gadt-th; # requires aeson 1.5 for ghc8.10 support?

  snap = haskellLib.doJailbreak super.snap;
  # Exports more internals
  snap-core = haskellLib.dontCheck (self.callCabal2nix "snap-core" (hackGet ../dep/snap-core) {});

  logging-effect = haskellLib.doJailbreak (self.callHackage "logging-effect" "1.3.10" {});
  unliftio-core = self.callHackage "unliftio-core" "0.1.2.0" {};
  # shelly = self.callHackage "shelly" "1.9.0" {};
  # monad-logger = self.callHackage "monad-logger" "0.3.36" {};
  # megaparsec = self.callHackage "megaparsec" "8.0.0" {};
  neat-interpolation = self.callHackage "neat-interpolation" "0.5.1.2" {};

  hnix-store-core = self.callHackage "hnix-store-core" "0.4.2.0" {};
  hnix-store-remote = self.callHackage "hnix-store-remote" "0.4.2.0" {};
}
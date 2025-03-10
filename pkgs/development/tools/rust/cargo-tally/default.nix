{ lib, rustPlatform, fetchCrate, stdenv, darwin }:

rustPlatform.buildRustPackage rec {
  pname = "cargo-tally";
  version = "1.0.32";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-sbSGqVH0pEFhNhIBu/RzrkEViN4ilEJbgYQEtxU986E=";
  };

  cargoHash = "sha256-VMFPWAdOeAYsr0tdlSxtYsahEm/8K0L25lOfPG0P+uU=";

  buildInputs = lib.optionals stdenv.isDarwin (with darwin.apple_sdk_11_0.frameworks; [
    DiskArbitration
    Foundation
    IOKit
  ]);

  meta = with lib; {
    description = "Graph the number of crates that depend on your crate over time";
    homepage = "https://github.com/dtolnay/cargo-tally";
    changelog = "https://github.com/dtolnay/cargo-tally/releases/tag/${version}";
    license = with licenses; [ asl20 /* or */ mit ];
    maintainers = with maintainers; [ figsoda matthiasbeyer ];
  };
}

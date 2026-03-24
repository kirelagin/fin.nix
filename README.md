<!--
SPDX-FileCopyrightText: 2026 Kirill Elagin <https://kir.elagin.me/>

SPDX-License-Identifier: MPL-2.0
-->

# fin.nix

Nix packages for financial tools.

## Table of Contents

- [Packages](#packages)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Packages

- **ibind** – REST and WebSocket client library for Interactive Brokers
  Client Portal Web API.

## Usage

Add `fin.nix` as a flake input and apply the overlay to your Nixpkgs instance.
This makes all packages available in the corresponding Nixpkgs package sets.

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    fin.url = "github:kirelagin/fin.nix";
    fin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, fin, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ fin.overlays.default ];
      };
    in {
      # Example: a Python environment with ibind
      packages.x86_64-linux.default = pkgs.python3.withPackages (ps: [
        ps.ibind
      ]);
    };
}
```

It is recommended to set `fin.inputs.nixpkgs.follows` to use the same Nixpkgs
revision throughout your flake, avoiding duplicate Nixpkgs evaluations and
ensuring consistent package versions.

If you use NixOS or Home Manager, you can apply the overlay in your configuration:

```nix
nixpkgs.overlays = [ fin.overlays.default ];
```

## Contributing

You are very welcome to submit pull requests.

## License

[MPL-2.0] © [Kirill Elagin]

[MPL-2.0]: https://spdx.org/licenses/MPL-2.0.html                                                                                                                                                                                                                                     
[Kirill Elagin]: https://kir.elagin.me/

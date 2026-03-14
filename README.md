# Leafpad-NixOS

Leafpad 0.8.17 packaged for NixOS and Nix-enabled Linux systems.  
This version works **without Nix flakes**, so it can be used on older or simpler Nix setups.

---

## Requirements

- Nix installed: [https://nixos.org/download.html](https://nixos.org/download.html)
- A `<nixpkgs>` channel (no flakes needed)

Set up your nixpkgs channel if you haven’t already:

```bash
nix-channel --add https://nixos.org/channels/nixpkgs-25.11 nixpkgs
nix-channel --update

Build and Install

Clone the repository:

git clone https://github.com/OnlyLinux71/Leafpad-NixOS.git
cd Leafpad-NixOS

Build Leafpad:

nix-build

Install for your user (optional):

sudo nix-env -i ./result

Development Shell (Optional)

If you want to modify or rebuild Leafpad, enter a development shell with all build dependencies:

nix-shell

This provides:

GTK2

pkg-config

autotools (autoconf, automake, libtool)

intltool

License

Leafpad-NixOS is licensed under GPL-2.0, same as the original Leafpad.

Notes

This repository is public and can be used on any NixOS or Nix-enabled Linux system.

Works without flakes for maximum compatibility.

The package is self-contained; no external overrides required.



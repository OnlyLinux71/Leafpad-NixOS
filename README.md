# Leafpad-NixOS

Simple Nix expression to build and install Leafpad 0.8.17 on NixOS.

---
## Step 1: Clone & Build Leafpad

```bash
git clone https://github.com/OnlyLinux71/Leafpad-NixOS.git
cd Leafpad-NixOS

# Build and install Leafpad
nix-build
sudo nix-env -i ./result

---
## License
GPL-2.0 (same as Leafpad)
---


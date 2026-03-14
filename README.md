# Leafpad-NixOS

A simple Nix expression to build and install **Leafpad 0.8.17** on NixOS or any system with Nix, without using flakes.  
Leafpad is licensed under GPL-2.0.

---

## Requirements

- Nix package manager installed
- Internet connection (to fetch source)

---

## Build and Install

```bash
git clone https://github.com/OnlyLinux71/Leafpad-NixOS.git
cd Leafpad-NixOS
nix-build
sudo nix-env -i ./result

```
## Uninstall
```bash
sudo nix-env -e leafpad

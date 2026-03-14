# Leafpad-NixOS

A simple Nix expression to build and install **Leafpad 0.8.17** on NixOS or any system with Nix, without using flakes.  
Leafpad is licensed under GPL-2.0 (same as Leafpad).

---

## Requirements

- Nix package manager installed
- Internet connection (to fetch source)

---

## Build and Install

Run the following commands in your terminal to build and install Leafpad:

git clone https://github.com/OnlyLinux71/Leafpad-NixOS.git  
cd Leafpad-NixOS  
nix-build  
sudo nix-env -i ./result  

After installation, run:

leafpad  

> If it doesn’t appear in your applications menu immediately, log out and back in, or restart your desktop environment.

---

## Uninstall

To remove Leafpad:

sudo nix-env -e leafpad  

Optional: reclaim space from the Nix store:

sudo nix-collect-garbage -d  


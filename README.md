Step 1: Clone & Build Leafpad

git clone https://github.com/OnlyLinux71/Leafpad-NixOS.git
cd Leafpad-NixOS

# Build and install Leafpad
nix-build
sudo nix-env -i ./result

Step 2: Optional Development Shell

# Enter a Nix development shell for building or tinkering with Leafpad
nix-shell

License: GPL-2.0 (same as Leafpad)

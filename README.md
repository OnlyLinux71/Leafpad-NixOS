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

```
## Optional: Reclaim space from the Nix store:
```bash
sudo nix-collect-garbage -d

```

## Optional: Add Menu Icon and Desktop Entry

If you want Leafpad to appear in your apps menu with an icon:

```bash
# Download icon to your personal icons folder
mkdir -p ~/.local/share/icons
wget https://raw.githubusercontent.com/OnlyLinux71/Leafpad-NixOS/main/leafpad.png -O ~/.local/share/icons/leafpad.png

# Download desktop entry
mkdir -p ~/.local/share/applications
wget https://raw.githubusercontent.com/OnlyLinux71/Leafpad-NixOS/main/leafpad.desktop -O ~/.local/share/applications/leafpad.desktop

# Update desktop file to use the new icon path
sed -i 's|Icon=.*|Icon='$HOME'/.local/share/icons/leafpad.png|' ~/.local/share/applications/leafpad.desktop

# Refresh the desktop menu
update-desktop-database ~/.local/share/applications

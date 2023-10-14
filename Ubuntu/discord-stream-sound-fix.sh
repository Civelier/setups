#!/bin/bash

cd ~/
mkdir discord_setup
cd discord_setup

sudo apt update

# Install PipeWire
sudo apt install pipewire

# Install flatpak
sudo apt install flatpak flatpak-builder

# Install Helvum
git clone https://gitlab.freedesktop.org/pipewire/helvum.git
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install org.gnome.{Platform,Sdk}//45 org.freedesktop.Sdk.Extension.rust-stable//22.04 org.freedesktop.Sdk.Extension.llvm16//22.04
flatpak-builder --install helvum/flatpak-build/ build-aux/org.pipewire.Helvum.


# Install easyeffects

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.wwmm.easyeffects














# References:
# r/linux_gaming, 2021, Found at: https://www.reddit.com/r/linux_gaming/comments/t0bkw7/psa_discord_screensharing_with_sound_is_possible/
# Helvum, 2023, Found at: https://gitlab.freedesktop.org/pipewire/helvum
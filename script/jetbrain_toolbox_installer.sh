#!/bin/bash

TOOLBOX_URL="https://data.services.jetbrains.com/products/download?code=TB&platform=linux"
DOWNLOAD_DIR="$HOME/Downloads"
INSTALL_DIR="/opt/jetbrains-toolbox"
BIN_DIR="/usr/local/bin"

wget -O "$DOWNLOAD_DIR/jetbrains-toolbox.tar.gz" "$TOOLBOX_URL" >/dev/null 2>&1
sudo mkdir -p "$INSTALL_DIR" >/dev/null 2>&1
tar -xvzf "$DOWNLOAD_DIR/jetbrains-toolbox.tar.gz" -C "$DOWNLOAD_DIR" >/dev/null 2>&1
EXTRACTED_DIR=$(find "$DOWNLOAD_DIR" -maxdepth 1 -type d -name "jetbrains-toolbox-*")
sudo mv "$EXTRACTED_DIR"/* "$INSTALL_DIR" >/dev/null 2>&1
sudo ln -sf "$INSTALL_DIR/jetbrains-toolbox" "$BIN_DIR/jetbrains-toolbox" >/dev/null 2>&1
rm -f "$DOWNLOAD_DIR/jetbrains-toolbox.tar.gz" >/dev/null 2>&1
rm -rf "$EXTRACTED_DIR" >/dev/null 2>&1

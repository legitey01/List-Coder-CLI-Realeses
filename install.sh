#!/bin/sh
set -e

# ListCoderCLi Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/legitey01/List-Coder-CLI-Realeses/main/install.sh | bash

REPO="legitey01/List-Coder-CLI-Realeses"
BINARY_NAME="listcoder"
INSTALL_DIR="${LISTCODER_INSTALL_DIR:-$HOME/.local/bin}"

# Detect OS and architecture
detect_platform() {
    OS="$(uname -s)"
    ARCH="$(uname -m)"

    case "$OS" in
        Linux*)
            case "$ARCH" in
                x86_64|amd64)  PLATFORM="x86_64-unknown-linux-gnu" ;;
                aarch64|arm64) PLATFORM="aarch64-unknown-linux-gnu" ;;
                *) echo "Error: unsupported architecture: $ARCH"; exit 1 ;;
            esac
            ;;
        Darwin*)
            case "$ARCH" in
                x86_64|amd64)  PLATFORM="x86_64-apple-darwin" ;;
                arm64)         PLATFORM="aarch64-apple-darwin" ;;
                *) echo "Error: unsupported architecture: $ARCH"; exit 1 ;;
            esac
            ;;
        MINGW*|MSYS*|CYGWIN*)
            PLATFORM="x86_64-pc-windows-msvc"
            ;;
        *)
            echo "Error: unsupported OS: $OS"
            exit 1
            ;;
    esac
}

# Get latest version from GitHub
get_latest_version() {
    curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" | grep '"tag_name"' | sed -E 's/.*"tag_name": *"([^"]+)".*/\1/'
}

# Download and install
install_binary() {
    VERSION="${1:-$(get_latest_version)}"
    if [ -z "$VERSION" ]; then
        echo "Error: could not determine version"
        exit 1
    fi

    detect_platform

    echo "Installing ListCoderCLi $VERSION for $PLATFORM..."

    # Create install directory
    mkdir -p "$INSTALL_DIR"

    # Determine download URL
    case "$PLATFORM" in
        *windows*)
            URL="https://github.com/$REPO/releases/download/$VERSION/listcoder-$PLATFORM.exe"
            OUTPUT="$INSTALL_DIR/$BINARY_NAME.exe"
            ;;
        *)
            URL="https://github.com/$REPO/releases/download/$VERSION/listcoder-$PLATFORM"
            OUTPUT="$INSTALL_DIR/$BINARY_NAME"
            ;;
    esac

    # Download
    echo "Downloading from $URL..."
    curl -fsSL "$URL" -o "$OUTPUT"
    chmod +x "$OUTPUT"

    echo ""
    echo "ListCoderCLi installed to $OUTPUT"
    echo ""

    # Check if install dir is in PATH
    case ":$PATH:" in
        *":$INSTALL_DIR:"*) ;;
        *)
            echo "NOTE: $INSTALL_DIR is not in your PATH."
            echo "Add it to your shell profile:"
            echo ""
            echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
            echo ""
            ;;
    esac

    echo "Run 'listcoder' to get started."
}

# Uninstall
uninstall() {
    echo "Uninstalling ListCoderCLi..."
    rm -f "$INSTALL_DIR/$BINARY_NAME"
    rm -f "$INSTALL_DIR/$BINARY_NAME.exe"
    echo "ListCoderCLi uninstalled."
}

# Main
case "${1:-install}" in
    install)
        install_binary "$2"
        ;;
    uninstall)
        uninstall
        ;;
    -h|--help)
        echo "ListCoderCLi Installer"
        echo ""
        echo "Usage:"
        echo "  install.sh              Install latest version"
        echo "  install.sh install      Install latest version"
        echo "  install.sh install v0.1.4   Install specific version"
        echo "  install.sh uninstall    Uninstall ListCoderCLi"
        echo ""
        echo "Environment variables:"
        echo "  LISTCODER_INSTALL_DIR   Installation directory (default: ~/.local/bin)"
        ;;
    *)
        # If it looks like a version number, install that version
        case "$1" in
            v[0-9]*)
                install_binary "$1"
                ;;
            *)
                echo "Usage: $0 [install|uninstall|--help] [version]"
                exit 1
                ;;
        esac
        ;;
esac

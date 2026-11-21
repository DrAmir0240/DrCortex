#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/DrAmir0240/DrCortex.git"
INSTALL_DIR="$HOME/.drcortex"
BIN_DIR="$HOME/.local/bin"

echo "🧠 Initializing DrCortex Installation..."

if [ -f "./bin/drcortex" ] && [ -f "./core/master-rules.tpl.md" ]; then
    echo "📦 Installing from local repository..."
    mkdir -p "$INSTALL_DIR"
    cp -r ./bin ./core ./templates "$INSTALL_DIR/"
    [ -f "./README.md" ] && cp ./README.md "$INSTALL_DIR/"
elif [ -d "$INSTALL_DIR/.git" ]; then
    echo "🔄 Updating existing DrCortex installation..."
    git -C "$INSTALL_DIR" pull --quiet
else
    echo "📥 Cloning DrCortex from GitHub..."
    rm -rf "$INSTALL_DIR"
    git clone --quiet "$REPO_URL" "$INSTALL_DIR"
fi

mkdir -p "$BIN_DIR"
chmod +x "$INSTALL_DIR/bin/drcortex"

ln -sf "$INSTALL_DIR/bin/drcortex" "$BIN_DIR/drcortex"
ln -sf "$INSTALL_DIR/bin/drcortex" "$BIN_DIR/dcx"

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
        if [ -f "$rc" ] && ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$rc"; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$rc"
        fi
    done
    export PATH="$BIN_DIR:$PATH"
fi

echo "✅ Commands installed: 'drcortex' and 'dcx'"
echo ""

if [ -e /dev/tty ]; then
    python3 "$INSTALL_DIR/bin/drcortex" setup < /dev/tty
else
    python3 "$INSTALL_DIR/bin/drcortex" setup
fi

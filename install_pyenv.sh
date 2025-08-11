#!/bin/bash
set -e

# --- Config ---
PYENV_ROOT="${HOME}/.pyenv"
SHELL_CONFIG="${HOME}/.bashrc"  # change to ~/.zshrc if using zsh

echo "Installing pyenv without Homebrew..."

# --- Install dependencies ---
echo "Installing dependencies via curl / Xcode..."
if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install || true
fi

# --- Download pyenv ---
if [ ! -d "$PYENV_ROOT" ]; then
    echo "Cloning pyenv..."
    git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
else
    echo "pyenv already exists at $PYENV_ROOT"
fi

# --- Update shell config ---
if ! grep -q 'pyenv init' "$SHELL_CONFIG"; then
    echo "Updating $SHELL_CONFIG..."
    cat <<'EOF' >> "$SHELL_CONFIG"

# >>> pyenv setup >>>
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
# <<< pyenv setup <<<
EOF
fi

echo "Pyenv installed at $PYENV_ROOT"
echo "Please restart your terminal or run:"
echo "  source $SHELL_CONFIG"

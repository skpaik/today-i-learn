#!/bin/zsh

echo "===================================="
echo "  MACBOOK SETUP FOR BACKEND ENGINEER"
echo "===================================="

# -----------------------------
# 1. INSTALL XCODE CLI TOOLS
# -----------------------------
echo "Installing Xcode Command Line Tools (includes Git)..."
xcode-select --install 2>/dev/null

echo "Waiting for the installation to finish..."
until xcode-select -p &>/dev/null; do
  sleep 5
done

echo "Xcode CLI Tools installed."

# -----------------------------
# 2. CREATE DEV FOLDERS
# -----------------------------
echo "Creating development folders..."
mkdir -p ~/projects
mkdir -p ~/.config
mkdir -p ~/.npm-global

echo "Folders created."

# -----------------------------
# 3. SETUP .zshrc
# -----------------------------
echo "Configuring .zshrc..."

cat > ~/.zshrc << 'EOF'
# -------------------------------
#  BASIC SHELL SETTINGS
# -------------------------------
export TERM="xterm-256color"
setopt autocd
setopt correct
setopt no_beep

# -------------------------------
#  PATHS
# -------------------------------
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# -------------------------------
#  GIT CONFIG
# -------------------------------
export GIT_MERGE_AUTOEDIT=no

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{cyan}[%b]%f'
PROMPT='%F{green}%n@%m%f %1~ ${vcs_info_msg_0_} %# '

# -------------------------------
#  ALIASES
# -------------------------------
alias cls="clear"
alias ll="ls -lah"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"

# npm
alias nr="npm run"
alias ni="npm install"
alias nis="npm install --save"

# -------------------------------
#  DEFAULT EDITOR
# -------------------------------
export EDITOR="code"

# -------------------------------
#  iTerm2 Integration (optional)
# -------------------------------
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
EOF

echo ".zshrc configured successfully."

# -----------------------------
# 4. RELOAD ZSH CONFIG
# -----------------------------
echo "Reloading zsh configuration..."
source ~/.zshrc

# -----------------------------
# 5. VERIFY INSTALLATIONS
# -----------------------------
echo "Verifying Git installation..."
git --version || echo "Git not found!"

echo "===================================="
echo "  REMINDER: Install these manually:"
echo "  - iTerm2:          https://iterm2.com"
echo "  - Rectangle:       https://rectangleapp.com"
echo "  - IntelliJ IDEA:   https://jetbrains.com/idea"
echo "  - Node.js LTS:     https://nodejs.org"
echo "===================================="

echo "Setup complete! Restart your terminal."

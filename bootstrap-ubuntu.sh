#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_REPO="https://github.com/M-2-G/dotfiles.git"

echo "=========================================="
echo " Bootstrap: Ubuntu server setup"
echo "=========================================="

# ------------------------------------------
# 1. System packages
# ------------------------------------------
echo ""
echo "[1/10] Installing system packages..."
sudo apt-get update -qq
sudo apt-get install -y \
    git \
    curl \
    zsh \
    tmux \
    ripgrep \
    unzip \
    wget \
    build-essential \
    python3 \
    python3-pip \
    python3-venv

# Symlink python -> python3 so tools like Mason can find it
sudo ln -sf /usr/bin/python3 /usr/bin/python

# ------------------------------------------
# 2. Node.js via nvm (apt version is too old for nvim plugins)
# ------------------------------------------
echo ""
echo "[2/10] Installing nvm and Node.js LTS..."
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
    echo "  nvm already installed, skipping."
fi

# Load nvm so we can use it immediately in this script
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts
nvm use --lts
nvm alias default "lts/*"
echo "  node $(node --version) / npm $(npm --version) installed"

# ------------------------------------------
# 3. uv (Python package manager)
# ------------------------------------------
echo ""
echo "[3/10] Installing uv..."
curl -fsSL https://astral.sh/uv/install.sh | sh
echo "  uv installed"

# ------------------------------------------
# 4. Neovim
# ------------------------------------------
echo ""
echo "[4/10] Installing Neovim..."
NVIM_VERSION="v0.11.5"
NVIM_URL="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz"

wget -q "$NVIM_URL" -O /tmp/nvim.tar.gz
sudo tar -xzf /tmp/nvim.tar.gz -C /usr/local --strip-components=1
rm /tmp/nvim.tar.gz
echo "  nvim $(nvim --version | head -1) installed"

# ------------------------------------------
# 5. Starship prompt
# ------------------------------------------
echo ""
echo "[5/10] Installing Starship prompt..."
curl -fsSL https://starship.rs/install.sh | sh -s -- --yes

# ------------------------------------------
# 6. zsh-syntax-highlighting
# ------------------------------------------
echo ""
echo "[6/10] Installing zsh-syntax-highlighting..."
ZSH_SYNTAX_DIR="$HOME/.zsh/zsh-syntax-highlighting"
if [ ! -d "$ZSH_SYNTAX_DIR" ]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_SYNTAX_DIR"
else
    echo "  Already installed, skipping."
fi

# ------------------------------------------
# 7. Clone dotfiles
# ------------------------------------------
echo ""
echo "[7/10] Cloning dotfiles..."
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "  Dotfiles already cloned, pulling latest..."
    git -C "$DOTFILES_DIR" pull
fi

# ------------------------------------------
# 8. Symlink dotfiles
# ------------------------------------------
echo ""
echo "[8/10] Creating symlinks..."

symlink() {
    local src="$1"
    local dst="$2"

    # Create parent directory if needed
    mkdir -p "$(dirname "$dst")"

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "  Backing up existing $dst -> ${dst}.bak"
        mv "$dst" "${dst}.bak"
    fi

    ln -sf "$src" "$dst"
    echo "  Linked: $dst -> $src"
}

symlink "$DOTFILES_DIR/.tmux.conf"     "$HOME/.tmux.conf"
symlink "$DOTFILES_DIR/nvim"           "$HOME/.config/nvim"
symlink "$DOTFILES_DIR/starship.toml"  "$HOME/.config/starship.toml"

cat > "$HOME/.zshrc" << 'EOF'
# Linux wrapper — sources your dotfiles zshrc with macOS parts replaced

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=50000
setopt notify

zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit && compinit

# PATH setup
export PATH="$HOME/.local/bin:$PATH"

# Editor
export EDITOR=nvim

# Aliases
alias ls="ls --color=always"
alias ll="ls -larht --color=always"
alias zshrc="$EDITOR ~/.zshrc"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# uv
export PATH="$HOME/.local/bin:$PATH"

# zsh-syntax-highlighting (Linux path, not Homebrew)
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Starship
eval "$(starship init zsh)"
EOF

echo "  Created Linux-adapted ~/.zshrc"

# ------------------------------------------
# 9. Set zsh as default shell
# ------------------------------------------
echo ""
echo "[9/10] Setting zsh as default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    echo "  Default shell changed to zsh. Re-login to take effect."
else
    echo "  zsh is already the default shell."
fi

# ------------------------------------------
# 10. Install Claude Code
# ------------------------------------------
echo ""
echo "[10/10] Installing Claude Code..."
curl -fsSL https://claude.ai/install.sh | bash

echo ""
echo "=========================================="
echo " Done! Next steps:"
echo "  1. Log out and back in (or run: exec zsh)"
echo "  2. Run: claude"
echo "  3. Authenticate with your Anthropic account"
echo "=========================================="

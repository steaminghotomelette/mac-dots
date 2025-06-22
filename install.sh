#!/bin/bash

# Dotfiles Installation Script
# Assumes Homebrew is already installed

set -e # Exit on any error

echo "🍺 Installing Homebrew casks..."

# Casks
brew install --cask obsidian
brew install --cask raycast
brew install --cask firefox
brew install --cask bitwarden
brew install --cask ghostty
brew install --cask neovide
brew install --cask ubersicht
brew install --cask maestral
brew install --cask bruno
brew install --cask beekeeper-studio
brew install --cask spotify
brew install --cask sf-symbols
brew install --cask font-sf-mono
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-symbols-only-nerd-font
brew install --cask nikitabobko/tap/aerospace

echo "🔧 Installing Homebrew formulae..."

# Formulae
brew install git
brew install lazygit
brew install fzf
brew install rg
brew install fd
brew install yazi
brew install zellij
brew install starship
brew install zoxide
brew install bat
brew install eza
brew install fish
brew install luarocks
brew install ast-grep
brew install wget
brew install node
brew install imagemagick
brew install ghostscript
brew install tectonic
brew install stow
brew install git-delta
brew install btop

echo "🤖 Installing simple bar..."

# simple bar
git clone https://github.com/Jean-Tinland/simple-bar $HOME/Library/Application\ Support/Übersicht/widgets/simple-bar

echo "📦 Installing npm packages..."

# npm packages
npm install -g @mermaid-js/mermaid-cli

echo "🔗 Installing zinit..."

# Install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

echo "📁 Setting up dotfiles..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup existing files
echo "📋 Creating backups..."
if [ -f "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
  echo "Backed up existing .zshrc"
fi

if [ -d "$HOME/.config" ]; then
  mv "$HOME/.config" "$HOME/.config.backup.$(date +%Y%m%d_%H%M%S)"
  echo "Backed up existing .config directory"
fi

# Copy dotfiles
echo "📂 Copying configuration files..."

# Copy .config directory
if [ -d "$SCRIPT_DIR/.config" ]; then
  cp -r "$SCRIPT_DIR/.config" "$HOME/"
  echo "Copied .config directory"
else
  echo "⚠️  Warning: .config directory not found in script directory"
fi

# Copy .zshrc
if [ -f "$SCRIPT_DIR/.zshrc" ]; then
  cp "$SCRIPT_DIR/.zshrc" "$HOME/"
  echo "Copied .zshrc"
else
  echo "⚠️  Warning: .zshrc file not found in script directory"
fi

# Fish is installed for nvim plugin compatibility only
echo "🐟 Fish shell installed (for nvim plugin compatibility)"

echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Configure any applications as needed"
echo ""
echo "📝 Note: Your original files have been backed up with timestamps"

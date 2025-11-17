#!/bin/zsh

echo "🚀 Starting WallRound macOS setup (TypeScript-only setup)..."
echo "-------------------------------------------------------------"

# Step 1: macOS updates
echo "🧭 Checking for macOS software updates..."
softwareupdate --install --all

# Step 2: Developer tools (Git, compilers)
echo "🧰 Installing Xcode command line tools..."
xcode-select --install || echo "✅ Xcode tools already installed."

# Step 3: Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "💫 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ Oh My Zsh already installed."
fi

# Step 4: Install nvm and Node.js LTS
if [ ! -d "$HOME/.nvm" ]; then
  echo "📦 Installing NVM (Node Version Manager)..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  source ~/.zshrc
else
  echo "✅ NVM already installed."
fi

echo "⬇️ Installing Node.js LTS..."
source ~/.zshrc
nvm install --lts
nvm alias default lts/*
node -v
npm -v

# Step 5: Install Docker Desktop
echo "🐳 Downloading Docker Desktop..."
curl -L -o ~/Downloads/Docker.dmg "https://desktop.docker.com/mac/main/arm64/Docker.dmg"
echo "📌 Please double-click ~/Downloads/Docker.dmg to install Docker Desktop."

# Step 6: Install Visual Studio Code
echo "💻 Downloading VS Code..."
curl -L -o ~/Downloads/VSCode.dmg "https://update.code.visualstudio.com/latest/darwin/stable"
echo "📌 Please double-click ~/Downloads/VSCode.dmg to install VS Code."

# Step 7: Install Postman
echo "📨 Downloading Postman..."
curl -L -o ~/Downloads/Postman.zip "https://dl.pstmn.io/download/latest/osx"
echo "📌 Please unzip and move Postman to Applications folder."

# Step 8: AWS CLI v2
echo "☁️ Installing AWS CLI..."
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "~/Downloads/AWSCLIV2.pkg"
sudo installer -pkg ~/Downloads/AWSCLIV2.pkg -target /

# Step 9: Verify installations
echo "-------------------------------------------------------------"
echo "🧪 Verifying installations..."
echo "Node: $(node -v)"
echo "npm: $(npm -v)"
echo "Git: $(git --version)"
echo "AWS CLI: $(aws --version)"
echo "-------------------------------------------------------------"

echo "🎉 Setup complete!"
echo "Now install GUI apps by opening them from ~/Downloads and dragging into Applications."
echo "Restart your terminal after installation."
echo "-------------------------------------------------------------"

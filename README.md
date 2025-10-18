# Personal Configs

This repository contains my personal configuration files for **Neovim**, **Tmux**, and **Zsh** (with **Oh My Zsh** and **Zoxide**) to make them work nicely together. It is designed to be easily deployable on a fresh system using `stow`.

> ⚠️ Note: These configs were tested on **macOS M1** using **Homebrew**.

---

## Included Configurations

- **Neovim**: `init.lua`, plugin configs, and Lua modules.
- **Tmux**: `.tmux.conf` with personal keybindings and setup.
- **Zsh**: `.zshrc` configured to work with **Oh My Zsh** and **Zoxide**.

---

## Prerequisites

Before using these configs, install the following tools:

- [Oh My Zsh](https://ohmyz.sh/)  
- [Zoxide](https://github.com/ajeetdsouza/zoxide)  
- [Tmux](https://github.com/tmux/tmux)  
- [Neovim](https://neovim.io/)  
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) (set in your terminal profile)  
- [GNU Stow](https://www.gnu.org/software/stow/)  

On macOS with Homebrew, you can install most dependencies with:

```bash
brew install neovim tmux zoxide stow
```

## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Configs.git
   cd Configs
   ```
2. Backup your existing configs (optional but recommended):
   ```bash
    mv ~/.zshrc ~/.zshrc.backup
    mv ~/.tmux.conf ~/.tmux.conf.backup
    mv ~/.config/nvim ~/.config/nvim.backup
   ```
3. Map the configs using Stow:
   ```bash
    # Zsh
    stow -v -t ~ zsh

    # Tmux
    stow -v -t ~ tmux

    # Neovim
    stow -v -t ~ nvim
    ```
This will create symlinks in your home directory pointing to the files in this repository.

## Notes

- After mapping the configs, open a new terminal window to apply Zsh and Tmux settings.

- Make sure your terminal uses JetBrains Mono for best visual experience with Neovim and Tmux.

- These configs are tailored for macOS M1 but can work on Linux/macOS with minor adjustments.

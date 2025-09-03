# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **modular** Fish shell setup repository that provides flexible, automated installation and configuration for a modern terminal environment on Ubuntu/Debian systems. The setup uses a modular architecture allowing selective installation of tools and custom configuration generation.

## Key Files and Structure

### Core Installation Files
- `install.fish` - **Interactive orchestrator** with menu-driven installation
- `install-legacy.fish` - Legacy monolithic installer (all tools at once)  
- `install-manual.sh` - Simplified quick installation script

### Modular Scripts (`/scripts/`)
- `install-core-tools.fish` - bat, zoxide, fzf installation
- `install-eza.fish` - eza (modern ls) with repository setup
- `install-oh-my-fish.fish` - oh-my-fish framework + bass plugin
- `install-starship.fish` - starship prompt + configuration
- `install-nvm.fish` - NVM + Node.js LTS setup
- `install-pnpm.fish` - pnpm package manager
- `install-bun.fish` - bun JavaScript runtime
- `install-docker.fish` - Docker Engine containerization platform
- `install-uv.fish` - UV Python package manager

### Configuration Modules (`/config/`)
- `config-base.fish` - Core aliases and basic configuration
- `config-starship.fish` - Starship prompt initialization
- `config-zoxide.fish` - Zoxide smart directory jumping
- `config-fzf.fish` - FZF fuzzy finder with custom options
- `config-pnpm.fish` - pnpm PATH configuration
- `config-bun.fish` - bun PATH configuration
- `config-uv.fish` - UV Python package manager PATH configuration
- `starship.toml` - Starship prompt theme (minimal)

## Installation Commands

### Interactive Installation (Recommended)
```bash
# From repository directory - shows menu with options
chmod +x ./install.fish
./install.fish
```

### Legacy Complete Installation  
```bash
# Install all tools at once (original behavior)
chmod +x ./install-legacy.fish  
./install-legacy.fish
```

### Quick Manual Installation
```bash
# Ultra-fast setup without interaction
chmod +x ./install-manual.sh
./install-manual.sh
```

### Individual Tool Installation
```bash
# Install specific tool only
chmod +x ./scripts/install-starship.fish
./scripts/install-starship.fish
```

## Tools and Dependencies

The setup installs and configures these modern CLI tools:

### Core Dependencies
- `fish-shell` - Modern shell with autocompletions
- `curl`, `git`, `unzip` - Essential utilities

### CLI Enhancement Tools
- **oh-my-fish** - Fish shell framework and plugin manager
- **starship** - Cross-shell prompt with Git integration
- **zoxide** - Smart directory jumper (replaces `cd`)
- **fzf** - Fuzzy finder for files and command history
- **eza** - Modern `ls` replacement with Git status and icons
- **bat/batcat** - Syntax-highlighted `cat` replacement

### Development Tools  
- **nvm** - Node.js version manager
- **pnpm** - Fast, disk space efficient package manager
- **bun** - JavaScript runtime and package manager
- **Docker Engine** - Containerization platform
- **UV** - Ultra-fast Python package manager

## Configuration Details

### Fish Shell Configuration (config/config.fish:1-48)
- Disables greeting message
- Initializes tools in proper load order (starship, zoxide, fzf)
- Sets custom FZF options with file preview using bat
- Defines system and development aliases
- Configures PATH for pnpm and bun

### Key Aliases
- `i` → `sudo apt install`
- `upd` → `sudo apt update && sudo apt upgrade -y`
- `ls` → `eza` (with icons, Git status, long format)
- `cd` → `z` (zoxide smart jumping)
- `f5` → reload fish configuration
- `fishrc` → open config in VS Code

## Architecture Notes

### Modular Architecture
The new system follows a **separation of concerns** approach:
- **Orchestrator (`install.fish`)**: Interactive menu, tool selection, config assembly
- **Individual Scripts (`/scripts/`)**: Isolated installation logic per tool
- **Configuration Modules (`/config/`)**: Modular config snippets  
- **Dynamic Assembly**: Final `config.fish` built from selected modules only

### Installation Strategy
Each script uses defensive programming:
- Checks if commands exist before installation
- Returns proper exit codes for orchestrator  
- Creates necessary directories with proper permissions
- Uses conditional installation to avoid reinstalling tools
- Handles Ubuntu's `batcat` vs `bat` naming conflict with symlinks

### Configuration Assembly Process
1. **Base Config**: Always includes `config-base.fish` (aliases, core settings)
2. **Tool-Specific Modules**: Added based on successful installations
3. **Dynamic Generation**: Combines modules into `~/.config/fish/config.fish`
4. **Dependency Handling**: Core tools (fzf, zoxide) auto-included with bat installation

### Tool Integration
- **FZF**: Integrates with bat for file previews (`config-fzf.fish`)
- **Zoxide**: Replaces cd with smart directory jumping (`config-zoxide.fish`)
- **Starship**: Git-aware prompt with custom config (`config-starship.fish`)
- **Performance**: All tools initialized only in interactive sessions

### Path Management
- **pnpm**: Separate module configures `PNPM_HOME` and PATH (`config-pnpm.fish`)
- **bun**: Isolated module sets `BUN_INSTALL` and PATH (`config-bun.fish`)
- **UV**: Adds `~/.cargo/bin` to PATH for Python package management (`config-uv.fish`)
- **Docker**: No PATH config needed, adds user to docker group for sudo-less usage
- **NVM**: Requires bass plugin, handled in `install-oh-my-fish.fish`
- **Local bins**: Created for user-specific binaries (bat symlink)

## Development Workflow

### Testing Configuration Changes
```bash
# Reload fish configuration
f5

# Or restart fish session
exec fish
```

### Modular Development
- **Adding New Tool**: Create `scripts/install-newtool.fish` + `config/config-newtool.fish`
- **Modifying Existing Tool**: Edit corresponding script in `/scripts/`
- **Config Changes**: Modify specific config module in `/config/`
- **Testing Individual Tools**: Run scripts directly from `/scripts/`

### Configuration Management
- **Base Config**: Edit `config/config-base.fish` for core aliases and settings
- **Tool Modules**: Separate files in `/config/` for tool-specific initialization
- **Starship Prompt**: Edit `config/starship.toml` for prompt customization
- **Plugin Management**: Use `omf` commands to manage Fish plugins

### Script Development Guidelines
- Each script should be self-contained and testable
- Return proper exit codes (0 = success, 1 = failure)
- Include tool existence checks before installation
- Follow the established function pattern (`install_toolname()`)
- Make scripts executable with `#!/usr/bin/env fish`

## Prerequisites and Dependencies

- Ubuntu/Debian system with sudo access
- Internet connection for downloading tools
- Fish shell installed and set as default shell

The installation scripts handle most dependency installation automatically, but require initial setup of Fish shell as documented in README.md.
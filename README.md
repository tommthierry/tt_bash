# TT Bash - Personal Bash Utility System

A comprehensive bash utility system that provides enhanced terminal functionality, Docker management for Magento projects, and developer productivity tools.

## 📋 Prerequisites

- WSL (Windows Subsystem for Linux) with Ubuntu
- Git
- Docker and Docker Compose (for Docker features)
- VSCode (optional, for expert mode)

## 🛠️ Installation

### 1. Clone the Repository

```bash
git clone https://github.com/tommthierry/tt_bash.git ~/tt_bash
```

### 2. Open in File Explorer (Optional)

For easier editing with VSCode, open the folder in Windows Explorer:

```bash
explorer.exe ~/tt_bash
```

### 3. Create Environment Configuration

Create a `.env.sh` file in the `~/tt_bash` directory:

```bash
cd ~/tt_bash
cp .env.sample.sh .env.sh  # If sample exists
# Or create manually:
touch .env.sh
```

Edit `.env.sh` and configure your settings:

```bash
# Example .env.sh content
tt_expertMode=0  # Set to 1 to enable expert mode
```

### 4. Add to Bash Configuration

Add the following lines to your `~/.bashrc` file:

```bash
################################################################
####### TT's BASH  #############################################
################################################################
if [ -f ~/tt_bash/_load.sh ]; then
    . ~/tt_bash/_load.sh
fi
```

### 5. Reload Bash Configuration

```bash
source ~/.bashrc
```

### 6. Verify Installation

Test that everything is working:

```bash
tt
```

You should see the welcome message and available commands.

## 📖 Usage

### Basic Commands

- `tt` - Show welcome message and available commands
- `tt -h` - Display help information
- `tt -v` - Show current version


## 🔄 Updating

To update to the latest version:

```bash
tt update
```

This will pull the latest changes from the repository and reload the system.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

Copyright (c) - TT

## ✨ Enjoy Your Enhanced Terminal Experience! ✨

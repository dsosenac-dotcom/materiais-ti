#!/bin/bash
# ================================================
# Script de Pós-Instalação — Debian 13 (Trixie)
# Post-Installation Script — Debian 13 (Trixie)
#
# Autor: Dario Oliveira
# GitHub: github.com/dsosenac-dotcom
# ================================================

set -e

# Cores / Colors
VERDE='\033[0;32m'
AMARELO='\033[1;33m'
VERMELHO='\033[0;31m'
AZUL='\033[0;34m'
RESET='\033[0m'

log()    { echo -e "${VERDE}[✓]${RESET} $1"; }
info()   { echo -e "${AZUL}[→]${RESET} $1"; }
aviso()  { echo -e "${AMARELO}[!]${RESET} $1"; }
erro()   { echo -e "${VERMELHO}[✗]${RESET} $1"; exit 1; }

# Verificar root
if [ "$EUID" -ne 0 ]; then
    erro "Execute como root: sudo ./pos-instalacao.sh"
fi

echo ""
echo "================================================"
echo "  Pós-Instalação Debian 13 — DSO Educação"
echo "  Post-Installation Debian 13 — DSO Educação"
echo "================================================"
echo ""

# ================================
# 1. ATUALIZAR SISTEMA
# ================================
info "Atualizando o sistema / Updating system..."
apt update && apt upgrade -y
log "Sistema atualizado! / System updated!"

# ================================
# 2. PACOTES ESSENCIAIS
# ================================
info "Instalando pacotes essenciais / Installing essential packages..."
apt install -y \
    git \
    curl \
    wget \
    htop \
    neofetch \
    vim \
    nano \
    zip \
    unzip \
    tree \
    net-tools \
    build-essential \
    python3 \
    python3-pip \
    ufw \
    lm-sensors \
    sysstat \
    tldr \
    bat \
    fd-find \
    ripgrep
log "Pacotes essenciais instalados! / Essential packages installed!"

# ================================
# 3. CONFIGURAR FIREWALL UFW
# ================================
info "Configurando firewall / Configuring firewall..."
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp     # SSH
ufw --force enable
log "Firewall configurado! / Firewall configured!"

# ================================
# 4. INSTALAR NODE.JS (via nvm)
# ================================
info "Instalando Node.js / Installing Node.js..."
if ! command -v node &>/dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
    apt install -y nodejs
    log "Node.js instalado! / Node.js installed! ($(node --version))"
else
    aviso "Node.js já instalado / Already installed: $(node --version)"
fi

# ================================
# 5. INSTALAR ZSH + OH-MY-ZSH
# ================================
info "Instalando Zsh / Installing Zsh..."
apt install -y zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log "Oh My Zsh instalado! / Oh My Zsh installed!"
else
    aviso "Oh My Zsh já instalado / Already installed"
fi

# ================================
# 6. CONFIGURAR GIT
# ================================
info "Configurando Git / Configuring Git..."
git config --global core.editor "nano"
git config --global init.defaultBranch "main"
git config --global credential.helper store
git config --global color.ui true
log "Git configurado! / Git configured!"

# ================================
# 7. FLATPAK
# ================================
info "Instalando Flatpak / Installing Flatpak..."
apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
log "Flatpak instalado! / Flatpak installed!"

# ================================
# 8. LIMPEZA FINAL
# ================================
info "Limpando sistema / Cleaning system..."
apt autoremove --purge -y
apt clean
journalctl --vacuum-size=100M
log "Sistema limpo! / System cleaned!"

# ================================
# RESUMO FINAL
# ================================
echo ""
echo "================================================"
echo -e "  ${VERDE}[✓] INSTALAÇÃO CONCLUÍDA! / DONE!${RESET}"
echo ""
echo "  Instalado / Installed:"
echo "  ✅ Sistema atualizado / System updated"
echo "  ✅ Pacotes essenciais / Essential packages"
echo "  ✅ Firewall UFW"
echo "  ✅ Node.js $(node --version 2>/dev/null || echo 'N/A')"
echo "  ✅ Zsh + Oh My Zsh"
echo "  ✅ Git configurado / Git configured"
echo "  ✅ Flatpak + Flathub"
echo ""
echo "  Reinicie o sistema / Reboot:"
echo "  sudo reboot"
echo "================================================"
echo ""

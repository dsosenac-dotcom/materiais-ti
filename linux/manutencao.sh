#!/bin/bash
# ================================================
# Script de Manutenção — Debian
# Maintenance Script — Debian
#
# Autor: Dario Oliveira
# GitHub: github.com/dsosenac-dotcom
# ================================================

VERDE='\033[0;32m'
AMARELO='\033[1;33m'
AZUL='\033[0;34m'
RESET='\033[0m'

log()  { echo -e "${VERDE}[✓]${RESET} $1"; }
info() { echo -e "${AZUL}[→]${RESET} $1"; }
sep()  { echo -e "${AMARELO}────────────────────────────────${RESET}"; }

echo ""
echo "================================================"
echo "  Manutenção do Sistema Debian"
echo "  Debian System Maintenance"
echo "  github.com/dsosenac-dotcom"
echo "================================================"
echo ""

# ================================
# ANTES: Status do disco
# ================================
sep
echo "📊 ANTES / BEFORE:"
df -h / /home 2>/dev/null
free -h
sep
echo ""

# ================================
# 1. ATUALIZAR SISTEMA
# ================================
info "Atualizando pacotes / Updating packages..."
sudo apt update -qq && sudo apt upgrade -y
log "Pacotes atualizados! / Packages updated!"

# ================================
# 2. REMOVER PACOTES DESNECESSÁRIOS
# ================================
info "Removendo pacotes desnecessários / Removing unnecessary packages..."
sudo apt autoremove --purge -y
log "Pacotes removidos! / Packages removed!"

# ================================
# 3. LIMPAR CACHE APT
# ================================
info "Limpando cache apt / Cleaning apt cache..."
sudo apt clean
log "Cache limpo! / Cache cleaned!"

# ================================
# 4. LIMPAR LOGS ANTIGOS
# ================================
info "Limpando logs antigos / Cleaning old logs..."
sudo journalctl --vacuum-size=200M
sudo journalctl --vacuum-time=30d
log "Logs limpos! / Logs cleaned!"

# ================================
# 5. LIMPAR CACHE DO NPM (se instalado)
# ================================
if command -v npm &>/dev/null; then
    info "Limpando cache npm / Cleaning npm cache..."
    npm cache clean --force 2>/dev/null
    log "Cache npm limpo! / npm cache cleaned!"
fi

# ================================
# 6. LIMPAR CACHE DO USUÁRIO
# ================================
info "Limpando cache do usuário / Cleaning user cache..."
rm -rf ~/.cache/thumbnails/*
rm -rf /tmp/* 2>/dev/null || true
log "Cache do usuário limpo! / User cache cleaned!"

# ================================
# 7. ATUALIZAR FLATPAK (se instalado)
# ================================
if command -v flatpak &>/dev/null; then
    info "Atualizando Flatpak / Updating Flatpak..."
    flatpak update -y
    flatpak uninstall --unused -y 2>/dev/null || true
    log "Flatpak atualizado! / Flatpak updated!"
fi

# ================================
# DEPOIS: Status do disco
# ================================
echo ""
sep
echo "📊 DEPOIS / AFTER:"
df -h / /home 2>/dev/null
free -h
sep

echo ""
echo "================================================"
echo -e "  ${VERDE}[✓] MANUTENÇÃO CONCLUÍDA! / DONE!${RESET}"
echo "================================================"
echo ""

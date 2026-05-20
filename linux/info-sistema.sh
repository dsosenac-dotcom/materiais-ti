#!/bin/bash
# ================================================
# Script de Informações do Sistema
# System Information Script
#
# Autor: Dario Oliveira
# GitHub: github.com/dsosenac-dotcom
# ================================================

VERDE='\033[0;32m'
AZUL='\033[0;34m'
AMARELO='\033[1;33m'
CIANO='\033[0;36m'
NEGRITO='\033[1m'
RESET='\033[0m'

linha() { echo -e "${AZUL}────────────────────────────────────────${RESET}"; }
titulo() { echo -e "\n${NEGRITO}${AMARELO}$1${RESET}"; linha; }
item() { echo -e "  ${CIANO}$1:${RESET} ${VERDE}$2${RESET}"; }

clear
echo ""
echo -e "${NEGRITO}${AZUL}================================================${RESET}"
echo -e "${NEGRITO}  Sistema de Informações — DSO Educação${RESET}"
echo -e "${NEGRITO}  github.com/dsosenac-dotcom${RESET}"
echo -e "${NEGRITO}${AZUL}================================================${RESET}"

# ================================
# SISTEMA OPERACIONAL
# ================================
titulo "🐧 Sistema Operacional / OS"
item "OS" "$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')"
item "Kernel" "$(uname -r)"
item "Arquitetura" "$(uname -m)"
item "Hostname" "$(hostname)"
item "Uptime" "$(uptime -p)"
item "Data/Hora" "$(date '+%d/%m/%Y %H:%M:%S')"

# ================================
# HARDWARE
# ================================
titulo "💻 Hardware"
item "CPU" "$(grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)"
item "Núcleos" "$(nproc) cores"
item "Frequência Máx" "$(lscpu | grep 'CPU max MHz' | awk '{print $4}') MHz"
item "GPU" "$(lspci | grep -i vga | cut -d: -f3 | xargs 2>/dev/null || echo 'N/A')"
item "RAM Total" "$(free -h | grep Mem | awk '{print $2}')"
item "RAM Usada" "$(free -h | grep Mem | awk '{print $3}')"
item "RAM Livre" "$(free -h | grep Mem | awk '{print $4}')"

# ================================
# DISCO
# ================================
titulo "💾 Armazenamento / Storage"
df -h | grep -v tmpfs | grep -v udev | tail -n +2 | while read linha; do
    PART=$(echo $linha | awk '{print $1}')
    TAM=$(echo $linha | awk '{print $2}')
    USADO=$(echo $linha | awk '{print $3}')
    DISP=$(echo $linha | awk '{print $4}')
    USO=$(echo $linha | awk '{print $5}')
    MONT=$(echo $linha | awk '{print $6}')
    echo -e "  ${CIANO}$MONT${RESET} → Usado: ${VERDE}$USADO/$TAM${RESET} ($USO) | Livre: ${VERDE}$DISP${RESET}"
done

# ================================
# REDE
# ================================
titulo "🌐 Rede / Network"
item "Hostname" "$(hostname -f 2>/dev/null || hostname)"

# IPs de todas as interfaces
ip -4 addr show | grep inet | grep -v '127.0.0.1' | while read linha; do
    IP=$(echo $linha | awk '{print $2}')
    IFACE=$(echo $linha | awk '{print $NF}')
    echo -e "  ${CIANO}$IFACE:${RESET} ${VERDE}$IP${RESET}"
done

# Gateway
GATEWAY=$(ip route | grep default | awk '{print $3}' | head -1)
item "Gateway" "${GATEWAY:-N/A}"

# DNS
DNS=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}' | tr '\n' ' ')
item "DNS" "${DNS:-N/A}"

# Teste de internet
if ping -c 1 8.8.8.8 &>/dev/null; then
    item "Internet" "✅ Conectado / Connected"
else
    item "Internet" "❌ Sem conexão / No connection"
fi

# ================================
# PACOTES
# ================================
titulo "📦 Pacotes / Packages"
item "dpkg" "$(dpkg -l 2>/dev/null | grep -c '^ii') pacotes"
if command -v flatpak &>/dev/null; then
    item "Flatpak" "$(flatpak list 2>/dev/null | wc -l) apps"
fi
if command -v snap &>/dev/null; then
    item "Snap" "$(snap list 2>/dev/null | tail -n +2 | wc -l) snaps"
fi

# ================================
# SERVIÇOS IMPORTANTES
# ================================
titulo "⚙️ Serviços / Services"
SERVICOS=("ssh" "ufw" "NetworkManager" "cron" "cups")
for srv in "${SERVICOS[@]}"; do
    if systemctl is-active --quiet "$srv" 2>/dev/null; then
        echo -e "  ${CIANO}$srv:${RESET} ${VERDE}● Ativo / Active${RESET}"
    elif systemctl is-enabled --quiet "$srv" 2>/dev/null; then
        echo -e "  ${CIANO}$srv:${RESET} ${AMARELO}○ Inativo / Inactive${RESET}"
    fi
done

# ================================
# USUÁRIOS LOGADOS
# ================================
titulo "👤 Usuários Logados / Logged Users"
who | while read linha; do
    echo -e "  ${VERDE}$linha${RESET}"
done

# ================================
# TEMPERATURA (se disponível)
# ================================
if command -v sensors &>/dev/null; then
    titulo "🌡️ Temperatura / Temperature"
    sensors 2>/dev/null | grep -E 'Core|temp' | while read linha; do
        echo -e "  ${VERDE}$linha${RESET}"
    done
fi

echo ""
linha
echo -e "  ${NEGRITO}Prof. Dario Oliveira — github.com/dsosenac-dotcom${RESET}"
linha
echo ""

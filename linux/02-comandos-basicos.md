# 02 — Comandos Básicos / Basic Commands

> 🇧🇷 Guia para iniciantes | 🇺🇸 Beginner's guide

---

## 🇧🇷 Português

### Navegação

| Comando | Descrição | Exemplo |
|---|---|---|
| `pwd` | Mostra o diretório atual | `pwd` |
| `ls` | Lista arquivos e pastas | `ls -la` |
| `cd` | Muda de diretório | `cd /home` |
| `cd ..` | Volta um nível | `cd ..` |
| `cd ~` | Vai para o home | `cd ~` |
| `clear` | Limpa o terminal | `clear` |

### Arquivos e pastas

| Comando | Descrição | Exemplo |
|---|---|---|
| `mkdir` | Cria uma pasta | `mkdir projetos` |
| `touch` | Cria um arquivo vazio | `touch arquivo.txt` |
| `cp` | Copia arquivo/pasta | `cp arquivo.txt backup/` |
| `mv` | Move ou renomeia | `mv arquivo.txt novo.txt` |
| `rm` | Remove arquivo | `rm arquivo.txt` |
| `rm -rf` | Remove pasta e conteúdo | `rm -rf pasta/` |

> ⚠️ `rm -rf` é irreversível! Não tem lixeira no terminal.

### Visualizar conteúdo

| Comando | Descrição | Exemplo |
|---|---|---|
| `cat` | Exibe conteúdo do arquivo | `cat arquivo.txt` |
| `less` | Visualiza com paginação | `less arquivo.txt` |
| `head` | Primeiras 10 linhas | `head arquivo.txt` |
| `tail` | Últimas 10 linhas | `tail -f /var/log/syslog` |

### Sistema

| Comando | Descrição | Exemplo |
|---|---|---|
| `df -h` | Espaço em disco | `df -h` |
| `free -h` | Uso de memória RAM | `free -h` |
| `top` | Processos em tempo real | `top` |
| `htop` | Top melhorado (instalar) | `htop` |
| `uptime` | Tempo ligado | `uptime` |
| `uname -a` | Info do kernel | `uname -a` |
| `whoami` | Usuário atual | `whoami` |

### Busca

```bash
# Buscar arquivo por nome
find / -name "arquivo.txt" 2>/dev/null

# Buscar texto dentro de arquivos
grep "palavra" arquivo.txt

# Buscar recursivamente em pastas
grep -r "palavra" /home/

# Histórico de comandos
history
history | grep "apt"
```

### Atalhos úteis do terminal

| Atalho | Ação |
|---|---|
| `Ctrl + C` | Cancela o comando atual |
| `Ctrl + L` | Limpa o terminal |
| `Ctrl + A` | Vai para o início da linha |
| `Ctrl + E` | Vai para o fim da linha |
| `Tab` | Autocompleta comandos e arquivos |
| `↑ / ↓` | Navega no histórico |

---

## 🇺🇸 English

### Navigation

| Command | Description | Example |
|---|---|---|
| `pwd` | Shows current directory | `pwd` |
| `ls` | Lists files and folders | `ls -la` |
| `cd` | Changes directory | `cd /home` |
| `cd ..` | Goes up one level | `cd ..` |
| `cd ~` | Goes to home directory | `cd ~` |
| `clear` | Clears the terminal | `clear` |

### Files and folders

| Command | Description | Example |
|---|---|---|
| `mkdir` | Creates a folder | `mkdir projects` |
| `touch` | Creates an empty file | `touch file.txt` |
| `cp` | Copies file/folder | `cp file.txt backup/` |
| `mv` | Moves or renames | `mv file.txt new.txt` |
| `rm` | Removes a file | `rm file.txt` |
| `rm -rf` | Removes folder and contents | `rm -rf folder/` |

> ⚠️ `rm -rf` is irreversible! There's no recycle bin in the terminal.

### View content

| Command | Description | Example |
|---|---|---|
| `cat` | Displays file content | `cat file.txt` |
| `less` | View with pagination | `less file.txt` |
| `head` | First 10 lines | `head file.txt` |
| `tail` | Last 10 lines | `tail -f /var/log/syslog` |

### System

| Command | Description | Example |
|---|---|---|
| `df -h` | Disk space | `df -h` |
| `free -h` | RAM usage | `free -h` |
| `top` | Real-time processes | `top` |
| `uptime` | System uptime | `uptime` |
| `uname -a` | Kernel info | `uname -a` |
| `whoami` | Current user | `whoami` |

### Useful terminal shortcuts

| Shortcut | Action |
|---|---|
| `Ctrl + C` | Cancels current command |
| `Ctrl + L` | Clears terminal |
| `Tab` | Autocompletes commands and files |
| `↑ / ↓` | Navigate command history |

---

**[← Introdução](01-introducao.md)** | **[Próximo: Arquivos e Diretórios →](03-arquivos-diretorios.md)**

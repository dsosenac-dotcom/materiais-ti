# 01 — O que é Linux e Debian? / What is Linux and Debian?

> 🇧🇷 Guia para iniciantes | 🇺🇸 Beginner's guide

---

## 🇧🇷 Português

### O que é Linux?

Linux é um **sistema operacional** livre e de código aberto criado por Linus Torvalds em 1991.  
Diferente do Windows, o Linux é gratuito, seguro, estável e altamente personalizável.

### O que é Debian?

Debian é uma das **distribuições Linux** mais antigas e respeitadas, criada em 1993.  
É a base de várias outras distros como Ubuntu, Mint e Kali Linux.

**Por que usar Debian?**
- ✅ Gratuito e open source
- ✅ Extremamente estável
- ✅ Mais de 59.000 pacotes disponíveis
- ✅ Comunidade enorme e ativa
- ✅ Ideal para servidores e desktops

### Estrutura básica do sistema

```
/               → Raiz do sistema (root)
├── /home       → Arquivos dos usuários
├── /etc        → Configurações do sistema
├── /usr        → Programas instalados
├── /var        → Logs e dados variáveis
├── /tmp        → Arquivos temporários
├── /boot       → Arquivos de inicialização
└── /root       → Home do superusuário (root)
```

### Terminal: seu melhor amigo

O terminal (ou shell) é a interface de linha de comando do Linux.  
No Debian, o terminal padrão aceita comandos **Bash**.

Para abrir o terminal:
- **MATE/GNOME:** `Ctrl + Alt + T`
- **KDE:** `Ctrl + Alt + T`
- Ou procure por "Terminal" no menu

### Superusuário (root)

O usuário `root` tem controle total do sistema.  
Use `sudo` antes de comandos que precisam de permissão administrativa:

```bash
sudo apt update    # Atualizar lista de pacotes
sudo reboot        # Reiniciar o sistema
```

> ⚠️ **Cuidado:** Com grandes poderes vêm grandes responsabilidades. O root pode apagar o sistema inteiro!

---

## 🇺🇸 English

### What is Linux?

Linux is a **free and open-source operating system** created by Linus Torvalds in 1991.  
Unlike Windows, Linux is free, secure, stable, and highly customizable.

### What is Debian?

Debian is one of the **oldest and most respected Linux distributions**, created in 1993.  
It's the base for many other distros like Ubuntu, Mint, and Kali Linux.

**Why use Debian?**
- ✅ Free and open source
- ✅ Extremely stable
- ✅ Over 59,000 available packages
- ✅ Huge and active community
- ✅ Ideal for servers and desktops

### Basic system structure

```
/               → System root
├── /home       → User files
├── /etc        → System configuration
├── /usr        → Installed programs
├── /var        → Logs and variable data
├── /tmp        → Temporary files
├── /boot       → Boot files
└── /root       → Superuser home
```

### Terminal: your best friend

The terminal (or shell) is Linux's command-line interface.  
On Debian, the default terminal accepts **Bash** commands.

To open the terminal:
- **MATE/GNOME:** `Ctrl + Alt + T`
- **KDE:** `Ctrl + Alt + T`
- Or search for "Terminal" in the menu

### Superuser (root)

The `root` user has full system control.  
Use `sudo` before commands that need administrative permissions:

```bash
sudo apt update    # Update package list
sudo reboot        # Restart the system
```

> ⚠️ **Warning:** With great power comes great responsibility. Root can delete the entire system!

---

**[← Voltar ao índice / Back to index](../README.md)** | **[Próximo: Comandos Básicos →](02-comandos-basicos.md)**

# 04 — Usuários e Permissões / Users and Permissions

> 🇧🇷 Guia para iniciantes | 🇺🇸 Beginner's guide

---

## 🇧🇷 Português

### Entendendo permissões

```bash
ls -la
# -rw-r--r-- 1 dario dario 1234 mai 19 10:00 arquivo.txt
#  ||| ||| |||
#  ||| ||| +++→ outros (others)
#  ||| +++----→ grupo (group)
#  +++--------→ dono (owner)
```

| Letra | Permissão | Valor numérico |
|---|---|---|
| `r` | Leitura (read) | 4 |
| `w` | Escrita (write) | 2 |
| `x` | Execução (execute) | 1 |
| `-` | Sem permissão | 0 |

### chmod — Alterar permissões

```bash
# Modo numérico
chmod 755 script.sh    # rwxr-xr-x
chmod 644 arquivo.txt  # rw-r--r--
chmod 600 chave.pem    # rw------- (arquivos sensíveis)
chmod 777 pasta/       # rwxrwxrwx (CUIDADO!)

# Modo simbólico
chmod +x script.sh     # Adiciona execução para todos
chmod u+w arquivo.txt  # Adiciona escrita para o dono
chmod o-r arquivo.txt  # Remove leitura de outros
chmod g=rx pasta/      # Define grupo como rx

# Recursivo (toda a pasta)
chmod -R 755 projetos/
```

### Tabela de permissões comuns

| Código | Permissão | Uso típico |
|---|---|---|
| `777` | rwxrwxrwx | Evitar — muito permissivo |
| `755` | rwxr-xr-x | Scripts e pastas |
| `644` | rw-r--r-- | Arquivos de texto |
| `600` | rw------- | Chaves SSH, senhas |
| `700` | rwx------ | Pastas privadas |

### chown — Mudar dono

```bash
# Mudar dono
sudo chown dario arquivo.txt

# Mudar dono e grupo
sudo chown dario:dario arquivo.txt

# Recursivo
sudo chown -R dario:dario /home/dario/projetos/
```

### Usuários e grupos

```bash
# Ver usuário atual
whoami

# Ver todos os usuários
cat /etc/passwd | cut -d: -f1

# Criar usuário
sudo adduser novo_usuario

# Adicionar ao grupo sudo
sudo usermod -aG sudo novo_usuario

# Ver grupos do usuário
groups dario

# Trocar de usuário
su - novo_usuario

# Mudar senha
passwd              # Própria senha
sudo passwd dario   # Senha de outro usuário
```

### sudo — Executar como root

```bash
# Executar comando como root
sudo apt update

# Abrir shell como root (cuidado!)
sudo -i

# Executar como outro usuário
sudo -u outro_usuario comando

# Ver o que pode fazer com sudo
sudo -l
```

---

## 🇺🇸 English

### Understanding permissions

```bash
ls -la
# -rw-r--r-- 1 dario dario 1234 May 19 10:00 file.txt
#  ||| ||| |||
#  ||| ||| +++→ others
#  ||| +++----→ group
#  +++--------→ owner
```

| Letter | Permission | Numeric value |
|---|---|---|
| `r` | Read | 4 |
| `w` | Write | 2 |
| `x` | Execute | 1 |
| `-` | No permission | 0 |

### chmod — Change permissions

```bash
# Numeric mode
chmod 755 script.sh    # rwxr-xr-x
chmod 644 file.txt     # rw-r--r--
chmod 600 key.pem      # rw------- (sensitive files)

# Symbolic mode
chmod +x script.sh     # Add execute for everyone
chmod u+w file.txt     # Add write for owner
chmod o-r file.txt     # Remove read for others

# Recursive
chmod -R 755 projects/
```

### Users and groups

```bash
# Current user
whoami

# Create user
sudo adduser new_user

# Add to sudo group
sudo usermod -aG sudo new_user

# View user's groups
groups dario

# Switch user
su - new_user

# Change password
passwd
sudo passwd dario
```

---

**[← Arquivos e Diretórios](03-arquivos-diretorios.md)** | **[Intermediário: Gerenciamento de Pacotes →](../intermediario/01-gerenciamento-pacotes.md)**

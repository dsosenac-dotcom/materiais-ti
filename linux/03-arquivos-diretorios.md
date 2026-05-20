# 03 — Arquivos e Diretórios / Files and Directories

> 🇧🇷 Guia para iniciantes | 🇺🇸 Beginner's guide

---

## 🇧🇷 Português

### Tipos de arquivos

| Símbolo | Tipo |
|---|---|
| `-` | Arquivo comum |
| `d` | Diretório (pasta) |
| `l` | Link simbólico |
| `b` | Dispositivo de bloco |
| `c` | Dispositivo de caractere |

```bash
ls -la
# drwxr-xr-x → d = diretório
# -rw-r--r-- → - = arquivo comum
# lrwxrwxrwx → l = link simbólico
```

### Caminhos absolutos e relativos

```bash
# Caminho absoluto (começa com /)
cd /home/dario/projetos

# Caminho relativo (a partir de onde você está)
cd projetos
cd ../downloads
```

### Operações com arquivos

```bash
# Criar arquivo com conteúdo
echo "Olá, Linux!" > arquivo.txt

# Adicionar conteúdo sem apagar (append)
echo "Segunda linha" >> arquivo.txt

# Copiar pasta inteira
cp -r pasta_original/ pasta_copia/

# Mover vários arquivos para uma pasta
mv *.txt documentos/

# Criar várias pastas de uma vez
mkdir -p projetos/linux/scripts

# Criar link simbólico (atalho)
ln -s /home/dario/projetos ~/atalho-projetos
```

### Compactação e descompactação

```bash
# Compactar em .tar.gz
tar -czvf backup.tar.gz pasta/

# Descompactar .tar.gz
tar -xzvf backup.tar.gz

# Compactar em .zip
zip -r backup.zip pasta/

# Descompactar .zip
unzip backup.zip

# Ver conteúdo sem extrair
tar -tzvf backup.tar.gz
```

### Encontrar arquivos

```bash
# Buscar por nome
find /home -name "*.txt"

# Buscar por tamanho (maior que 100MB)
find / -size +100M 2>/dev/null

# Buscar por data de modificação (últimos 7 dias)
find /home -mtime -7

# Buscar e executar ação
find /tmp -name "*.log" -delete
```

### Espaço em disco por pasta

```bash
# Tamanho de uma pasta específica
du -sh /home/

# Listar subpastas ordenadas por tamanho
du -sh /home/*/ | sort -rh

# Top 10 maiores arquivos
find / -type f -exec du -sh {} + 2>/dev/null | sort -rh | head -10
```

---

## 🇺🇸 English

### File types

| Symbol | Type |
|---|---|
| `-` | Regular file |
| `d` | Directory |
| `l` | Symbolic link |
| `b` | Block device |
| `c` | Character device |

### Absolute and relative paths

```bash
# Absolute path (starts with /)
cd /home/dario/projects

# Relative path (from where you are)
cd projects
cd ../downloads
```

### File operations

```bash
# Create file with content
echo "Hello, Linux!" > file.txt

# Append content
echo "Second line" >> file.txt

# Copy entire folder
cp -r original_folder/ copy_folder/

# Move multiple files to a folder
mv *.txt documents/

# Create nested folders at once
mkdir -p projects/linux/scripts

# Create symbolic link (shortcut)
ln -s /home/dario/projects ~/projects-link
```

### Compression and extraction

```bash
# Compress to .tar.gz
tar -czvf backup.tar.gz folder/

# Extract .tar.gz
tar -xzvf backup.tar.gz

# Compress to .zip
zip -r backup.zip folder/

# Extract .zip
unzip backup.zip
```

---

**[← Comandos Básicos](02-comandos-basicos.md)** | **[Próximo: Usuários e Permissões →](04-usuarios-permissoes.md)**

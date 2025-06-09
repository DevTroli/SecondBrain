# 🌳 Neo-tree: Guia de Referência Rápida

> *"Neo-tree é seu explorador de arquivos visual - como o sidebar do VS Code, mas turbinado."*

---

## 🚀 **Ativação Básica**

| Tecla | Ação | Resultado |
|-------|------|-----------|
| `<leader>e` | Toggle Neo-tree | Abre/fecha automaticamente |

**💡 Comportamento Inteligente:** Se já estiver aberto, fecha. Se fechado, abre e revela o arquivo atual.

---

## 🧭 **Navegação Essencial**

### **Movimentação**
| Tecla | Ação | Como lembrar |
|-------|------|-------------|
| `j/k` | Subir/descer | Vim padrão |
| `<Space>` | Expandir/recolher pasta | **Space** = espaço para ver |
| `<Enter>` | Abrir arquivo | Enter = entrar |
| `o` | Abrir arquivo | **O**pen |

### **Navegação de Diretórios**
| Tecla | Ação | Situação |
|-------|------|----------|
| `u` | Subir um nível | **U**p = subir |
| `<Backspace>` | Subir um nível | Backspace = voltar |
| `C` | Definir como raiz | **C**hange root |
| `.` | Definir como raiz | Ponto = aqui |

---

## 📁 **Operações de Arquivo**

### **Criação**
| Tecla | Ação | Exemplo |
|-------|------|---------|
| `a` | Novo arquivo | `main.py` |
| `A` | Nova pasta | `src/` |

### **Manipulação**
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `d` | Deletar | **D**elete |
| `r` | Renomear | **R**ename |
| `y` | Copiar para clipboard | **Y**ank |
| `x` | Recortar | Cut = **X** |
| `p` | Colar | **P**aste |
| `c` | Copiar (interno) | **C**opy |
| `m` | Mover | **M**ove |

---

## 🔍 **Busca e Filtros**

| Tecla | Ação | Uso |
|-------|------|-----|
| `/` | Busca fuzzy | Digite e encontre |
| `f` | Filtrar por nome | Mostra só o que digitar |
| `F` | Limpar filtro | Remove filtros |
| `I` ou `H` | Toggle arquivos ocultos | Ver .gitignore, .env |

---

## 🪟 **Abertura Avançada**

### **Diferentes Modos**
| Tecla | Ação | Resultado |
|-------|------|-----------|
| `<Enter>` | Abrir normal | No buffer atual |
| `go` | Abrir expandido | Com arquivos aninhados |
| `i` | Split horizontal | Janela embaixo |
| `s` | Split vertical | Janela do lado |
| `t` | Nova tab | Tab separada |
| `w` | Window picker | Escolhe onde abrir |

**🎯 Window Picker:** Pressione `w` e veja letras nas janelas abertas. Digite a letra para escolher onde abrir o arquivo!

---

## ⚙️ **Configurações Ativas**

### **Filtros Configurados**
- ❌ `node_modules` - Oculto por padrão  
- ❌ `.git` - Oculto por padrão
- ❌ `.DS_Store` - Oculto por padrão
- ✅ Arquivos dotfiles - Visíveis (`.env`, `.gitignore`)

### **Comportamentos**
- 📍 **Follow current file** = ON (mostra arquivo atual)
- 👁️ **File watcher** = ON (atualiza automático)
- 🔄 **Leave dirs open** = ON (mantém pastas abertas)

---

## 🎨 **Símbolos Visuais**

### **Ícones de Pasta**
- 📁 `` = Pasta fechada
- 📂 `` = Pasta aberta  
- 📪 `󰜌` = Pasta vazia

### **Marcadores de Árvore**
- `│` = Linha de conexão
- `└` = Último item da pasta
- `` = Pasta recolhida (clique para expandir)
- `` = Pasta expandida (clique para recolher)

---

## 🔥 **Workflows Práticos**

### **🆕 Criando Estrutura de Projeto**
```
1. <leader>e          → Abre Neo-tree
2. A                  → Nova pasta "src"  
3. <Enter> em src     → Entra na pasta
4. a                  → Novo arquivo "main.py"
5. u                  → Volta ao nível anterior
6. A                  → Nova pasta "tests"
```

### **🔍 Encontrando Arquivos**
```
1. <leader>e          → Abre Neo-tree
2. /                  → Busca fuzzy
3. Digite "config"    → Encontra config.py, config.json, etc.
4. <Enter>            → Abre o arquivo
```

### **📋 Organizando Arquivos**  
```
1. Seleciona arquivo  → j/k para navegar
2. y                  → Copia para clipboard
3. Navega para pasta  → u/j/k  
4. p                  → Cola o arquivo
```

### **🔧 Configuração Rápida**
```
1. <leader>e          → Abre Neo-tree
2. c                  → Vai para ~/.config/nvim/
3. /                  → Busca "init"
4. <Enter>            → Edita init.lua
```

---

## 🆘 **Ajuda e Controles**

| Tecla | Ação | Quando usar |
|-------|------|-------------|
| `?` | Mostrar ajuda | Esqueceu algum comando |
| `q` | Fechar Neo-tree | Terminou de usar |
| `<Esc>` | Cancelar ação | Cancelar operação |
| `R` | Refresh | Arquivos não aparecem |

---

## 💡 **Dicas de Produtividade**

### **Combinações Poderosas**
1. **Exploração:** `<leader>e` → `/` → `<Enter>` (abrir → buscar → editar)
2. **Organização:** `y` → navegar → `p` (copiar → mover → colar)  
3. **Multi-janela:** `s` → `w` (split → escolher janela)
4. **Foco:** `C` → trabalhar → `u` (root temporário → voltar)

### **Atalhos Mentais**
- **a/A** = Add (arquivo/pasta)
- **d/r** = Delete/Rename  
- **y/x/p** = Yank/Cut/Paste (como Vim)
- **i/s/t** = Split/Split/Tab
- **u/C/.** = Up/Change/Here

---

## 🎯 **Cheat Sheet Ultra-Rápido**

```
🚪 ACESSO
<leader>e    = Toggle Neo-tree

🧭 NAVEGAR  
Space/Enter  = Expandir/Abrir
j/k          = Subir/Descer  
u/Backspace  = Subir nível
C/.          = Definir raiz

📁 ARQUIVOS
a/A          = Novo arquivo/pasta
d/r          = Deletar/Renomear
y/x/p        = Copiar/Cortar/Colar

🔍 BUSCAR
/            = Busca fuzzy
f/F          = Filtrar/Limpar
I/H          = Toggle ocultos

🪟 ABRIR
Enter        = Normal
i/s/t        = Split H/V/Tab  
w            = Window picker

⚙️ CONTROLE
?            = Ajuda
q            = Fechar
R            = Refresh
```

---

*"Neo-tree é sua base de operações - aprenda os básicos (Space, Enter, a, d) e evolua gradualmente para os avançados (w, C, /)."*
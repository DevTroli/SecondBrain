# 🚀 Alpha Dashboard: Guia de Referência

> *"Seu painel inicial personalizado - a primeira coisa que você vê ao abrir o Neovim."*

---

## 🎯 **Ações Principais**

| Tecla | Ação | Resultado |
|-------|------|-----------|
| `n` | New File | Prompt interativo para criar arquivo |
| `g` | Git | Abre LazyGit no terminal |
| `f` | Find Files | Telescope sem preview |
| `c` | Configs | Vai para ~/.config/nvim/ |
| `q` | Quit | Sair do Neovim |

---

## 📁 **New File (n) - Detalhado**

**Comportamento:**
1. Prompt aparece: `File name:`
2. Digite o caminho: `src/main.py`
3. Se a pasta não existir, é criada automaticamente
4. Arquivo é aberto para edição

**Exemplos:**
```
projeto.py          → Arquivo na raiz
src/utils.py        → Cria pasta src/ se não existir  
docs/readme.md      → Cria estrutura completa
config/settings.json → Múltiplos níveis
```

---

## 🔧 **Git Integration (g)**

**Funcionalidade:**
- Sai temporariamente do Neovim
- Executa LazyGit no terminal atual
- Ao sair do LazyGit, volta para o Neovim

**Workflow:**
```
1. Pressiona 'g' no dashboard
2. LazyGit abre (interface visual do Git)
3. Faz commits, push, pull, etc.
4. Sai do LazyGit (q)  
5. Volta automaticamente ao Neovim
```

---

## 🔍 **Find Files (f)**

**Configuração:**
- Telescope básico sem preview
- Busca todos os arquivos do projeto
- Navegação com j/k, Enter para abrir

**Dica:** Para busca mais avançada, use `<leader>ff` depois de abrir projeto.

---

## ⚙️ **Configs (c)**

**Comportamento:**
1. Muda diretório para `~/.config/nvim/`
2. Abre Telescope automaticamente
3. Mostra todos os arquivos de configuração

**Ideal para:**
- Editar init.lua
- Ajustar plugins
- Personalizar keymaps
- Modificar temas

---

## 🚪 **Acesso ao Dashboard**

| Tecla | Ação | Contexto |
|-------|------|----------|
| `Alt+a` | Abrir Dashboard | De qualquer lugar no Neovim |

**Situações úteis:**
- Meio de uma sessão, quer criar arquivo novo
- Precisa acessar Git rapidamente  
- Quer navegar para configs
- Reset mental do workflow

---

## 🎨 **Elementos Visuais**

### **Banner Personalizado**
- Usa arquivo `banners.lua` personalizado
- Layout com espaçamento: 2 linhas → banner → 2 linhas → botões

### **Ícones dos Botões**
- 📄 `` = New File  
- 🔀 `` = Git
- 🔍 `` = Find Files
- ⚙️ `` = Configs  
- 🚪 `󰗼` = Quit

---

## 🔥 **Workflows Práticos**

### **🆕 Início Rápido de Projeto**
```
1. nvim              → Dashboard aparece
2. n                 → New File
3. "main.py"         → Cria arquivo principal
4. Ctrl+o            → Volta ao dashboard (ou Alt+a)
5. n                 → Novo arquivo  
6. "config.json"     → Arquivo de configuração
```

### **⚡ Manutenção Express**
```
1. Alt+a             → Dashboard (de qualquer lugar)
2. c                 → Configs  
3. "keymaps"         → Busca e edita keymaps.lua
4. Salva e sai
5. Restart Neovim
```

### **📋 Workflow Git Integrado**
```
1. Termina de codificar
2. Alt+a             → Dashboard
3. g                 → LazyGit
4. Add, commit, push → No LazyGit
5. q                 → Volta ao Neovim
6. Continua trabalhando
```

---

## 💡 **Dicas Avançadas**

### **New File Inteligente**
- Suporta estruturas complexas: `src/components/Button.jsx`
- Cria diretórios intermediários automaticamente
- Funciona com qualquer extensão

### **Navegação Eficiente**
- Dashboard como "hub central"
- `Alt+a` de qualquer lugar = reset mental
- Combine com buffers: crie arquivo → `H/L` para navegar

### **Personalização**
- Banner pode ser alterado em `banners.lua`
- Botões podem ser adicionados/removidos
- Ícones personalizáveis

---

## 🎯 **Cheat Sheet**

```
🚀 DASHBOARD
Alt+a        = Abrir dashboard

📋 AÇÕES PRINCIPAIS  
n            = New File (interativo)
g            = LazyGit (sai/volta)
f            = Find Files (Telescope)
c            = Configs (~/.config/nvim/)
q            = Quit Neovim

💡 COMPORTAMENTOS
New File     = Cria pastas automaticamente
Git          = Terminal temporário  
Configs      = CD + Telescope automático
```

---

## 🏆 **Casos de Uso Ideais**

1. **Startup**: Primeira coisa ao abrir Neovim
2. **Reset**: Quando perdeu o foco, `Alt+a` reorganiza
3. **Criação**: Estruturas de arquivo complexas com `n`
4. **Manutenção**: Acesso rápido a configs com `c`
5. **Git**: Workflow visual sem sair do ambiente

---

*"O Dashboard é seu centro de comando - 5 ações simples que cobrem 80% das necessidades iniciais."*
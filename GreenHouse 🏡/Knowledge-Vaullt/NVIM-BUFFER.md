# Buffers no Neovim: Setup Completo e Workflow

> *"Buffers são como abas de navegador, mas com superpoderes. Configurar bem = produtividade 10x"*

---

## 🧠 **Contexto: Por que Buffers Importam?**

**O problema:** Vim clássico = dor de cabeça para gerenciar múltiplos arquivos. Você acaba perdido entre `:bn`, `:bp`, `:ls`...

**A solução moderna:** Bufferline + shortcuts inteligentes = experiência visual similar ao VS Code, mas com a flexibilidade do Vim.

### **Buffer vs Tab vs Window - Entendendo de vez**
```
Buffer = Arquivo carregado na memória (invisível)
Window = Janela que mostra um buffer (visível)
Tab = Grupo de windows organizadas

Exemplo prático:
- 5 buffers abertos (arquivos carregados)
- 2 windows visíveis (split vertical)  
- 1 tab ativa (workspace atual)
```

**Analogia:** Buffer = documento, Window = mesa onde você trabalha, Tab = sala de trabalho.

---

## ⚙️ **Setup: 3 Plugins, 1 Solução**

### **Arquitetura**
```lua
bufferline.nvim  → Interface visual (como abas do Chrome)
persistence.nvim → Salva sessões (nunca perde contexto)
scope.nvim       → Buffers por tab (organização por projeto)
```

### **Arquivo: `~/.config/nvim/lua/plugins/buffer.lua`**

```lua
return {
  -- 🎨 BUFFERLINE: Interface Visual
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          numbers = "ordinal",        -- [1] [2] [3] para Alt+1, Alt+2...
          
          -- Visual clean
          indicator = { icon = "▎", style = "icon" },
          modified_icon = "●",
          close_icon = "×",
          
          -- Performance
          max_name_length = 20,
          tab_size = 18,
          
          -- LSP integration
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(_, level)
            return level:match("error") and " " or " "
          end,
          
          -- Oculta buffers chatos (help, terminal, etc)
          custom_filter = function(buf_number)
            local buf_ft = vim.fn.getbufvar(buf_number, "&filetype")
            local ignore = { "help", "alpha", "neo-tree", "toggleterm" }
            for _, ft in ipairs(ignore) do
              if buf_ft == ft then return false end
            end
            return true
          end,
        },
      })
      
      -- KEYMAPS ESSENCIAIS
      local map = vim.keymap.set
      local opts = { silent = true }
      
      -- Navegação básica
      map('n', 'H', '<Cmd>BufferLineCyclePrev<CR>', opts)
      map('n', 'L', '<Cmd>BufferLineCycleNext<CR>', opts)
      
      -- Navegação direta (game changer!)
      for i = 1, 9 do
        map('n', '<A-' .. i .. '>', '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', opts)
      end
      
      -- Fechar buffers
      map('n', '<leader>x', '<Cmd>bdelete<CR>', opts)
      map('n', '<leader>X', '<Cmd>bdelete!<CR>', opts)
      map('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', opts)
      
      -- Buffer picker (visual)
      map('n', '<leader>p', '<Cmd>BufferLinePick<CR>', opts)
      
      -- Fechar inteligente
      map('n', '<C-q>', function()
        local modified = vim.api.nvim_buf_get_option(0, 'modified')
        if modified then
          local choice = vim.fn.confirm('Buffer modificado!', '&Salvar\n&Descartar\n&Cancelar')
          if choice == 1 then vim.cmd('write | bdelete')
          elseif choice == 2 then vim.cmd('bdelete!')
          end
        else
          vim.cmd('bdelete')
        end
      end, opts)
    end,
  },

  -- 💾 PERSISTENCE: Sessões Automáticas
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.stdpath("state") .. "/sessions/",
      options = { "buffers", "curdir", "tabpages", "winsize" },
    },
    keys = {
      { "<leader>ss", function() require("persistence").save() end, desc = "Salvar sessão" },
      { "<leader>sr", function() require("persistence").load() end, desc = "Restaurar sessão" },
      { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Última sessão" },
    },
  },

  -- 🏗️ SCOPE: Buffers por Tab
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
      
      local map = vim.keymap.set
      local opts = { silent = true }
      
      -- Tabs
      map('n', '<C-t>', '<Cmd>tabnew<CR>', opts)
      map('n', '<C-w>', '<Cmd>tabclose<CR>', opts)
      map('n', 'gt', '<Cmd>tabnext<CR>', opts)
      map('n', 'gT', '<Cmd>tabprev<CR>', opts)
      
      -- Navegação direta entre tabs
      for i = 1, 5 do
        map('n', '<leader>' .. i, i .. 'gt', opts)
      end
    end,
  },
}
```

---

## 🚀 **Workflow: Como Usar na Prática**

### **Cenário 1: Desenvolvimento de Feature**
```bash
# Abrir arquivos relacionados
nvim src/main.py src/utils.py tests/test_main.py README.md

# Workflow:
Alt+1 → main.py (implementar)
Alt+2 → utils.py (funções auxiliares)  
Alt+3 → test_main.py (testar)
Alt+4 → README.md (documentar)
H/L → revisar mudanças
```

### **Cenário 2: Multi-Projeto**
```bash
# Tab 1: Frontend
Ctrl+T → nova tab
cd frontend/
nvim src/App.js src/components/

# Tab 2: Backend  
Ctrl+T → nova tab
cd ../backend/
nvim main.py models.py

# Navegação:
<leader>1 → Tab 1 (Frontend)
<leader>2 → Tab 2 (Backend)
Alt+1, Alt+2 → arquivos dentro de cada tab
```

### **Cenário 3: Sessões de Trabalho**
```bash
# Fim do dia (17h)
<leader>ss → salva 10 buffers + posições

# Manhã seguinte (9h)
cd projeto/
nvim
<leader>sr → restaura exatamente como estava!
```

---

## 🎯 **Shortcuts: Cheat Sheet**

### **Navegação**
| Tecla | Ação | Quando usar |
|-------|------|-------------|
| `H` / `L` | Buffer anterior/próximo | Navegação sequencial |
| `Alt+1-9` | Buffer específico | Pulo direto (mais rápido) |
| `<leader>p` | Buffer picker visual | Muitos buffers abertos |

### **Fechar**
| Tecla | Ação | Situação |
|-------|------|----------|
| `<leader>x` | Fechar atual | Arquivo salvo |
| `Ctrl+Q` | Fechar inteligente | **Recomendado** - pergunta se modificado |
| `<leader>bo` | Fechar outros | Focar em 1 arquivo |

### **Organização**
| Tecla | Ação | Uso |
|-------|------|-----|
| `Ctrl+T` | Nova tab | Novo projeto/contexto |
| `<leader>1-5` | Ir para tab N | Alternar projetos |
| `<leader>ss/sr` | Salvar/restaurar sessão | Persistir trabalho |

---

## 💡 **Boas Práticas: Workflow Eficiente**

### **1. Organização por Contexto**
```
Tab 1: Código principal
Tab 2: Testes  
Tab 3: Documentação
Tab 4: Configurações
```

### **2. Naming Convention**
- Use nomes descritivos nos arquivos
- Bufferline mostra só os primeiros 20 chars
- `user_controller.py` > `controller.py`

### **3. Limpeza Regular**
```bash
# Feche buffers desnecessários
<leader>bo  # Mantém só o atual
<leader>p   # Pick visual para fechar específicos
```

### **4. Sessões Estratégicas**
```bash
# Salve contextos importantes
<leader>ss  # Antes de mudar de branch
<leader>ss  # Fim do expediente
<leader>ss  # Antes de refatorar
```

### **5. Músculo Memory**
- `Alt+1` = arquivo principal
- `Alt+2` = arquivo de teste
- `Alt+3` = arquivo de config
- `H/L` = navegação rápida

---

## 🔧 **Troubleshooting Rápido**

### **Bufferline não aparece**
```lua
-- Mude o evento de loading
event = "BufReadPost", -- em vez de "VeryLazy"
```

### **Ícones quebrados**
```bash
# Instale Nerd Font
sudo apt install fonts-firacode  # Linux
brew install font-fira-code-nerd-font  # Mac
```

### **Performance lenta**
```lua
-- Limite buffers visíveis
max_name_length = 15,
tab_size = 15,
```

### **Sessões não salvam**
```bash
# Crie diretório manualmente
mkdir -p ~/.local/state/nvim/sessions
```

---

## 🎓 **Evoluindo: Próximos Passos**

1. **Domine o básico:** H/L e Alt+números por 1 semana
2. **Adicione Telescope:** `<leader>bf` para buscar buffers
3. **Configure LSP:** Diagnósticos ficam lindos na bufferline  
4. **Explore temas:** Catppuccin, Tokyo Night combinam bem
5. **Automatize:** Autocmds para auto-save de sessões

### **Plugins que combinam:**
- **which-key.nvim** - Mostra shortcuts disponíveis
- **telescope.nvim** - Busca fuzzy de buffers
- **lualine.nvim** - Statusline que complementa
- **alpha-nvim** - Dashboard com sessões recentes

---

## 🏆 **Resultado Final**

Com essa configuração você terá:

✅ **Navegação instantânea** entre arquivos (Alt+números)  
✅ **Interface visual moderna** similar ao VS Code  
✅ **Sessões automáticas** que salvam seu contexto  
✅ **Organização por projetos** com tabs  
✅ **Shortcuts intuitivos** que viram músculo memory  

**Tempo para dominar:** 2-3 dias de uso ativo.

**ROI:** Economia de ~30 segundos por hora = 4 horas/mês = 48 horas/ano.

---

*"A diferença entre iniciante e expert não são as features que conhece, mas a velocidade com que navega entre elas."*
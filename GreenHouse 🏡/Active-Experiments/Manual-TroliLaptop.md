# Guia Definitivo de Atalhos - Arch Linux + Hyprland

Este guia apresenta todos os seus atalhos organizados por contexto e ferramenta, com análise de conflitos e sugestões para um workflow otimizado.

## 🎯 Análise de Conflitos Críticos

**Nenhum identificado por enquanto**

---

## 🖥️ HYPRLAND - Gerenciador de Janelas

### Aplicações Essenciais
| Atalho          | Ação               | Descrição               |
| --------------- | ------------------ | ----------------------- |
| `Super + Enter` | Terminal           | Abre terminal principal |
| `Super + E`     | File Manager       | Gerenciador de arquivos |
| `Super + Space` | Menu de aplicações | Launcher principal      |
| `Super + C`     | Fechar janela      | Mata a janela ativa     |

### Navegação e Foco
| Atalho            | Ação                  | Descrição                              |
| ----------------- | --------------------- | -------------------------------------- |
| `Super + h/j/k/l` | Mover foco            | Vim-style: esquerda/direita/cima/baixo |
| `Alt + Tab`       | Trocar layout teclado | Script personalizado                   |

### Workspaces (Áreas de Trabalho)
| Atalho                  | Ação               | Descrição                         |
| ----------------------- | ------------------ | --------------------------------- |
| `Super + 1-9,0`         | Ir para workspace  | Workspace 1-10                    |
| `Super + Shift + 1-9,0` | Mover janela       | Move para workspace específico    |
| `Super + S`             | Special workspace  | Toggle workspace mágico           |
| `Super + Shift + S`     | Mover para special | Move janela para workspace mágico |
| `Super + Mouse wheel`   | Navegar workspaces | Scroll entre workspaces           |

### Ferramentas Rofi
| Atalho      | Ação           | Descrição             |
| ----------- | -------------- | --------------------- |
| `Alt + E`   | Emojis         | Seletor de emojis     |
| `Alt + C`   | Calculadora    | Calculadora integrada |
| `Super + W` | WiFi Menu      | Gerenciador de WiFi   |
| `Super + Q` | Power Menu     | Menu de energia       |
| `Super + B` | Bluetooth Menu | Gerenciador Bluetooth |

### Screenshots e Utilitários
| Atalho              | Ação              | Descrição                |
| ------------------- | ----------------- | ------------------------ |
| `Alt + P`           | Screenshot região | Captura área selecionada |
| `Super + Shift + P` | Color picker      | Pipeta de cores          |
| `Super + P`         | Bitwarden         | Gerenciador de senhas    |
| `Super + V`         | Clipboard         | Menu de clipboard        |

### Mouse e Redimensionamento
| Atalho                   | Ação          | Descrição            |
| ------------------------ | ------------- | -------------------- |
| `Super + Mouse esquerdo` | Mover janela  | Arrastar janela      |
| `Super + Mouse direito`  | Redimensionar | Redimensionar janela |

### Multimídia e Sistema
| Atalho                     | Ação             | Descrição          |
| -------------------------- | ---------------- | ------------------ |
| `XF86AudioRaiseVolume`     | Volume +5%       | Aumentar volume    |
| `XF86AudioLowerVolume`     | Volume -5%       | Diminuir volume    |
| `XF86AudioMute`            | Mute toggle      | Silenciar áudio    |
| `XF86MonBrightnessUp/Down` | Brilho ±5%       | Controle de brilho |
| `XF86AudioPlay/Pause`      | Play/Pause       | Controle de mídia  |
| `XF86AudioNext/Prev`       | Próxima/Anterior | Controle de mídia  |

---

## 🔧 TMUX - Multiplexador de Terminal

### Configuração Base
- **Prefix**: `Ctrl + Space` (substitui o padrão Ctrl+B)

### Gerenciamento de Sessões
| Atalho       | Ação              | Descrição                  |
| ------------ | ----------------- | -------------------------- |
| `Prefix + N` | Nova sessão       | Prompt para nome da sessão |
| `Alt + R`    | Renomear sessão   | Renomeia sessão atual      |
| `Prefix + r` | Recarregar config | Recarrega ~/.tmux.conf     |

### Janelas (Windows)
| Atalho         | Ação                    | Descrição                |
| -------------- | ----------------------- | ------------------------ |
| `Prefix + c`   | Nova janela             | Cria no diretório atual  |
| `Alt + 1-9`    | Ir para janela          | Acesso direto por número |
| `Alt + h/l`    | Janela anterior/próxima | Navegação rápida         |
| `Prefix + n/p` | Next/Previous           | Navegação tradicional    |
| `Alt + W`      | Renomear janela         | Renomeia janela atual    |
| `Prefix + X`   | Fechar janela           | Com confirmação          |

### Painéis (Panes)
| Atalho             | Ação              | Descrição                |
| ------------------ | ----------------- | ------------------------ |
| `Prefix + '`       | Split horizontal  | Divide horizontalmente   |
| `Prefix + s`       | Split vertical    | Divide verticalmente     |
| `Ctrl + h/j/k/l`   | Navegação         | Integrado com Neovim     |
| `Prefix + H/J/K/L` | Redimensionar     | Modo repeat ativo        |
| `Prefix + x`       | Fechar painel     | Com confirmação          |
| `Prefix + f`       | Fullscreen toggle | Maximiza/restaura painel |

### Copy Mode e Clipboard
| Atalho           | Ação               | Descrição                 |
| ---------------- | ------------------ | ------------------------- |
| `Prefix + v`     | Copy mode          | Entra no modo de cópia    |
| `v`              | Iniciar seleção    | No copy mode              |
| `Ctrl + v`       | Seleção retangular | No copy mode              |
| `y`              | Copiar             | Para clipboard do sistema |
| `Enter`          | Copiar e sair      | Copia e sai do copy mode  |
| `Prefix + p`     | Colar              | Cola do clipboard         |
| `Shift + Insert` | Copiar direto      | No copy mode              |

### Layouts e Sincronização
| Atalho | Ação | Descrição |
|--------|------|-----------|
| `Prefix + Space` | Próximo layout | Cicla entre layouts |
| `Alt + Space` | Layout anterior | Layout anterior |
| `Prefix + S` | Sync panes | Sincroniza entrada em todos painéis |
| `Prefix + Ctrl + l` | Clear screen | Limpa tela e histórico |

---

## 📝 NEOVIM - Editor de Código

### Navegação Integrada (Tmux)
| Atalho | Ação | Descrição |
|--------|------|-----------|
| `Ctrl + h/j/k/l` | Navegação seamless | Entre panes do Tmux e splits do Vim |

### File Management
| Atalho | Ação | Descrição |
|--------|------|-----------|
| `<leader>e` | Neo-tree toggle | Explorador de arquivos |
| `-` | Oil.nvim | File manager modal |

### Busca e Telescope
| Atalho | Ação | Descrição |
|--------|------|-----------|
| `Ctrl + f` | Find files | Busca arquivos |
| `Ctrl + b` | Live grep | Busca em conteúdo |
| `Ctrl + g` | Git files | Arquivos do git |
| `<leader>h` | Help tags | Documentação |
| `<leader>hk` | Keymaps | Lista todos atalhos |

### Git Integration
| Atalho | Ação | Descrição |
|--------|------|-----------|
| `<leader>gp` | Preview hunk | Visualiza mudanças |
| `<leader>gt` | Toggle blame | Blame por linha |
| `<leader>gf` | Format | Formata código |

### Testing (vim-test)
| Atalho      | Ação         | Descrição                 |
| ----------- | ------------ | ------------------------- |
| `<leader>r` | Test nearest | Testa função/método atual |
| `<leader>R` | Test file    | Testa arquivo completo    |
| `<leader>a` | Test suite   | Roda toda suíte           |
| `<leader>l` | Test last    | Repete último teste       |


### Utilidades
| Atalho       | Ação          | Descrição                 |
| ------------ | ------------- | ------------------------- |
| `<leader>tc` | Toggle chunk  | Highlight de blocos       |
| `<leader>ti` | Toggle indent | Guias de indentação       |
| `Alt + a`    | Dashboard     | Abre tela inicial         |

### MISE (Version Manager)
| Atalho | Ação | Descrição |
|--------|------|-----------|
| `<leader>mv` | MISE versions | Lista versões |
| `<leader>mr` | MISE reload | Recarrega configuração |

---

## 🔄 Fluxo de Trabalho Integrado

### Cenário 1: Desenvolvimento Web
1. `Super + Enter` → Abre terminal
2. `Prefix + '` → Split horizontal para servidor
3. `Prefix + s` → Split vertical para logs
4. `Ctrl + h` → Navega para Neovim
5. `<leader>e` → Abre explorador de arquivos
6. `Ctrl + f` → Busca arquivos rapidamente

### Cenário 2: Debug e Testes
1. `Alt + 1` → Vai para janela de código (tmux)
2. `<leader>t` → Roda teste específico
3. `Alt + 2` → Vai para janela de servidor
4. `Prefix + S` → Sincroniza panes para debug
5. `<leader>gp` → Visualiza mudanças no git

### Cenário 3: Multitarefa
1. `Super + 2` → Workspace de desenvolvimento
2. `Super + 3` → Workspace de comunicação
3. `Super + mouse wheel` → Navega entre workspaces
4. `Alt + Tab` → Troca layout do teclado
5. `Super + V` → Acessa clipboard entre contextos

---

## ⚡ Dicas de Otimização

### Muscle Memory
Os atalhos seguem padrões consistentes:
- **h/j/k/l**: Navegação vim-style em todas ferramentas
- **Alt + número**: Acesso rápido (tmux windows, workspaces)
- **Super + letra**: Ações do sistema (Hyprland)
- **Prefix + ação**: Operações do tmux

### Workflow Seamless
A integração entre as ferramentas está bem pensada:
- Navegação transparente entre Neovim e Tmux
- Clipboard compartilhado entre todas as aplicações
- Layouts consistentes e previsíveis
- Atalhos não conflitantes entre contextos

### Possíveis Melhorias
1. **Resolver conflito do `<leader>h`** no Neovim
2. **Padronizar atalhos de teste** (considerar usar `<leader>r` para run)
3. **Criar atalhos para Docker/Kubernetes** se usar
4. **Adicionar atalhos para gerenciamento de dotfiles**

---

## 📚 Referência Rápida por Contexto

### Sistema (Hyprland)
- `Super + ` (aplicações, navegação, workspaces)
- `Alt + ` (ferramentas auxiliares, teclado)

### Terminal (Tmux)
- `Ctrl + Space + ` (gerenciamento de sessão)
- `Alt + ` (acesso rápido)
- `Ctrl + h/j/k/l` (navegação integrada)

### Editor (Neovim)
- `<leader> + ` (ações específicas do vim)
- `Ctrl + ` (busca e navegação)
- `Alt + a` (dashboard)

Este guia cobre 100% dos seus atalhos configurados e identifica os pontos de integração que tornam seu workflow eficiente e zen. A configuração está bem estruturada com mínimos conflitos e máxima produtividade.
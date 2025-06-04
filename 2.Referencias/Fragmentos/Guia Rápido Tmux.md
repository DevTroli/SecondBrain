# 📋 Guia Rápido Tmux - Referência Completa 
**Sua configuração personalizada com Catppuccin + Neovim integration**

## 🎯 Conceitos Fundamentais
- **Prefix**: `Ctrl+Space` 
- **Sessão**: workspace persistente
- **Janela**: aba da sessão
- **Painel**: subdivisão da janela

## 🏠 Sessões - Workspace Management
| Ação | Comando Completo | Atalho |
|------|-----------------|--------|
| Criar nova sessão | `tmux new-session -s <nome>` | `tmux new -s <nome>` |
| Listar sessões ativas | `tmux list-sessions` | `tmux ls` |
| Conectar à sessão | `tmux attach-session -t <nome>` | `tmux a -t <nome>` |
| Desconectar da sessão | `Ctrl+Space + d` | - |
| Renomear sessão atual | `Alt + R` | `Ctrl+Space + $` |
| Nova sessão (dentro do tmux) | `Ctrl+Space + N` | - |
| Matar sessão específica | `tmux kill-session -t <nome>` | - |

## 🪟 Janelas - Tabs do Tmux
| Ação | Atalho Principal | Alternativo |
|------|------------------|-------------|
| Nova janela | `Ctrl+Space + c` | - |
| Ir para janela numerada | `Alt + <1-9>` | `Ctrl+Space + <0-9>` |
| Próxima janela | `Ctrl+Space + n` | `Alt + l` |
| Janela anterior | `Ctrl+Space + p` | `Alt + h` |
| Renomear janela | `Alt + W` | `Ctrl+Space + ,` |
| Fechar janela | `Ctrl+Space + X` | - |
| Lista de janelas | `Ctrl+Space + w` | - |

## 📱 Painéis - Splits e Divisões
| Ação                     | Atalho                 | Observação           |
| ------------------------ | ---------------------- | -------------------- |
| Split vertical           | `Ctrl+Space + '`       | Abre à direita       |
| Split horizontal         | `Ctrl+Space + s`       | Abre abaixo          |
| Navegar entre painéis    | `Ctrl + h/j/k/l`       | Integrado com Neovim |
| Painel anterior/último   | `Ctrl + \`             | Quando C-l ocupado   |
| Redimensionar painéis    | `Ctrl+Space + H/J/K/L` | Modo repeat ativo    |
| Zoom painel (fullscreen) | `Ctrl+Space + f`       | Toggle on/off        |
| Fechar painel atual      | `Ctrl+Space + x`       | Com confirmação      |
| Transformar em janela    | `Ctrl+Space + !`       | Break pane           |

## 🔄 Layouts e Organização
| Ação | Atalho | Comando |
|------|--------|---------|
| Ciclar layouts | `Ctrl+Space + Space` | next-layout |
| Layout anterior | `Alt + Space` | previous-layout |
| Layout tiled | `Ctrl+Space + :` → `select-layout tiled` | - |
| Layout even-horizontal | `Ctrl+Space + :` → `select-layout even-horizontal` | - |
| Sincronizar painéis | `Ctrl+Space + S` | Toggle on/off |

## 📋 Copy Mode - Navegação e Clipboard
| Ação | Atalho | Modo Vi |
|------|--------|---------|
| Entrar Copy Mode | `Ctrl+Space + v` | - |
| Navegação básica | `h/j/k/l` | Como no Vim |
| Início/fim da linha | `0` / `$` | - |
| Palavra seguinte/anterior | `w` / `b` | - |
| Início/fim do buffer | `g` / `G` | - |
| Buscar para frente | `/texto` + Enter | - |
| Buscar para trás | `?texto` + Enter | - |
| Próximo/anterior match | `n` / `N` | - |
| Iniciar seleção | `v` | Visual mode |
| Seleção retangular | `Ctrl + v` | Block visual |
| Copiar seleção | `y` | Para clipboard sistema |
| Copiar linha inteira | `Y` | - |
| Sair Copy Mode | `Escape` | ou `q` |
| Colar do clipboard | `Ctrl+Space + p` | Sistema → tmux |

## 🔧 Utilitários e Manutenção
| Ação | Atalho | Uso |
|------|--------|-----|
| Recarregar config | `Ctrl+Space + r` | Após editar .tmux.conf |
| Limpar tela + histórico | `Ctrl+Space + Ctrl+l` | Clean slate |
| Mostrar números painéis | `Ctrl+Space + q` | Display-panes |
| Lista de atalhos | `Ctrl+Space + ?` | Help interno |
| Command mode | `Ctrl+Space + :` | Prompt interativo |
| Mostrar tempo | `Ctrl+Space + t` | Clock |

## 🔌 Plugins e Extensões
| Plugin | Função | Atalho/Uso |
|--------|--------|------------|
| **TPM** | Gerenciador plugins | `Ctrl+Space + I` (instalar) |
| **vim-tmux-navigator** | Navegação unificada | `Ctrl + h/j/k/l` |
| **tmux-resurrect** | Salvar sessões | `Ctrl+Space + Ctrl+s` |
| **tmux-continuum** | Auto-save/restore | Automático a cada 15min |
| **tmux-cpu** | Monitor sistema | Visível na statusbar |

## 💡 Command Mode - Comandos Avançados
Acesse com `Ctrl+Space + :` e digite:

**Gestão de Janelas:**
```
new-window -n "nome"                    # Nova janela nomeada
move-window -t 5                        # Mover janela para posição 5
swap-window -s 2 -t 1                   # Trocar janelas 2 e 1
```

**Manipulação de Painéis:**
```
split-window -h -p 30                   # Split vertical 30% largura
resize-pane -D 5                        # Redimensionar 5 linhas baixo
setw synchronize-panes on               # Sincronizar digitação
```

**Informações e Debug:**
```
display-message -p '#S:#I:#P'           # Info sessão:janela:painel
show-options -g                         # Opções globais
capture-pane -t 1 -p                    # Capturar conteúdo painel 1
```

## 🚨 Troubleshooting Rápido
**Sessão travada:** `tmux kill-session -t nome`  
**Reset completo:** `tmux kill-server`  
**Testar config:** `tmux -f ~/.tmux.conf.new new`  
**Ver erros:** `tmux show-messages`  
**Verificar processos:** `ps aux | grep tmux`

## 🎨 Integração com Sistema
**Wayland (wl-copy):** Clipboard já configurado  
**X11:** Descomente linhas xclip se necessário  
**Neovim:** Navegação `Ctrl+hjkl` unificada  
**Hyprland:** Alt+número livre para tmux

## ⚡ Fluxo de Trabalho Típico
1. `tmux new -s projeto` - Criar sessão
2. `Ctrl+Space + '` - Split para terminal/logs  
3. `Ctrl+Space + c` - Nova janela para testes
4. `Alt + 1/2/3` - Navegar entre contextos
5. `Ctrl+Space + d` - Detach preservando trabalho

---
**💡 Dica:** Mantenha este guia sempre acessível. Domine os atalhos básicos primeiro, depois evolua para comandos avançados conforme a necessidade.

## 💡 Dicas Rápidas

* Use nomes descritivos para sessões/janelas
* Harmonize Hyprland (Super+número) + Alt+ número (tmux windows) + Ctrl+Space (prefix)
* Mantenha o `.tmux.conf` em um repositório para sincronizar configurações
* Consulte este colinha sempre que precisar revisitar um atalho

---

**Lembre-se**: o objetivo é reduzir custos cognitivos e manter o fluxo de trabalho sempre à mão. Buon lavoro!

## 🎨 Comandos de Status e Informação

### Informações do Sistema

```bash
# Ver informações da sessão atual
Ctrl+Space + :display-message -p '#S:#I:#P'

# Listar todos os atalhos ativos
Ctrl+Space + ?

# Informações detalhadas do servidor
Ctrl+Space + :info
```

### Limpeza e Manutenção

```bash
# Limpar tela e histórico
Ctrl+Space + Ctrl+L

# Recarregar configuração
Ctrl+Space + r
```

## 🏗️ Workflows Práticos - Casos de Uso Reais

### Workflow de Desenvolvimento Web

1. **Sessão "webapp"**:
   ```bash
   tmux new-session -s webapp
   # Janela 1: Desenvolvimento
   Ctrl+Space + Ctrl+V    # Split vertical
   # Painel esquerdo: Editor (Neovim)
   # Painel direito: Servidor de desenvolvimento
   
   Ctrl+Space + c         # Nova janela
   # Janela 2: Git e controle de versão
   
   Ctrl+Space + c         # Nova janela  
   # Janela 3: Testes e debugging
   ```

2. **Navegação rápida**:
   ```bash
   Alt + 1    # Desenvolvimento
   Alt + 2    # Git
   Alt + 3    # Testes
   ```

### Workflow de Administração de Sistema

1. **Sessão "admin"**:
   ```bash
   tmux new-session -s admin
   # Configurar 4 painéis para diferentes servidores
   Ctrl+Space + Ctrl+V
   Ctrl+Space + Ctrl+H
   Ctrl+Space + l    # Ir para painel direito
   Ctrl+Space + Ctrl+H
   
   # Sincronizar comandos em todos
   Ctrl+Space + S
   ```

### Workflow de Monitoramento

1. **Sessão "monitor"**:
   ```bash
   # Painel 1: htop
   # Painel 2: tail -f /var/log/nginx/access.log
   # Painel 3: docker stats
   # Painel 4: Terminal livre
   ```

## 🔄 Persistência e Recuperação

### Usando Tmux-Resurrect

```bash
# Salvar sessão atual
Ctrl+Space + Ctrl+S

# Restaurar última sessão salva
Ctrl+Space + Ctrl+R
```

**Automático**: Com tmux-continuum, suas sessões são salvas automaticamente a cada 15 minutos e restauradas na inicialização.

## 🎯 Comandos Avançados - Power User

### Manipulação Avançada de Painéis

```bash
# Mover painel para nova janela
Ctrl+Space + !

# Juntar painel de outra janela
Ctrl+Space + :join-pane -s 2:1

# Trocar posição de painéis
Ctrl+Space + {    # Trocar com anterior
Ctrl+Space + }    # Trocar com próximo
```

### Automação e Scripting

```bash
# Criar sessão completa via script
tmux new-session -d -s projeto
tmux split-window -h
tmux select-pane -t 0
tmux send-keys 'nvim .' Enter
tmux select-pane -t 1  
tmux send-keys 'npm run dev' Enter
tmux attach-session -s projeto
```

## 🚀 Conceitos Fundamentais

Antes de mergulhar nos comandos, é essencial entender a hierarquia do tmux. Imagine uma estrutura em árvore:

```
Servidor Tmux
├── Sessão "projeto-web"
│   ├── Janela 1: "desenvolvimento"
│   │   ├── Painel 1: Editor (Neovim)
│   │   └── Painel 2: Servidor local
│   └── Janela 2: "git"
│       └── Painel 1: Terminal git
└── Sessão "admin"
    └── Janela 1: "monitoramento"
        ├── Painel 1: htop
        ├── Painel 2: logs
        └── Painel 3: docker stats
```

## 🎨 Recursos Visuais e Feedback

### Entendendo a Barra de Status

Sua barra de status personalizada fornece informações essenciais:

**Lado Esquerdo**: `[nome-sessão] janela-atual/total-janelas`
- Exemplo: `[trabalho] 2/4` significa sessão "trabalho", janela 2 de 4 total

**Centro**: Lista de janelas com indicadores visuais
- Janela ativa aparece destacada em azul
- Janelas com atividade mostram indicadores especiais

**Lado Direito**: `hostname | horário`
- Útil para identificar qual máquina você está usando

### Comandos de Limpeza e Organização

```bash
# Limpar tela e histórico do painel atual
Ctrl+Space + Ctrl+L

# Recarregar configuração (após fazer mudanças)
Ctrl+Space + r

# Renovar layout automaticamente
Ctrl+Space + Space
```

## 🎯 Comandos Avançados - Técnicas de Power User

### Automação e Scripting

**Script para criar ambiente de desenvolvimento:**
```bash
#!/bin/bash
# create-dev-env.sh

SESSION="projeto-web"

# Criar sessão
tmux new-session -d -s $SESSION

# Janela 1: Desenvolvimento
tmux rename-window -t $SESSION:1 'dev'
tmux split-window -h -t $SESSION:1
tmux send-keys -t $SESSION:1.1 'nvim .' Enter
tmux send-keys -t $SESSION:1.2 'npm run dev' Enter

# Janela 2: Git
tmux new-window -t $SESSION:2 -n 'git'
tmux send-keys -t $SESSION:2 'git status' Enter

# Janela 3: Testes
tmux new-window -t $SESSION:3 -n 'tests'
tmux split-window -v -t $SESSION:3
tmux send-keys -t $SESSION:3.1 'npm test -- --watch' Enter
tmux send-keys -t $SESSION:3.2 'npm run lint:watch' Enter

# Focar na janela de desenvolvimento
tmux select-window -t $SESSION:1
tmux select-pane -t $SESSION:1.1

# Conectar à sessão
tmux attach-session -t $SESSION
```

### Manipulação Avançada de Painéis

```bash
# Trocar posições de painéis
Ctrl+Space + {    # Mover painel para trás
Ctrl+Space + }    # Mover painel para frente

# Rotacionar layout dos painéis
Ctrl+Space + Ctrl+o

# Quebrar painel em nova janela
Ctrl+Space + !

# Juntar painel de outra janela
Ctrl+Space + :join-pane -s 2:1    # Traz painel 1 da janela 2
```

## 🔗 Integração com Seu Ambiente

### Harmonia com Hyprland

Sua configuração foi projetada para funcionar perfeitamente com seu Hyprland:
- `Super+número` → Workspaces do Hyprland
- `Alt+número` → Janelas do tmux  
- `Ctrl+Space+comandos` → Painéis do tmux

Esta separação elimina conflitos e cria um workflow fluido entre níveis.

### Sinergia com Neovim

O vim-tmux-navigator cria uma experiência unificada:
- `Ctrl+h/j/k/l` funciona identicamente em splits do Neovim e painéis do tmux
- Copy mode usa comandos familiares do Vim
- Integração perfeita de clipboard

### Compatibilidade com Ghostty

Sua configuração considera as capacidades do Ghostty:
- Cores e transparência otimizadas
- Suporte completo a caracteres especiais
- Integração com clipcatd nativo

## 🚀 Conclusão - Dominando Sua Configuração

Esta configuração representa centenas de horas de refinamento para criar um ambiente verdadeiramente ergonômico. O segredo para dominar não é memorizar todos os comandos de uma vez, mas desenvolver gradualmente muscle memory para os comandos que você usa frequentemente.

**Lembre-se**: O objetivo não é usar todos os recursos, mas sim usar eficientemente os recursos que melhoram seu workflow específico. Comece simples, adicione complexidade gradualmente, e permita que esta referência cresça com você.

**Dica final**: Mantenha este guia sempre acessível - a maestria vem com o uso consistente, não com a memorização forçada. Cada comando que você incorpora naturalmente ao seu workflow é um passo em direção a um ambiente de desenvolvimento verdadeiramente eficiente.

Sua configuração tmux não é apenas uma ferramenta - é uma extensão natural de como você pensa e trabalha com código.
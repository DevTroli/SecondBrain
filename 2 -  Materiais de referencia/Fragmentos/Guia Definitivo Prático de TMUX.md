**Referência completa para dominar sua configuração personalizada**

## 🎯 Prefix e Conceitos Fundamentais

* **Prefix**: `Ctrl+Space`
* Cada atalho começa com Prefix + tecla(s)
* **Sessão**: workspace persistente (`tmux new -s nome`)
* **Janela**: aba dentro da sessão
* **Painel**: subdivisão da janela

---

## 🏠 Sessões

| Ação                        | Comando                               |
| --------------------------- | ------------------------------------- |
| Criar nova sessão           | `tmux new-session -s <nome>`          |
| Listar sessões              | `tmux ls`                             |
| Anexar (attach) a sessão    | `tmux a -t <nome>`                    |
| Desconectar (detach)        | `Ctrl+Space + d`                      |
| Alternar sessões            | `Ctrl+Space + (`  /  `Ctrl+Space + )` |
| Lista interativa de sessões | `Ctrl+Space + s`                      |
| Renomear sessão             | `Alt + R`                             |
| Matar sessão                | Prefix + `:kill-session -t <nome>`    |

---

## 🪟 Janelas

| Ação                        | Atalho                                |
| --------------------------- | ------------------------------------- |
| Nova janela                 | `Ctrl+Space + c`                      |
| Ir para janela N            | `Alt + <número>` (1–9)                |
| Próxima / Anterior janela   | `Ctrl+Space + n` / `Ctrl+Space + p`   |
| Renomear janela             | `Alt + W`                             |
| Fechar janela (confirmação) | `Ctrl+Space + X`                      |
| Mover janela                | Prefix + `:move-window -t <índice>`   |
| Trocar janelas              | Prefix + `:swap-window -s <s> -t <t>` |

---

## 📱 Painéis (Splits)

| Ação                        | Atalho                                |
| --------------------------- | ------------------------------------- |
| Split vertical              | `Ctrl+Space + Ctrl+V`                 |
| Split horizontal            | `Ctrl+Space + Ctrl+H`                 |
| Navegar entre painéis       | `Ctrl + h/j/k/l`                      |
| Redimensionar (modo repeat) | `Ctrl+Space + H/L/J/K` (5 col/linhas) |
| Zoom painel                 | `Ctrl+Space + z`                      |
| Fechar painel               | `Ctrl+Space + x`                      |
| Transformar em janela       | `Ctrl+Space + !`                      |
| Ciclar layouts              | `Ctrl+Space + Space`                  |
| Sincronizar painéis         | `Ctrl+Space + S`                      |

---

## 📋 Copy Mode e Clipboard

| Ação                    | Atalho                       |
| ----------------------- | ---------------------------- |
| Entrar no Copy Mode     | `Ctrl+Space + v`             |
| Movimentar (estilo Vim) | `h/j/k/l, w, b, 0, $, g, G`  |
| Buscar / navegação      | `/texto`, `?texto`, `n`, `N` |
| Seleção visual          | `v`                          |
| Seleção retangular      | `r`                          |
| Copiar para clipcatd    | `y`                          |
| Sair Copy Mode          | `Esc`                        |
| Colar do clipboard      | `Ctrl+Space + p`             |

---

## 🔌 Plugins e Ferramentas

* **TPM**: instalar no `.tmux.conf`, usar `Prefix + I` para instalar
* **vim-tmux-navigator**: navegação unificada `Ctrl+h/j/k/l`
* **tmux-resurrect / continuum**: `Prefix + Ctrl+S` (salvar), `Prefix + Ctrl+R` (restaurar)
* **Catppuccin**: tema de cores via plugin

---

## ⚙️ Comandos Úteis no Command Mode

Prefix + `:` para abrir prompt de comando tmux

* `new-window -n <nome>`
* `split-window -h -p <percentual>`
* `resize-pane -D/U/L/R <linhas/colunas>`
* `display-message -p "#S:#I:#P"`
* `show-options -g` (globais) / `show-options -w` (janela)

---

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

## 🔧 Comandos de Linha - Modo Expert

### Acessando o Command Mode

```bash
# Entrar no command mode
Ctrl+Space + :

# Comandos mais utilizados:
:new-window -n "nome"           # Nova janela com nome
:split-window -h -p 30          # Split vertical ocupando 30%
:resize-pane -D 5               # Redimensionar 5 linhas para baixo
:setw synchronize-panes on      # Sincronizar painéis
:capture-pane -t 1 -p           # Capturar conteúdo do painel 1
```

## 🚨 Cenários de Troubleshooting

### Problemas Comuns e Soluções

```bash
# Sessão não responde
tmux kill-session -t nome-sessao

# Resetar configuração
tmux source-file ~/.tmux.conf

# Ver processos tmux rodando
ps aux | grep tmux

# Matar servidor tmux completamente
tmux kill-server
```

### Debugging da Configuração

```bash
# Testar configuração sem carregar
tmux -f ~/.tmux.conf.test new-session

# Ver mensagens de erro
tmux show-messages
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

## 📝 Referência Rápida - Cola de Comando

### Essenciais (memorizar primeiro)
- `Ctrl+Space + Ctrl+V` → Split vertical
- `Ctrl+Space + Ctrl+H` → Split horizontal  
- `Ctrl+h/j/k/l` → Navegar painéis
- `Alt+1/2/3/4/5` → Trocar janelas
- `Ctrl+Space + d` → Detach sessão
- `Ctrl+Space + c` → Nova janela

### Secundários (aprender gradualmente)
- `Ctrl+Space + r` → Recarregar config
- `Ctrl+Space + v` → Copy mode
- `Ctrl+Space + S` → Sincronizar painéis
- `Ctrl+Space + z` → Zoom painel
- `Alt+r` → Renomear sessão
- `Alt+w` → Renomear janela

### Avançados (para expertise)
- `Ctrl+Space + H/J/K/L` → Redimensionar
- `Ctrl+Space + Space` → Alternar layouts
- `Ctrl+Space + !` → Painel para janela
- `Ctrl+Space + x` → Fechar painel
- `Ctrl+Space + X` → Fechar janela

## 🎓 Dicas de Aprendizado Progressivo

### Semana 1: Fundamentos
Foque apenas em: criar sessões, splits básicos, navegação entre painéis e detach/attach.

### Semana 2: Organização  
Adicione: múltiplas janelas, renomeação, navegação com Alt+número.

### Semana 3: Eficiência
Incorpore: copy mode, redimensionamento, layouts automáticos.

### Semana 4: Maestria
Explore: sincronização, scripting, workflows automatizados.

**Lembre-se**: O objetivo não é memorizar todos os comandos, mas desenvolver muscle memory para os que você usa frequentemente. Esta referência estará sempre aqui quando precisar!

---

*Esta configuração foi projetada para crescer com você. Comece simples, adicione complexidade gradualmente, e logo você estará navegando pelo tmux como um verdadeiro power user.*](<# Guia Completo da Sua Configuração Tmux Personalizada
*Referência definitiva para dominar cada aspecto da sua configuração ergonômica*

## 🎯 Filosofia da Configuração - Entendendo o Sistema

Esta configuração foi projetada com uma filosofia específica de separação de responsabilidades que elimina conflitos entre Hyprland, Tmux e Neovim. Cada ferramenta opera em sua própria "camada" do sistema:

**Hyprland (Sistema)**: Controla workspaces, janelas do sistema operacional e aplicações usando a tecla `Super` (Windows). Quando você pressiona `Super+1`, está mudando para o workspace 1 do sistema.

**Tmux (Terminal)**: Gerencia sessões, janelas de terminal e painéis usando `Ctrl+Space` como prefix. Quando você pressiona `Alt+1`, está mudando para a janela 1 dentro da sessão tmux atual.

**Neovim (Editor)**: Mantém seus bindings nativos e integra-se perfeitamente com o tmux através do vim-tmux-navigator. Os comandos `Ctrl+h/j/k/l` funcionam tanto para navegar painéis do tmux quanto splits do Neovim.

Esta separação significa que você nunca precisa "pensar" sobre conflitos - cada comando tem seu contexto claro e específico.

## 🚀 Começando do Absoluto Zero

### Conceitos Fundamentais

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

### Primeiros Passos - Sua Primeira Sessão

Para começar sua jornada com tmux, abra seu terminal e execute:

```bash
# Criar sua primeira sessão com nome descritivo
tmux new-session -s meu-projeto

# Ou simplesmente para começar rápido
tmux
```

Agora você está dentro do tmux! Note que sua barra de status apareceu no topo da tela. Esta barra mostra informações valiosas: nome da sessão (à esquerda), janelas ativas (centro) e informações do sistema (à direita).

### O Sistema de Prefix - Sua Chave Mestra

O conceito mais importante no tmux é o "prefix". Em nossa configuração, `Ctrl+Space` é seu prefix - pense nele como uma "tecla mágica" que ativa o modo comando do tmux. 

Quando você vê `Ctrl+Space + v` neste guia, isso significa:
1. Pressione e segure `Ctrl+Space`
2. Solte ambas as teclas
3. Pressione `v`

Este sistema evita conflitos com outros programas porque reserva `Ctrl+Space` exclusivamente para o tmux.

## 🏠 Dominando Sessões - Seu Ambiente Persistente

### Conceito de Persistência

A beleza das sessões tmux está na persistência. Diferente de uma janela normal do terminal que desaparece quando fechada, uma sessão tmux continua rodando em segundo plano. Você pode se "desconectar" dela (detach) e reconectar (attach) mais tarde, encontrando tudo exatamente como deixou.

### Comandos Essenciais de Sessão

```bash
# Criar nova sessão com nome específico
tmux new-session -s projeto-ecommerce

# Listar todas as sessões ativas
tmux list-sessions
# Forma abreviada que você usará frequentemente:
tmux ls

# Conectar-se a uma sessão existente
tmux attach-session -t projeto-ecommerce
# Forma abreviada:
tmux a -t projeto-ecommerce

# Desconectar-se da sessão atual (sem fechá-la)
Ctrl+Space + d
```

### Gerenciamento Avançado de Sessões

```bash
# Dentro do tmux, renomear a sessão atual
Alt + R
# O comando abrirá um prompt onde você pode digitar o novo nome

# Ver lista interativa de todas as sessões
Ctrl+Space + s
# Use as setas para navegar e Enter para conectar

# Trocar rapidamente entre sessões
Ctrl+Space + (    # Sessão anterior
Ctrl+Space + )    # Próxima sessão

# Criar nova sessão sem sair da atual
Ctrl+Space + :new-session -s novo-projeto
```

### Estratégia de Organização de Sessões

Desenvolva o hábito de criar sessões temáticas. Por exemplo:
- `trabalho`: Para tarefas profissionais gerais
- `projeto-x`: Para desenvolvimento de projetos específicos
- `admin`: Para administração de sistema
- `experimentos`: Para testes e aprendizado

Esta organização permite alternar contextos rapidamente sem perder o foco.

## 🪟 Trabalhando com Janelas - Suas Abas Inteligentes

### Conceito de Janelas no Tmux

Pense nas janelas do tmux como "abas" super poderosas. Cada janela pode conter múltiplos painéis e mantém seu próprio contexto de trabalho. A diferença crucial é que janelas tmux são independentes de janelas do sistema operacional.

### Criação e Navegação Básica

```bash
# Criar nova janela (sempre abre no diretório atual)
Ctrl+Space + c

# Navegar entre janelas sem usar prefix - muito mais ergonômico!
Alt + 1    # Ir diretamente para janela 1
Alt + 2    # Ir diretamente para janela 2
Alt + 3    # Ir diretamente para janela 3
# ... até Alt + 9

# Navegação sequencial (quando tiver muitas janelas)
Alt + h    # Janela anterior
Alt + l    # Próxima janela
```

### Gerenciamento Avançado de Janelas

```bash
# Renomear janela atual
Alt + W
# Digite o novo nome e pressione Enter

# Fechar janela atual (com confirmação de segurança)
Ctrl+Space + X

# Mover janela para uma posição específica
Ctrl+Space + :move-window -t 3
# Isso move a janela atual para a posição 3

# Trocar posições de janelas
Ctrl+Space + :swap-window -s 2 -t 1
# Troca as posições das janelas 2 e 1
```

### Estratégia de Organização de Janelas

Desenvolva um padrão consistente para suas janelas. Por exemplo, em um projeto de desenvolvimento web:
- Janela 1: Desenvolvimento (editor + servidor)
- Janela 2: Git e controle de versão
- Janela 3: Testes e debugging
- Janela 4: Documentação e navegação

Esta consistência acelera drasticamente seu workflow.

## 📱 Dominando Painéis - Dividindo Inteligentemente

### Filosofia dos Splits

Os painéis permitem dividir uma janela em múltiplas seções, cada uma rodando um comando diferente. Nossa configuração usa mnemônicos intuitivos: 'v' para vertical (lado a lado) e 's' para split horizontal (um sobre o outro).

### Criação de Painéis

```bash
# Split vertical - cria painéis lado a lado
Ctrl+Space + v

# Split horizontal - cria painéis empilhados
Ctrl+Space + s
```

### Navegação Inteligente Entre Painéis

Esta é uma das características mais elegantes da configuração. A navegação funciona perfeitamente tanto em painéis vazios quanto dentro do Neovim:

```bash
# Navegar entre painéis (funciona também no Neovim!)
Ctrl + h    # Painel à esquerda
Ctrl + j    # Painel abaixo
Ctrl + k    # Painel acima
Ctrl + l    # Painel à direita

# Quando Ctrl+l conflita com clear screen:
Ctrl + \    # Último painel usado
```

O segredo está no vim-tmux-navigator que detecta automaticamente se você está no Neovim e roteia os comandos adequadamente.

### Redimensionamento Preciso de Painéis

```bash
# Redimensionar painéis (modo repeat - pressione prefix uma vez, depois use múltiplas vezes)
Ctrl+Space + H    # Diminuir largura (5 colunas por vez)
Ctrl+Space + L    # Aumentar largura
Ctrl+Space + J    # Diminuir altura (5 linhas por vez)
Ctrl+Space + K    # Aumentar altura
```

### Gerenciamento Avançado de Painéis

```bash
# Alternar entre layouts predefinidos automaticamente
Ctrl+Space + Tab      # Próximo layout
Ctrl+Space + Shift+Tab    # Layout anterior

# Zoom: fazer um painel ocupar toda a janela temporariamente
Ctrl+Space + f
# Pressione novamente para voltar ao layout original

# Transformar painel atual em nova janela
Ctrl+Space + !

# Fechar painel atual (com confirmação)
Ctrl+Space + x

# Sincronizar entrada em todos os painéis (útil para administração)
Ctrl+Space + S
# Tudo que você digitar será enviado para todos os painéis
```

### Layouts Inteligentes

O tmux oferece vários layouts automáticos que se ajustam conforme você adiciona ou remove painéis:
- **even-horizontal**: Painéis lado a lado com larguras iguais
- **even-vertical**: Painéis empilhados com alturas iguais
- **main-horizontal**: Um painel principal no topo, outros embaixo
- **main-vertical**: Um painel principal à esquerda, outros à direita
- **tiled**: Organização em grade

Use `Ctrl+Space + Tab` para ciclar entre estes layouts automaticamente.

## 📋 Copy Mode - Seleção e Clipboard Avançados

### Conceito do Copy Mode

O copy mode transforma seu terminal em um editor somente leitura onde você pode navegar, buscar e selecionar texto usando comandos estilo Vim. É especialmente útil para copiar saídas de comandos longos ou navegar logs extensos.

### Entrando e Navegando

```bash
# Entrar no copy mode
Ctrl+Space + v

# Navegação básica (estilo Vim)
h    # Esquerda
j    # Baixo  
k    # Cima
l    # Direita

# Navegação por palavras
w    # Próxima palavra
b    # Palavra anterior
e    # Final da palavra atual

# Navegação por linha
0    # Início da linha
$    # Final da linha
^    # Primeiro caractere não-branco

# Navegação por tela
Ctrl+u    # Meia tela para cima
Ctrl+d    # Meia tela para baixo
g         # Início do buffer
G         # Final do buffer
```

### Busca Inteligente

```bash
# No copy mode:
/texto    # Buscar "texto" para frente
?texto    # Buscar "texto" para trás
n         # Próxima ocorrência
N         # Ocorrência anterior
```

### Seleção e Cópia

```bash
# Iniciar seleção visual
v

# Alternar entre seleção linear e retangular
r

# Copiar seleção para o clipboard do sistema (integração com clipcatd)
y

# Sair do copy mode
Escape
```

### Colagem

```bash
# Colar do clipboard do sistema
Ctrl+Space + p
```

Esta integração com clipcatd significa que o que você copia no tmux fica disponível em todo o sistema, e vice-versa.

## 🔧 Comandos de Linha - Modo Expert

### Acessando o Command Mode

```bash
# Entrar no command mode (prompt de comando)
Ctrl+Space + :
```

### Comandos Essenciais do Command Mode

```bash
# Criar nova janela com nome específico
:new-window -n "servidor-web"

# Split com tamanho específico (30% da largura)
:split-window -h -p 30

# Redimensionar painel para tamanho exato
:resize-pane -t 1 -x 80    # Painel 1 com 80 colunas
:resize-pane -t 1 -y 24    # Painel 1 com 24 linhas

# Mover painel para outra janela
:move-pane -t 2:1    # Move painel atual para janela 2, posição 1

# Capturar conteúdo de um painel
:capture-pane -t 1 -p    # Mostra conteúdo do painel 1
```

### Comandos de Informação e Debug

```bash
# Mostrar informações detalhadas
:display-message -p "Sessão: #S, Janela: #I, Painel: #P"

# Listar todos os atalhos ativos
:list-keys

# Ver configurações atuais
:show-options -g    # Opções globais
:show-options -w    # Opções da janela

# Informações do servidor
:info
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

## 🚨 Troubleshooting e Recuperação

### Problemas Comuns e Soluções

**Sessão não responde ou travou:**
```bash
# Do terminal externo:
tmux kill-session -t nome-sessao

# Ou matar processo específico dentro da sessão:
# Pressione Ctrl+Space + : depois:
:kill-pane -t 1    # Mata painel 1
```

**Configuração não carregou corretamente:**
```bash
# Recarregar dentro do tmux:
Ctrl+Space + r

# Ou do terminal externo:
tmux source-file ~/.tmux.conf
```

**Perdi uma sessão:**
```bash
# Listar todas as sessões:
tmux ls

# Conectar-se à sessão perdida:
tmux a -t nome-sessao
```

**Tmux não inicia ou apresenta erros:**
```bash
# Ver mensagens de erro:
tmux show-messages

# Testar configuração:
tmux -f ~/.tmux.conf new-session -d test-session

# Reset completo (cuidado - mata todas as sessões):
tmux kill-server
```

### Recuperação de Emergência

Se algo der muito errado, você sempre pode:
1. Sair completamente do tmux: `Ctrl+Space + d`
2. Matar o servidor: `tmux kill-server`
3. Reiniciar: `tmux`

## 🏗️ Workflows Práticos - Casos de Uso Reais

### Workflow de Desenvolvimento Web Completo

**Configuração inicial:**
```bash
# Criar sessão do projeto
tmux new-session -s webapp

# Configurar janela de desenvolvimento
Ctrl+Space + v              # Split vertical
# Painel esquerdo: abrir Neovim
nvim .
# Ctrl+h para ir ao painel direito
# Painel direito: servidor de desenvolvimento
npm run dev

# Nova janela para git
Ctrl+Space + c
Alt + W    # Renomear para "git"

# Nova janela para testes
Ctrl+Space + c  
Alt + W    # Renomear para "testes"
```

**Navegação durante desenvolvimento:**
```bash
Alt + 1    # Voltar ao desenvolvimento
# Ctrl+h/l para alternar entre editor e servidor
Alt + 2    # Git e commits
Alt + 3    # Executar testes
```

### Workflow de Administração de Sistemas

**Monitoramento de múltiplos servidores:**
```bash
# Criar sessão admin
tmux new-session -s admin

# Configurar 4 painéis para diferentes servidores
Ctrl+Space + v    # Split vertical
Ctrl+Space + s    # Split horizontal no painel esquerdo
Ctrl+Space + l    # Ir para painel direito
Ctrl+Space + s    # Split horizontal no painel direito

# Em cada painel, conectar a um servidor diferente
# Painel 1: ssh user@server1
# Painel 2: ssh user@server2
# Painel 3: ssh user@server3
# Painel 4: ssh user@server4

# Sincronizar comandos em todos os servidores
Ctrl+Space + S
# Agora todos os comandos são executados simultaneamente
```

### Workflow de Análise de Logs

**Monitoramento em tempo real:**
```bash
tmux new-session -s logs

# Configurar painéis especializados
Ctrl+Space + s    # Split horizontal
Ctrl+Space + v    # Split vertical no painel de baixo

# Painel 1 (topo): tail -f /var/log/nginx/access.log
# Painel 2 (esquerda embaixo): tail -f /var/log/nginx/error.log  
# Painel 3 (direita embaixo): htop

# Janela adicional para análise
Ctrl+Space + c
# Usar para grep, awk, análises específicas
```

## 🔄 Persistência e Continuidade

### Usando Tmux-Resurrect

Sua configuração inclui plugins que automatizam a persistência:

```bash
# Salvar estado atual manualmente (raramente necessário)
Ctrl+Space + Ctrl+S

# Restaurar último estado salvo (raramente necessário)  
Ctrl+Space + Ctrl+R
```

**Automático**: O tmux-continuum salva automaticamente a cada 15 minutos e restaura tudo quando você reinicia o sistema.

### O que é Preservado

- Estrutura de sessões, janelas e painéis
- Programas em execução em cada painel
- Diretório de trabalho de cada painel
- Conteúdo visível dos painéis
- Configurações de layout

### Estratégias de Backup

Para projetos críticos, considere:
1. Scripts de inicialização que recriam o ambiente
2. Usar nomes descritivos para sessões
3. Documentar layouts complexos

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

### Recursos de Busca e Navegação

```bash
# Buscar em todas as janelas
Ctrl+Space + f    # Busca interativa

# Navegar histórico de comandos
Ctrl+Space + :show-messages    # Ver mensagens do sistema

# Capturar e salvar conteúdo
Ctrl+Space + :capture-pane -p %3E saida.txt
```

## 📋 Referência Rápida Estratificada

### Nível Iniciante (Memorize Primeiro)
**Essenciais absolutos para começar:**
- `tmux new-session -s nome` → Criar sessão
- `tmux a -t nome` → Conectar à sessão
- `Ctrl+Space + d` → Desconectar da sessão
- `Ctrl+Space + v` → Split vertical
- `Ctrl+Space + s` → Split horizontal
- `Ctrl+h/j/k/l` → Navegar painéis
- `Alt+1/2/3` → Trocar janelas

### Nível Intermediário (Adicione Gradualmente)
**Para eficiência no dia a dia:**
- `Ctrl+Space + c` → Nova janela
- `Alt+R` → Renomear sessão
- `Alt+W` → Renomear janela
- `Ctrl+Space + r` → Recarregar config
- `Ctrl+Space + v` → Copy mode
- `Ctrl+Space + p` → Colar
- `Ctrl+Space + f` → Zoom painel

### Nível Avançado (Para Maestria)
**Para workflows sofisticados:**
- `Ctrl+Space + H/J/K/L` → Redimensionar painéis
- `Ctrl+Space + S` → Sincronizar painéis
- `Ctrl+Space + Tab` → Alternar layouts
- `Ctrl+Space + !` → Painel para janela
- `Ctrl+Space + :` → Command mode
- Scripts de automação personalizada

### Nível Expert (Personalização Total)
**Para cenários específicos:**
- Integração com IDEs
- Scripts de deploy automatizado
- Monitoramento complexo
- Integração com ferramentas de CI/CD

## 🎓 Plano de Aprendizado Estruturado

### Semana 1: Fundamentos Sólidos
**Objetivo**: Substituir uso básico do terminal

**Foque exclusivamente em:**
- Criar e conectar sessões
- Splits básicos (vertical/horizontal)
- Navegação entre painéis
- Detach/attach

**Exercício prático**: Use apenas tmux por uma semana para tarefas simples do terminal.

### Semana 2: Organização e Múltiplos Contextos
**Objetivo**: Gerenciar vários projetos simultaneamente

**Adicione:**
- Múltiplas janelas por sessão
- Navegação com Alt+número
- Renomeação de sessões e janelas
- Múltiplas sessões temáticas

**Exercício prático**: Mantenha 3 sessões simultaneamente (trabalho, pessoal, experimentos).

### Semana 3: Eficiência e Workflow
**Objetivo**: Acelerar tarefas repetitivas

**Incorpore:**
- Copy mode para seleção de texto
- Redimensionamento de painéis
- Layouts automáticos
- Sincronização de painéis

**Exercício prático**: Criar um workflow de desenvolvimento completo.

### Semana 4: Automação e Personalização
**Objetivo**: Adaptar tmux ao seu trabalho específico

**Explore:**
- Scripts de inicialização
- Command mode avançado
- Integração com outras ferramentas
- Troubleshooting avançado

**Exercício prático**: Criar scripts para seus projetos mais comuns.

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

Sua configuração tmux não é apenas uma ferramenta - é uma extensão natural de como você pensa e trabalha com código.>)#
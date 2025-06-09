# Noice.nvim - Guia de Referência Rápida

## A Realidade do Noice.nvim

Olha, vamos ser honestos aqui. O Noice.nvim é mais um desses plugins que promete "revolucionar" sua experiência no Neovim, mas na prática é só mais uma camada de complexidade em cima de algo que já funcionava. Dito isso, se você já decidiu usar essa parafernália, pelo menos faça direito.

## O Que Este Troço Realmente Faz

O Noice intercepta praticamente toda comunicação visual do Neovim e decide onde mostrar as coisas. Messages, cmdline, LSP progress, tudo. É como ter um gerente de micro-management que quer controlar até onde você respira. Mas funciona, então vamos em frente.

### Dependencies - As Inevitáveis Dependências

Antes de mais nada, você vai precisar de mais três plugins porque, claro, nada é simples:
- `MunifTanjim/nui.nvim` - Interface de usuário
- `rcarriga/nvim-notify` - Notificações bonitas
- `nvim-telescope/telescope-fzf-native.nvim` - Para integração com Telescope

## Configuração do nvim-notify

O nvim-notify vem configurado com essas opções no código:
- Background escuro `#0d1117` (porque todo mundo usa tema escuro mesmo)
- Timeout de 3 segundos (tempo suficiente para você ler sem irritar)
- Animação `fade_in_slide_out` (porque alguém achou bonito)
- Render `wrapped-compact` (economiza espaço na tela)

Os ícones são minimalistas: `✘` para erro, `▲` para warning, `●` para info. Funcional, sem frescura.

## Cmdline - A Linha de Comando Reimaginada

O Noice substitui a cmdline padrão por um popup centralizado. Parece moderno, mas na prática você só trocou uma linha embaixo por uma caixa no meio da tela. Configurado para aparecer na linha 5, centralizado, com 60 caracteres de largura.

### Formatos de Comando Reconhecidos

- `:` - Comandos normais (ícone `$`)
- `/` - Busca para baixo (ícone de lupa, título "Buscar ↓")
- `?` - Busca para cima (ícone de lupa, título "Buscar ↑")
- `:!` - Comandos shell (ícone ⌘)
- `:lua` - Código Lua (ícone ◐)
- `:help` - Help (ícone ❓)

## Messages - Onde as Mensagens Aparecem

Por padrão, todas as mensagens usam o sistema de notify. Erros e warnings também vão para notify em vez de aparecer na parte inferior. É mais limpo visualmente, mas você perde o histórico imediato que ficava sempre visível.

## Popupmenu - Autocomplete com Estilo

O menu de autocompletar ganha ícones customizados para cada tipo de item. Function vira `ƒ`, Class vira `◉`, File vira `⬜`. É bonitinho, mas não muda funcionalmente nada. O backend usa NUI para render mais suave.

## LSP Integration - Onde a Coisa Fica Interessante

O Noice intercepta:
- Hover documentation (aquelas janelas que aparecem quando você para o cursor)
- Signature help (parâmetros de função)
- Progress messages (aquela barrinha chata do LSP carregando)

O progress fica em modo "mini" no canto da tela, menos intrusivo que o padrão.

## Presets - Configurações Prontas

Quatro presets ativados:
- `bottom_search` - Busca na parte inferior
- `command_palette` - Visual tipo VS Code
- `long_message_to_split` - Mensagens longas abrem em split
- `lsp_doc_border` - Bordas na documentação LSP

## Views - Como as Coisas Aparecem

### cmdline_popup
Posição fixa na linha 5, centralizado, 60 caracteres de largura, bordas arredondadas com padding interno.

### popup
Janelas popup ocupam 80% da largura e 60% da altura da tela, centralizadas.

### mini
Canto inferior direito, timeout de 3 segundos para mensagens rápidas.

## Routes - Filtros de Mensagem

O sistema de rotas determina onde cada tipo de mensagem aparece:

### Route 1 - Mensagens de Arquivo
Mensagens tipo "150L, 3500B" ou "5 more lines" vão para view mini. Essas são as mensagens chatinhas que aparecem toda vez que você salva ou navega no arquivo.

### Route 2 - Erros e Warnings
Mensagens de erro (`emsg`) e warning (`wmsg`) vão para notify em vez de aparecer na cmdline.

## Keymaps - Atalhos Úteis

O código define estes atalhos com `<leader>`:
- `<leader>nh` - Histórico de mensagens
- `<leader>nl` - Última mensagem
- `<leader>ne` - Lista de erros
- `<leader>nd` - Desabilitar Noice
- `<leader>nn` - Habilitar Noice
- `<leader>nt` - Telescope Noice (se Telescope estiver instalado)

## Integração com Telescope

Se você tem Telescope instalado, o Noice carrega automaticamente a extensão. Permite buscar no histórico de mensagens via Telescope, que é mais útil que parece.

## Customização de Cores

O código inclui um autocmd que ajusta as cores quando você muda o colorscheme:
- Surface: `#21262d` (fundo)
- Green: `#a7c080` (destaque verde)
- Sky: `#87c095` (destaque azul)
- Foreground: `#e6edf3` (texto)

Aplica essas cores nos popups do cmdline e bordas.

## Sobre Performance...

O Noice adiciona uma camada extra de processamento em praticamente toda interação visual. Cada mensagem passa pelo sistema de routing, cada popup é renderizado via NUI. Em máquinas mais antigas ou com configurações complexas, pode causar lag perceptível.

## Quando Usar (Ou Não Usar)

**Use se:**
- Você valoriza aparência sobre simplicidade
- Tem uma máquina decente
- Não se importa com mais dependências
- Gosta de ter controle granular sobre onde as coisas aparecem

**Não use se:**
- Prefere o comportamento padrão do Neovim
- Tem uma configuração minimalista
- Performance é prioridade
- Não quer lidar com possíveis bugs de integração

## Mas no final...

O Noice.nvim faz o que promete: muda como as mensagens aparecem no Neovim. É bem implementado, tem boa documentação e funciona. Mas questione se você realmente precisa dessa complexidade adicional. Às vezes, o padrão do Neovim é padrão por um bom motivo.

Se você já decidiu usar, a configuração mostrada é sólida e bem balanceada. Não vai quebrar seu workflow, mas também não vai revolucionar sua vida. É só mais um plugin.
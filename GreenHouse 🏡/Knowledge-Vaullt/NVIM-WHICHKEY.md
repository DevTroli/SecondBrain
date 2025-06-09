# Which-Key: Guia de Referência Rápida

## A Realidade do Which-key.nvim

Vamos ser diretos: você provavelmente esquece metade dos keymaps que configurou. O which-key.nvim é basicamente um plugin que te salva da sua própria memória fraca, mostrando uma janelinha com todos os atalhos disponíveis quando você hesita por meio segundo. É útil? Absolutamente. É necessário para vim masters que memorizaram tudo? Definitivamente não. Mas se você é um mortal comum, aceite a ajuda.

## O Que Este Plugin Realmente Faz

O which-key intercepta suas teclas quando você para de digitar e mostra um popup com todas as combinações possíveis a partir do que você já digitou. É como ter um menu de contexto inteligente que aparece quando você precisa. Digitou `<leader>` e ficou pensando? Boom - aparece uma lista com tudo que começa com leader. É muscle memory assistida por software.

## Como Funciona o Sistema de Delay

O plugin tem um delay configurado para 300ms. Isso significa que você tem 0.3 segundos para completar seu keymap antes da janela aparecer. É rápido o suficiente para não atrapalhar quem sabe o que está fazendo, mas lento o suficiente para te dar tempo de lembrar sozinho. Se você for mais rápido que isso, o plugin nem aparece.

## Estrutura Visual Integrada com Catppuccin

A configuração está harmonizada com seu tema Catppuccin Mocha-Green:

### Cores Aplicadas
- **WhichKey**: Texto principal em branco (`#e6edf3`) com negrito
- **WhichKeyGroup**: Grupos em verde (`#a7c080`) destacado  
- **WhichKeyDesc**: Descrições em cinza claro (`#b1bac4`)
- **WhichKeyBorder**: Bordas em verde para consistência
- **WhichKeyFloat**: Background em `#21262d` (surface1 do seu tema)

### Layout Minimalista
- Bordas simples (`single`) sem ornamentação desnecessária
- Padding de 1x2 para respiração visual adequada
- Largura adaptável entre 20-50 caracteres
- Alinhamento à esquerda para leitura natural

## Sistema de Ícones Semânticos

Diferente dos emojis chamativos, a configuração usa símbolos Unicode funcionais:

### Ícones de Navegação
- `→` para próximo/next
- `←` para anterior/prev  
- `↑↓` para up/down
- `⇄` para toggle/alternar

### Ícones de Funcionalidade
- `⊞` para buffer/window (caixas)
- `◉` para find/search (círculo cheio)
- `×` para delete/quit/error
- `○` para save/todo (círculo vazio)
- `※` para LSP/notes (asterisco de referência)
- `⚡` para git (ação rápida)

Esses símbolos são universalmente compatíveis e mantêm significado visual claro.

## Sistema de Filtros - Reduzindo o Ruído

A configuração inclui filtros inteligentes para ocultar mappings óbvios:

### Padrões Excluídos
- Comandos Ctrl básicos (`^<C%-`)
- Movimentos hjkl básicos
- Números de 0-9
- Comandos de comentário do vim-commentary

### Por Que Filtrar?
Ninguém precisa ser lembrado que `h` move para a esquerda ou que `5` é o número 5. O which-key deve focar nos mappings customizados e não óbvios. Se você ainda não sabe os movimentos básicos do Vim, o which-key não vai resolver seus problemas fundamentais.

## Organização dos Grupos Principais

### Leader Groups (`<leader>`)
A organização segue convenções lógicas:
- `b` para Buffer operations
- `f` para Find/Search (Telescope)
- `g` para Git operations  
- `l` para LSP functions
- `n` para Noice controls
- `t` para Toggle options
- `w` para Window management
- `x` para Trouble/Diagnostics

### Navigation Groups
- `]` para "next" operations
- `[` para "previous" operations
- `g` para "goto" commands
- `z` para folding operations

## Triggers Configurados

O plugin monitora estas teclas iniciais:
- `<auto>` para detecção automática
- `<leader>` para comandos customizados
- `g` para comandos goto
- `]` e `[` para navegação sequencial
- `z` para comandos de folding

## Performance e Overhead

O which-key adiciona latência mínima quando você digita rápido (não aparece). O overhead principal vem quando você para e o popup precisa ser renderizado. Em máquinas decentes, é imperceptível. Em máquinas antigas, pode causar um micro-delay quando aparece.

## Customização de Highlights

O sistema de highlights está integrado com seu tema através de um autocmd que dispara quando o colorscheme muda. Isso garante que as cores permaneçam consistentes mesmo se você trocar temas posteriormente.

### Highlights Principais
- Grupos em verde para destaque
- Texto em branco para legibilidade máxima
- Separadores em verde para consistência visual
- Background escuro para contraste adequado

## Integração com Plugins Comuns

A configuração assume que você usa:
- **Telescope** para find operations
- **Neotree** para file explorer
- **Gitsigns** para git integration
- **LSP** nativo para language server

Se você não usa algum desses, apenas remova ou substitua os mappings correspondentes.

## Quando Este Plugin É Útil

**Cenários Positivos:**
- Você tem muitos keymaps customizados
- Trabalha com configurações complexas de equipe
- Está aprendendo uma nova configuração
- Alterna entre diferentes setups do Neovim
- Quer descobrir funcionalidades esquecidas

**Cenários Questionáveis:**
- Você já memorizou todos seus mappings
- Prefere minimal distraction durante coding
- Usa principalmente comandos básicos do Vim
- Tem um setup extremamente simples

## Sobre Produtividade...

O which-key não vai te tornar mais produtivo diretamente. Ele vai reduzir o tempo perdido lembrando de atalhos e descobrindo funcionalidades. É um plugin de qualidade de vida, não de performance. Se você já é eficiente com seus mappings, pode ser redundante. Se você vive esquecendo atalhos, é uma salvação.

## Configuração Inteligente vs Configuração Completa

A configuração fornecida é **inteligente**: foca nos mappings mais importantes e filtra o ruído. Uma configuração **completa** mostraria literalmente tudo, incluindo cada movimento básico do Vim. A primeira é útil; a segunda é poluição visual.

## Mas na realidade do cotidiano:

O which-key.nvim é um plugin bem feito que resolve um problema real: você esquecer seus próprios atalhos. A implementação é sólida, a performance é adequada, e a customização é flexível. 

Se você tem uma configuração complexa do Neovim com muitos plugins e mappings customizados, este plugin vai te economizar tempo e frustração. Se você tem um setup minimalista com poucos atalhos, provavelmente é overhead desnecessário.

A configuração apresentada equilibra funcionalidade com simplicidade, integra visualmente com seu tema, e foca nos mappings que realmente importam. Não vai revolucionar seu workflow, mas vai torná-lo menos dependente da sua memória imperfeita.
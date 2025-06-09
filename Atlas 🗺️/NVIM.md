# Transformando um NVIM Cru & Feio em uma IDE Superestimada

## Dia 0: Fundamentos e Primeira Impressão

Hora de entender por que Neovim é a escolha dos desenvolvedores que cansaram de **IDEs pesadas**. A maioria corre pro VSCode ou IntelliJ achando que é “plug-and-play”, mas acaba preso em menus e gastando memória à toa. Com Neovim, **você escolhe cada peça do jogo** – desde os atalhos até a cara do editor. 🚀

Não é só nostalgia: O *Alpha Dashboard* que você vai instalar logo logo é seu ritual de preparação. Cada vez que abrir o Neovim, em vez de uma tela preta (ou deus me livre ...branca ) sem graça,  vai aparece um **painel estiloso** com opções (Novo Arquivo, Git, Buscar, Configs, Sair) que realmente fazem sentido no seu fluxo. Esse pequeno ritual – que o plugin [[NVIM-ALPHA|Alpha Dashborad]] faz acontecer – treina seu cérebro a entrar no “modo codificação” com foco e se precisar até um pouquinho de auto-sabotagem: **pois você sabe que sempre pode sair (Quit) pela tecla q** se estiver complicado! 😉

* 😜 **IDEs mainstream** (VSCode, IntelliJ, ZED, Xcode e etc...) têm atalhos e interface engessados, menus enterrados e recursos inúteis que travam tudo.
* 🎉 **Neovim** te devolve o controle: configure **tudo** (atalhos, cores, plugins) do seu jeito, sem surpresas.
* 📺 **Alpha Dashboard**: um plugin de boas-vindas que dá identidade ao seu Neovim, lembrando que *você manda aqui* antes de começar a codar.

**📋 Checklist do Dia 1:**

* [ ] Entender as vantagens do Neovim sobre IDEs tradicionais (memória, controle e velocidade)
* [ ] Conhecer o propósito do [[NVIM-ALPHA|Alpha Dashborad]] ao iniciar o Neovim
* [ ] Configurar o diretório inicial do Neovim para começar a personalização

## Dia 1: Gerenciador de Plugins e Setup Inicial

Agora que já entendeu a filosofia, é hora de montar a base técnica. Primeiro passo: **lazy.nvim** (ou outro gerenciador de plugins). Com ele você só escreve em Lua o que quer instalar, e o Neovim faz o resto automaticamente. Organize seu `init.lua` para carregar o *lazy.nvim* e, dali, coloque cada plugin em arquivos `lua/plugins/*.lua`. Assim você mantém tudo limpinho.

Por exemplo, inclua no lazy:

* O plugin do [[NVIM-ALPHA|Alpha Dashborad]] para ter o painel inicial.
* Um plugin de ícones como `nvim-web-devicons` para embelezar a interface.
* No futuro, ainda vamos adicionar um Color-Scheme moderno, tipo Catppuccin (saiba mais na seção [[NVIM#Transformando um NVIM Cru & Feio em uma IDE Superestimada#Dia 5 Estilo e Personalização Avançada |Color-Scheme]], e qualquer outro plugin básico.

Em resumo, hoje você vai *construir a fundação da sua IDE*: um gerenciador de plugins funcional e alguns plugins iniciais. Depois disso, basta reiniciar o Neovim e deixar o `lazy.nvim` baixar tudo. Se der erro, corrija a configuração; se não, teste com `:checkhealth` ou abrindo um projeto. 😉

* 🎁 **Instalar lazy.nvim:** Configure o plugin manager no `init.lua` (algo como `require("config.lazy")`).
* 🔌 **Adicionar plugins essenciais:** no lazy, liste Alpha Dashboard, ícones, tema, etc.
* 🔄 **Testar a instalação:** reinicie o Neovim e confirme se tudo foi instalado corretamente (e use `:checkhealth` ou abra alguns arquivos).

**📋 Checklist do Dia 2:**

* [ ] Instalar e configurar o lazy.nvim como gerenciador de plugins
* [ ] Incluir plugins básicos ([[NVIM-ALPHA|Alpha Dashborad]], nvim-web-devicons, tema) nos plugins
* [ ] Reiniciar o Neovim e verificar que os plugins foram carregados no arquivo de plugins

## Dia 2: Busca Inteligente e Navegação de Arquivos

Sua IDE caseira já começou a ganhar forma. Agora vem a parte de produtividade: **buscar arquivos e navegar no projeto** com agilidade. Para isso temos dois trunfos poderosos: [[NVIM-TELESCOPE|TeleScope]] e [[NVIM-NEOTREE|Neo-Tree]].

* **[[NVIM-TELESCOPE|TeleScope]]:** imagine um localizador fuzzy mega-rápido. É ele quem permite que você digite trechos de nome de arquivo ou até texto e ache o que precisa num piscar de olhos. Já vai acostumando: você não precisa digitar o nome completo – “telesc” acha “telescope.lua”, por exemplo. Use `<Ctrl+F>` ou um atalho seu (como `<leader>ff`) para abrir a busca de arquivos, e `<Ctrl+G>` para buscar por texto. O plugin roda sem preview por padrão para ser ultra rápido, mas você pode mudar depois.
* **[[NVIM-NEOTREE|Neo-Tree]]:** pense na árvore de arquivos lateral das IDEs tradicionais, mas totalmente em estilo Vim. A navegação é por teclado e foi desenhada pra ficar na sua muscle memory: use `j/k` para cima/baixo, pressione `Space` para expandir ou fechar pastas, `Enter` para abrir um arquivo (ou `i`/`s` para abrir em split, `t` em nova aba), e `w` para escolher em que janela abrir. Clicando não, claro! Tudo no teclado. Você vai ver que é *rapido* mexer em projetos grandes assim.

Com esses dois plugins, dizer adeus àquelas navegações lentas de Explorer/Bússola. O [[NVIM-TELESCOPE|TeleScope]] encontra tudo, e o [[NVIM-NEOTREE|Neo-Tree]] exibe a hierarquia do projeto numa sidebar dinâmica. É quase como ter um GPS no código: nada mais de “cadê aquele arquivo mesmo?”. 😉

**⚙️ Exemplos de atalhos úteis:**

* `<Ctrl+F>`: abre a busca do Telescope por arquivos.
* `<Ctrl+G>`: abre a busca do Telescope por texto dentro de arquivos.
* `Space`: no Neo-tree expande/colapsa pastas.
* `Enter` / `i` / `s` / `t`: no Neo-tree abre arquivo na janela atual ou em split/aba.

**📋 Checklist do Dia 3:**

* [ ] Procurar arquivos com o plugin [[NVIM-TELESCOPE|TeleScope]] (Fuzzy Finder)
* [ ] Navegar na árvore de arquivos com o [[NVIM-NEOTREE|Neo-Tree]]
* [ ] Praticar atalhos básicos de busca (`Ctrl+F`, `Ctrl+G`) e de navegação (`Space`, `Enter`, `t`)

## Dia 3: Buffers e Sessões no Neovim

*"[[NVIM-BUFFER|Buffers]] são como abas de navegador, mas com superpoderes. Configurar bem = produtividade x10"*

### 🧠 Contexto: Por que Buffers Importam?

No Vim clássico, gerenciar múltiplos arquivos com `:bn`, `:bp`, `:ls` vira confusão. Você nunca sabe em que [[NVIM-BUFFER|Buffer]] está. Num IDE moderno, as abas ficam visíveis; no Neovim, precisamos de plugins que tragam essa clareza sem perder a flexibilidade do Vim.

#### [[NVIM-BUFFER#**Buffer vs Tab vs Window - Entendendo de vez**|Buffer vs Tab vs Windows]]

```text
Buffer = Arquivo carregado na memória (invisível)
Window = Janela exibindo um buffer (visível)
Tab    = Conjunto de windows (workspace)
```

**Analogia:**

* [[NVIM-BUFFER|Buffer]] = documento
* *Window* = espaço onde você escreve
* *Tab* = espaço de trabalho

---

### 🚀 Workflow: Como Usar na Prática

1. **Feature Development**

   ```text
   Alt+1 → src/main.py
   Alt+2 → src/utils.py
   Alt+3 → tests/test_main.py
   H/L   → navegar buffers
   ```
2. **Multi‐projeto**

   * **Tab 1** (Frontend): `Ctrl+T`, `cd frontend/`, buffers Alt+1..
   * **Tab 2** (Backend): `Ctrl+T`, `cd ../backend/`, buffers Alt+1..
   * `<leader>1/2` → trocar tabs
3. **Sessões**

   ```text
   <leader>ss → salva estado completo
   <leader>sr → restaura ao abrir o Neovim
   ```

---

### 🎯 Shortcuts: Cheat Sheet

| Tecla         | Ação                          |
| ------------- | ----------------------------- |
| H / L         | Buffer anterior / próximo     |
| Alt+1..9      | Ir ao buffer N                |
| <leader>p     | Buffer picker visual          |
| <leader>x/X   | Fechar buffer (forçado)       |
| <leader>bo    | Fechar outros buffers         |
| <C-q>         | Fechar inteligente (confirma) |
| <leader>ss/sr | Salvar / Restaurar sessão     |
| <C-t>         | Nova tab                      |
| gt / gT       | Próxima / anterior tab        |
| <leader>1..5  | Ir à tab N                    |

---

### 🎓 Boas Práticas & Troubleshooting

* **Organize por contexto**: cada tab = um projeto ou sub-projeto.
* **Limpeza**: use `<leader>bo` para fechar buffers órfãos.
* **Sessões pontuais**: `<leader>ss` antes de mudanças grandes ou fim de expediente.
* **Problemas?**

  * Bufferline não aparece → mude `event` para `BufReadPost`.
  * Ícones quebrando → instale uma Nerd Font.
  * Sessões não salvam → crie manualmente `~/.local/state/nvim/sessions`.

### 📋 Checklist do Dia 3: Buffers e Sessões

- [ ]  Instalar e configurar bufferline.nvim (checar ícones, numbers = "ordinal")
- [ ] Testar navegação: H/L e Alt+1..9 alternando buffers
- [ ] Instalar persistence.nvim e salvar sessão com leader + ss
- [ ] Restaurar sessão com leader + sr e leader + sl (última sessão)
- [ ] Instalar scope.nvim para isolar buffers por tab
- [ ] Testar guia de tabs: Ctrl+T (nova), gt/gT (next/prev), leader+1..5
- [ ] Fechar buffers com leader + x e ver janela de confirmação (Crtl+q)

## Dia 4: Inteligência de Código (LSP e Completions)

Agora sua IDE começa a ficar *assustadoramente* poderosa. Com o suporte a [[NVIM-LSP|LSP (Language Server Protocol)]], o Neovim vira praticamente um clone das IDEs pesadas, mas **do seu jeito**.

Entenda: em vez de um editor fazendo mágica e esconder tudo, **você vai configurar cada peça**. Instale o plugin **Mason** (gerenciador de servidores LSP) e o **mason-lspconfig**. Por exemplo, defina no seu Lua quais servidores quer: `lua_ls` para Lua, `pyright` para Python, `ts_ls` para TypeScript, etc. O Mason baixa esses servidores. Depois, no `lspconfig`, você os ativa manualmente:

```lua
local lspconfig = require("lspconfig")
lspconfig.ts_ls.setup({ 
  on_attach = function(_, bufnr)
    -- Aqui você escolhe atalhos, por exemplo:
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=bufnr}) 
    vim.keymap.set("n", "K",  vim.lsp.buf.hover,      {buffer=bufnr})
  end,
})
```

Ponto principal: **você sabe exatamente o que está acontecendo atrás das cortinas**. Não é mais clicar em “Intellisense” no VSCode e nunca saber como instala. Além disso, ajuste os diagnósticos ao seu gosto. Quer bolinhas vermelhas discretas ao lado do código? Quer flutuante com borda arredondada exibindo mensagem? É só configurar:

```lua
vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  float = { border = "rounded", source = "always" },
})
```

De quebra, mostre seu estilo: caso queira ainda mais autocompletar, pode instalar o **nvim-cmp** e fontes de completions (cada linguagem, cada snippet). Mas o essencial é: agora seu editor **entende** o que você codifica, destacando erros em tempo real e sugerindo definições/contexto com `gd`, `K`, etc. Aí sim, é “IDE, mas de verdade”, e ainda assim leve. 😎

**💡 Pontos-chave do [[NVIM-LSP|LSP (Language Server Protocol)]]:**

* **Arquitetura real:** Neovim <-> (JSON-RPC) <-> Servidor de Linguagem – você instala e vê cada peça.
* **Personalização total:** configure `capabilities`, mapeie `gd`, `gr`, `K`, o que quiser.
* **Diagnósticos customizáveis:** você decide onde e como os erros aparecem (linha de erro, texto flutuante, símbolo no gutter, etc.).

**📋 Checklist do Dia 4:**

* [ ] Instalar e configurar um [[NVIM-LSP|LSP (Language Server Protocol)]] com Mason (por exemplo, `lua_ls`, `pyright`, `ts_ls`)
* [ ] Definir atalhos de teclado para ações do LSP (`gd` = goto definição, `K` = hover, etc.)
* [ ] Personalizar a exibição de diagnósticos (cores, prefixos, janelas flutuantes)

## Dia 5: Função & Estética Avançada

O editor já está **monstro**, mas ainda falta um pouco de charme visual. Hora de cuidar dos olhos: [[NVIM-COLORSCHEME|Color-Schemes]] e efeitos. Esqueça aqueles temas velhos do Vim que vem por padrão – dá pra ter um ambiente bonito e ergonomicamente adequado.

Pense no seu setup físico: se você programa em ambiente claro ou escuro? As cores do editor devem refletir isso pra não afetar sua visão. Em geral, a comunidade tech prefere temas escuros consistentes. E nem tente usar o “Latte” do Catppuccin – porque tema claro em uma IDE é como usar óculos invertido! 😜 Brincadeiras à parte, os flavors escuros do Catppuccin (como **Mocha**) são imbatíveis. Escolha um, instale via plugin (ex.: `catppuccin/nvim`) e ative. Seus códigos com [[NVIM-TREESITTER|Treesitter]] vão brilhar em tons equilibrados, e essa paleta única presente no terminal, navegador e chat reduz o esforço cognitivo (você não precisa reaprender cores em cada lugar).

Outras coisinhas: o plugin `nvim-web-devicons` (que você já deve ter instalado) deixa o Neovim com ícones de arquivo no estilo modernoso. Em seguida é boa prática configurar uma barra de status como o [[NVIM-LUALINE|Lua-Line]] (com logo, branch do Git, etc), pois isso vai dar aquele ar profissional onde provem convenção + funcionalidade que sua IDE precisa para ser “superestimada” igual a maioria das IDEs populares porque ela vai **parecer fora da caixa** (lembre-se: *“Dirigir uma Ferrari com pneus de bicicleta não rola.”* Escolha o novo padrão ouro dos temas de sua IDE para **Catppuccin Mocha** e mantenha tudo consistente).

**✏️ Dicas de personalização:**

* Teste um colorscheme por pelo menos alguns dias – só julgar por uma screenshot é furada.
* Consistência acima de tudo: não troque de tema toda semana, seu cérebro precisa memorizar os padrões de cor.
* Use o mesmo tema em todos os lugares (code, terminal, navegador) para sua UX ficar coesa.
* Lembre-se que **Catppuccin Mocha** já é bem calibrado; evite alterar demais o esquema inicial.

**📋 Checklist do Dia 5:**

* [ ] Escolher e aplicar um [[NVIM-COLORSCHEME|Color-Schemes]] moderno (por exemplo, Catppuccin Mocha)
* [ ] Confirmar que o tema funciona bem com ícones (`nvim-web-devicons`) e barra de status (`lualine` ou similar)
* [ ] Avaliar o conforto visual: programar por algumas horas com o novo tema

# Dia 5: Experiência Visual Premium (ccc.nvim, hlchunk.nvim)

Todo mundo adora código bem colorido, e o Neovim não fica atrás de IDEs modernas: com [[NVIM-COLORPICKER|ccc.nvim]] temos uma paleta interativa dentro do editor. Este plugin traz um **Color Picker** acoplado ao Neovim: você escolhe cores em diversos formatos (RGB, HSL, CMYK etc.) usando sliders dinâmicos e ele **destaca** imediatamente as cores no seu buffer. Em outras palavras, é como ter um pincel mágico à la Painel de Cores do Photoshop, mas sem sair do terminal. Além disso, o `ccc.nvim` suporta mais de 10 espaços de cor, troca dinâmica entre entrada/saída e até realça as cores embutidas em funções CSS. Tudo isso sem dependências externas – só puro Neovim 0.9+.

### [[NVIM-COLORPICKER|ccc.nvim]]

* **Por que usar:** ter uma interface visual de seleção de cores evita ficar copypastando códigos hex a esmo. Você vê a cor na hora e ajusta até ela ficar “na medida” – o que acelera definir temas ou destacar trechos de código colorido. É muito mais intuitivo que softwares genéricos de IDE, e mostra que o Neovim não é nenhuma casca vazia quando o assunto é UX.
* **Configuração mínima:** instale o plugin e chame o setup básico. Por exemplo, usando Lazy.nvim:

  ```lua
  { "uga-rosa/ccc.nvim", cmd = { "CccPick", "CccHighlighterToggle" }, config = function()
      require("ccc").setup()
    end },
  ```

  (Aqui nós carregamos `ccc.nvim` só quando os comandos forem usados.)
* **Exemplo de uso / atalho:** use `:CccPick` para abrir o seletor de cores interativo. Digite um código RGB ou escolha deslizando até achar a cor, e o Neovim insere o valor no código. Com `:CccHighlighterToggle` você liga/desliga o destaque de todas as cores no buffer. Em resumo: pressione (por exemplo) `<leader>cp` para `:CccPick` e veja a mágica – tudo isso sem deixar seu fluxo de edição.
* **Checklist:** tenha certeza de que o plugin está instalado e carregado (veja logs do gerenciador de plugins), chame `require("ccc").setup()` no seu config, e teste usando `:CccPick`. Confira se ao mover os sliders a cor muda no seu código e se o destaque (`Highlighter`) aparece quando ativado.

### [[NVIM-HLCHUNK|hlchunk.nvim]]

Para complementar o visual, o [[NVIM-HLCHUNK|hl-chunk]] é como um holofote inteligente no seu código. Ele **destaca as linhas de indentação e o bloco (chunk) atual onde o cursor está**. Pense nele como um verdadeiro GPS de contexto de código: você vê claramente qual função, loop ou condicional está ativo no momento. Isso é ótimo para não perder o fio da meada em arquivos grandes, uma vantagem que editores IDE prometem mas normalmente só entregam com plugins (nesse caso, gratuito e flexível).

* **Por que usar:** o destaque de indentação mostra instantaneamente a profundidade do seu cursor, ajudando a detectar blocos de código grandes (ex: muitos `end` seguidos) e melhorando a legibilidade. É como usar faróis automáticos na estrada: sua visão segue o caminho (indent) e o “chunk” atual ganha foco enquanto todo o resto fica sutilmente marcado. Em vez de perder tempo contando espaços, o `hlchunk.nvim` faz o trabalho visual pesado por você.
* **Configuração mínima:** instale com Lazy.nvim e chame o setup simples. Exemplo de snippet:

  ```lua
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({})
    end
  },
  ```

  Isso ativa os módulos básicos (indent e chunk) assim que você abrir um buffer.
* **Exemplo de uso / atalho:** não há comandos complexos – basta abrir um arquivo. O plugin vai **destacar automaticamente** a indentação vertical e o contorno do bloco atual. Basta mover o cursor e observar o triângulo de indent aparecendo à esquerda (ou barras verticais) e o bloco atual realçado. Se quiser desativar algo, ajuste as opções em `require("hlchunk").setup{ enable = false }` para o módulo respectivo, mas o padrão já costuma agradar.
* **Checklist:** confirme que o plugin baixou (`:PackerSync` ou similar) e que não há erros de carregamento. Verifique no Neovim: ao abrir um arquivo com indentação (por exemplo, uma função Lua), você deve ver linhas verticais alinhadas e/ou o bloco atual realçado. Se não aparecer, revise o `require("hlchunk").setup({})` no seu config. Certifique-se de não excluir indevidamente o módulo via `exclude_filetypes` se quiser ver funcionamento em todos os arquivos.

# Dia 6: Terminal Integrado e Workflow com Git (toggleterm.nvim + LazyGit)

Sabe aquela ideia de “todo IDE moderno tem terminal embutido”? O Neovim dá conta do recado com o [[NVIM-TERMINAL|ToggleTerminal]]. Este plugin permite criar terminais que abrem, fecham e persistem em qualquer orientação (vertical, horizontal ou flutuante), tudo via atalho. Imagine abrir um terminal instantâneo para compilar ou rodar testes sem sair do editor – e com a mesma facilidade de alternar entre buffers. O toggleterm guarda até o histórico de todos terminais abertos, ou seja, você pode ter vários consoles (um para servidor, outro para depurar, outro para tarefas ad-hoc) e alternar de volta usando a combinação de teclas. É UX de IDE robusta sem abandonar o Neovim.

### [[NVIM-TERMINAL|ToggleTerminal]]

* **Por que usar:** ao invés de alt+Tab frenético entre Neovim e uma janela de terminal externa, o toggleterm traz o shell **para dentro do editor**. Você pode suspender processos, reabrir depois e até dividir o terminal em painéis (float, horizontal, vertical). Essa flexibilidade é tão matadora quanto um painel lateral de terminal fixo de IDE – mas no seu editor favor, ganhando um ping a mais em performance e personalização. Em suma: ele humaniza o uso do terminal embutido do Neovim, tornando-o “sem costura”.
* **Configuração mínima:** instale e inicie com o setup básico. Por exemplo, com Packer ou Lazy:

  ```lua
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  ```

  Ou usando Lua diretamente:

  ```lua
  require("toggleterm").setup{}
  ```

  Isso ativa as configurações padrão (terminal flutuante em `Ctrl-\\`, etc.).
* **Exemplo de uso / atalho:** por padrão `<C-\>` (Control + **\\**) abre e fecha o terminal ativo. Teste: pressione `<C-\>` no modo normal e você verá um terminal abrindo. Digite comandos como em um terminal normal e para sair volte para o Neovim com `Ctrl-W` (por exemplo). Você pode abrir quantos terminais quiser, cada um numerado. Na prática, uma sequência de `<C--\>, cd projeto; ls;` é tão instantânea quanto em IDEs, mas mais ágil.
* **Checklist:** confirme que o plugin está instalado sem erros e que `require("toggleterm").setup()` é executado. Abra um arquivo (qualquer) e pressione `<C-\>` – deve surgir um terminal. Execute `:checkhealth toggleterm` se surgir problema. Verifique também se ao fechar (`exit` no shell) e reabrir o mesmo atalho, o terminal anterior retorna (persistência).

### LazyGit no Neovim

Ter o terminal integrado já é meio caminho andado para um bom fluxo Git. O **LazyGit** é um cliente Git em terminal (com interface ncurses) que facilita a vida – e podemos integrá-lo ao toggleterm para rodar sem sair do Neovim. Em vez de menus complicados de GUI, você ganha uma visão “power user” dos branches, commits e diffs.

* **Por que usar:** ferramentas como GitKraken ou o visualizador do VSCode são chamativas, mas nada supera o LazyGit em agilidade e retrocompatibilidade (roda direto no terminal). Com ele no Neovim você adiciona potência visual sem perder ninguém, e fica até menos “preso” do que usar plugins Git do próprio editor. É a aproximação perfeita entre poder bruto do CLI e conveniência de não mudar de janela.
* **Configuração mínima:** além de instalar o comando `lazygit` no seu sistema, podemos defini-lo dentro do toggleterm. Por exemplo:

  ```lua
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
  function _LAZYGIT_TOGGLE()
    lazygit:toggle()
  end
  vim.keymap.set("n", "<leader>g", ":lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
  ```

  (Aqui usamos o built-in `Terminal` do toggleterm para criar um terminal que executa `lazygit`.)
* **Exemplo de uso / atalho:** depois disso, basta abrir um projeto Git no Neovim e pressionar `<leader>g`. Vai abrir o LazyGit dentro de um terminal flutuante – pronto para você commitar, fazer merge, rebase etc. Pressione `q` dentro do LazyGit ou use o mesmo `<leader>g` para fechar o painel. É muito mais rápido do que trocar de app, e te mantém “dentro do Neovim” mentalmente.
* **Checklist:** certifique-se de que `lazygit` está instalado no seu PATH (ex.: `lazygit --version`). Veja se o atalho `<leader>g` realmente abre uma janela do LazyGit (peça para criar um arquivo novo e fazer alguns commits de teste). Caso não abra, reveja se o `cmd = "lazygit"` está correto ou se precisa especificar outro diretório (use `dir = "git_dir"` em projetos multi-worktree).

# Dia 7: Mensagens e UX (noice.nvim)

No **Day 9** a ideia é turbinar as mensagens e prompts do Neovim. O plugin [[NVIM-NOICE|Noice.nvim]] (do folke) é um verdadeiro “chef de cozinha” do UX: ele **substitui por completo a UI das mensagens, do cmdline e dos menus pop-up**. Em vez daqueles diálogos chatos de “Press any key” ou `:messages` monótonos, ele traz notificações customizáveis, caixas flutuantes estilosas e histórico de mensagens no buffer. Imagine o visual do VSCode/JetBrains no seu terminal – sem a meleca de usar Electron! Com [[NVIM-NOICE|Noice.nvim]], comandos como buscas, completions e até `:messages` ficam com um visual consistente (e você ainda aproveita os highlights de erro/aviso originais).

* **Por que usar:** Neovim puro é poderosa linha de comando, mas as mensagens e prompts ficam feios. O `noice.nvim` corrige isso dramáticamente. Ele transforma avisos do LSP, pop-ups de conclusão de texto (cmdline) e diálogos em layouts agradáveis, reduzindo cenas ásperas de “pressione ENTER para continuar”. É como tirar um óculos sujo: de repente tudo fica legível e bem desenhado, o que é sutil mas cansa muito menos a vista no longo prazo. E, em contraste com IDEs superestimadas, você controla cada detalhe visual – sem exageros de memória, mas com melhorias visuais “ninja”.
* **Configuração mínima:** instale `folke/noice.nvim` **e** também o `MunifTanjim/nui.nvim` (requisito do plugin). Depois, coloque:

  ```lua
  require("noice").setup({
    -- exemplos de preset básicos, personalizáveis
    lsp = { override = { ["vim.lsp.util.convert_input_to_markdown_lines"] = true } },
    presets = { bottom_search = true, command_palette = true }
  })
  ```

  Ou simplesmente:

  ```lua
  require("noice").setup()
  ```

  Isso carrega as configurações padrão (use o wiki para receitas avançadas). Noice já vem com layouts por padrão. Não esqueça: no mínimo, chame `require("noice").setup()` no seu config.
* **Exemplo de uso / atalho:** tudo acontece nos bastidores. Por exemplo, agora `:messages` abre um buffer normal cheio do histórico bonito de notificações – você nem vai querer voltar ao `:messages` padrão antigo. Além disso, o comando `:Noice` (disponível após instalar) mostra o log completo das mensagens que o editor gerou. Na prática, teste escrevendo algo no buffer que gere aviso do LSP (tipo erro de sintaxe) e veja como o popup fica “clean”. Pesquise ( `/texto` ) e repare que a barra de busca fica no rodapé (preset `bottom_search = true`). As mudanças são transparentes, mas as telas ganham ícones e efeitos – muito mais elegância que o alerta de diálogo grosseiro de VSCode.
* **Checklist:** confirme que os plugins `noice.nvim` e `nui.nvim` foram instalados. Verifique no Neovim: digite um comando `:messages` ou gere uma mensagem (ex: chamar um comando inválido) e veja se o estilo mudou. Tente `:Noice` – você deve ver algo bem formatado (ao invés do box antigo do Neovim). Se nada mudou, reveja se `require("noice").setup()` foi chamado sem erros. Consulte `:checkhealth noice` para dicas.

# Dia 8: Qualidade de Código (null-ls, formatadores, linters)

Chegamos à **Qualidade de Código**. Para ter “IDE vibes” sem sair do Neovim, usamos o [[NVIM-NONELS|None-ls.nvim]]. Esse plugin permite usar qualquer formatador ou linter externo como se fosse um servidor LSP interno. Em outras palavras, em vez de ficar se perguntando como o VSCode formata *automaticamente* seu Python ou JS, você conecta ferramentas consagradas (prettier, black, eslint, shellcheck etc.) diretamente ao buffer. O [[NVIM-NONELS|None-ls.nvim]] é a ponte que falta no Neovim: ele faz o diagnostic e formatar parecerem nativos do LSP, mas rodando programas à parte.

* **Por que usar:** IDEs comerciais ocultam onde e como chamam linters/formatters. No Neovim, ser explícito te dá transparência e controle. Com o [[NVIM-NONELS|None-ls.nvim]], ao invés de instalar um novo servidor LSP para cada linguagem (o que muitas vezes não existe), você registra ferramentas via Lua. Por exemplo, pode dizer “use o `stylua` para Lua, `black` para Python e `prettier` para JS” e eles aparecem como diagnósticos e formatações automáticas no Neovim. Isso significa lint/format *on the fly* sem deixar sua experiência sair do terminal – e com performance leve, porque [[NVIM-NONELS|None-ls.nvim]] roda só ao salvar ou sob demanda.

* **Configuração mínima:** instale o plugin e configure algumas fontes. Exemplo comum:

  ```lua
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,       -- formata Lua
      null_ls.builtins.formatting.prettier,     -- formata JS/TS/JSON/etc
      null_ls.builtins.formatting.black,        -- formata Python
      null_ls.builtins.diagnostics.shellcheck,  -- lint Shell
      null_ls.builtins.diagnostics.eslint,      -- lint JS/TS
    },
  })
  ```

  (Veja documentação oficial para mais builtins.) O exemplo acima segue o padrão: chamamos `null_ls.setup({ sources = {...} })`.

* **Exemplo de uso / atalho:** instale também os programas externos (ex.: `black`, `stylua`, `shellcheck`, etc. no seu sistema). Depois, no Neovim, cada vez que você salvar ou chamar format (por exemplo `vim.lsp.buf.format()`), esses formatadores serão acionados. Teste: abra um arquivo com código desalinhado (como Python sem indentação) e salve; o formato deve se ajustar pelo `black` integrado. Confira também mensagens de erro ao digitar algo sintaticamente inválido (o `eslint`/`shellcheck` deve apontar). Assim, você tem auto-lint e auto-format iguais aos das IDEs modernas – mas onde você decide qual ferramenta usar.

* **Checklist:** verifique que o null-ls instalou sem erros. Cheque se os comandos externos existem (ex.: `stylua --version`, `black --version`). Em seguida, abra um arquivo de cada linguagem configurada e veja se há diagnósticos ou se salvar formata o arquivo. Use `:NullLsInfo` (se disponível) para debugar as fontes ativas. Se algo falhar, reveja a lista em `sources = { ... }` e certifique-se de que `null_ls.builtins.<coisa>` está correto.

# Dia 9: Parsing e Highlighting com Treesitter

No último dia, falamos de **Tree-sitter**, a tecnologia que dá ao Neovim sintaxe inteligente de verdade. O plugin [[NVIM-TREESITTER|treesitter.nvim]] oferece uma “camada” fácil de usar para esse parser: ele vai instalar gramáticas para várias linguagens e fornecer *highlighting* baseado na estrutura sintática. Isso significa reconhecimento semântico do código – uma indentação mais precisa e até possibilitar textobjects (como selecionar a função inteira em vez de linha por linha). Em vez de depender de regex do Vim antigo, o treesitter faz parse do código real, deixando erros de padrão para trás. É como comparar olhar para um mapa topográfico (treesitter) ao invés de um desenho rudimentar: você tem profundidade e contexto.

* **Por que usar:** além de destacar sintaxe, o treesitter permite recursos avançados como folding inteligente, indentação automática melhorada e text objects customizados. Por exemplo, como IDE você quer saber rapidamente onde termina seu `if` aninhado – o treesitter consegue evidenciar isso melhor. Ele também suporta múltiplas línguas ao mesmo tempo e fica preparado para atualizações (basta gerar o parser). Muitas IDEs pagas não o fazem tão transparente – o [[NVIM-TREESITTER|treesitter.nvim]] dá tudo isso gratuitamente e customizável. Segundo os desenvolvedores, o objetivo é “usar o tree-sitter no Neovim com funcionalidades básicas de destaque”, e de fato vemos um salto visual em relação ao highlight tradicional.

* **Configuração mínima:** instale `nvim-treesitter`. Depois, ative e escolha linguagens. Exemplo básico:

  ```lua
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "vim", "python", "javascript" },  -- parsers para instalar
    highlight = { enable = true },
    indent = { enable = true },
  }
  ```

  Isso fará com que, ao iniciar, o plugin baixe os parsers (via `:TSUpdate`) dessas linguagens. Na prática, você quer pelo menos colocar `"all"` ou uma lista das linguagens que usa mais. O trecho acima é inspirado na documentação oficial.


## **Dia 10: Parabéns, Sua IDE Está Pronta!** 🎉

Uau, que jornada! Você começou com um Neovim Cru e agora tem uma **IDE superestimada feita por você**, do jeitinho que só um verdadeiro(a) hacker(a) entenderia. Vamos recapitular todo o poder que você colocou no seu editor:

1. **Tela Inicial & Boas-vindas**

   * [[NVIM-ALPHA|Alpha Dashboard]] te dá um hub central com cinco botões essenciais (New File, Git, Find Files, Configs, Quit) para calibrar seu mindset antes de codar.

2. **Gerenciamento de Plugins**

   * lazy.nvim mantém seus plugins organizados em módulos, carregando cada configuração de forma eficiente e minimalista.

3. **Busca & Navegação**

   * [[NVIM-TELESCOPE|TeleScope]]: localizador fuzzy ultra rápido para arquivos, buffers e texto.
   * [[NVIM-NEOTREE|Neo-Tree]]: explorador de árvore lateral com comandos intuitivos (`j/k`, `Space`, `Enter`, `t`, `w`) e sincronização automática.

1. **Inteligência de Código com [[NVIM-LSP|LSP (Language Server Protocol)]]**

   * Mason + lspconfig para instalar e configurar servidores (Lua, Python, TypeScript etc.).
   * Atalhos `gd`, `K`, diagnósticos customizáveis.

5. **Estilo & Ergonomia Visual**

   * [[NVIM-COLORSCHEME|Color-Schemes]]: Catppuccin Mocha (ou flavor escolhido) para consistência cross-app.
   * [[NVIM-COLORPICKER|ccc.nvim]] Color Picker para experiência visual premium.
   * [[NVIM-HLCHUNK|hl-chunk.nvim]] destacar blocks e indent para experiência visual premium.

6. **Terminal & Git**

   * [[NVIM-TERMINAL|ToggleTerminal]] para abrir terminais flutuantes ou splits com `<C-\>`.
   * **LazyGit** integrado via toggleterm `<leader>g` para fluxo Git ágil.

7. **Mensagens & UX**

   * [[NVIM-NOICE|Noice.nvim]] para substituir cmdline, mensagens e pop-ups do LSP por layouts mais limpos e harmoniosos.

8. **Qualidade de Código**

   * [[NVIM-NONELS|none-ls.nvim]] conecta formatadores (`prettier`, `black`, `stylua`) e linters (`eslint`, `shellcheck`) como se fossem LSP nativos.
   * Mapeie `<leader>F` para formatar sob demanda.

9. **Parsing & Highlighting Inteligente**

   * [[NVIM-TREESITTER|Treesitter]] com `highlight` e `indent` habilitados, garantindo sintaxe semântica e indentação automática.

---

### Por que isso é tão bom?

* **Controle Total:** cada plugin, cor, atalho e comportamento foi escolhido e configurado por você — nunca mais “abrir extensão” nem menus confusos.
* **Performance Leve:** Neovim + Lua + parsers nativos economizam RAM e CPU, diferentemente de IDEs Electron.
* **Consistência Visual e Cognitiva:** sua paleta de cores e seus layouts se estendem por todo o sistema (terminal, browser, chat), reduzindo *cognitive load*.
* **Fluxo Sem Fricção:** você nunca sai mentalmente do editor — terminal, Git, mensagens, tudo acontece ali.
* **Aprendizado Profundo:** você entendeu como cada camada funciona, desde o protocolo LSP até o parse do Treesitter. Isso não é modinha: é **empoderamento técnico**.

---

### **📋 Checklist Final (Vitória Suprema)**

- [ ] Alpha Dashboard configurado e abrindo na inicialização
- [ ] lazy.nvim organizado em lua/plugins
- [ ] Buffers e Sessões: bufferline, persistence e scope funcionando
- [ ] Telescope e Neo-tree navegando com fluidez
- [ ] LSP ativo com diagnósticos e autocompletar
- [ ] Catppuccin Mocha (ou seu tema) aplicado e consistente
- [ ] ccc.nvim & hlchunk.nvim ativos para experiência visual premium
- [ ] toggleterm.nvim + LazyGit integrados e operacionais
- [ ] noice.nvim apresentando mensagens e cmdline polidos
- [ ] null-ls formatando e lintando conforme esperado
- [ ] nvim-treesitter destacando e indentando de forma inteligente
- [ ] Confiança plena para personalizar qualquer aspecto
- [ ] Pronto para exibir sua “IDE superestimada” e inspirar colegas

**Parabéns, desenvolvedor(a)!** Você não apenas montou um ambiente poderoso, mas **aprendeu o porquê** de cada peça existir. Se alguém ainda acha que “Vim é só modinha”, envie este Atlas e diga:

> “Olha o que eu construí — sem Electron, sem menus escondidos, só teclas e propósito.”

Aproveite seu Neovim turbinado, e lembre-se: **você criou uma IDE feita sob medida**, que evoluirá junto com seu fluxo de trabalho. Bom código! 🚀


# Todo-comments: Guia de Referência Rápida

## A Realidade do Todo-comments.nvim

Vamos começar com a verdade inconveniente: você provavelmente já deixa comentários TODO espalhados pelo código e nunca mais olha para eles. O todo-comments.nvim é basicamente um plugin que te força a encarar essa bagunça organizacional dando cores bonitas para seus lembretes esquecidos. É útil? Sim. Vai resolver sua procrastinação? Definitivamente não.

## O Que Este Plugin Realmente Faz

O todo-comments pega seus comentários de código e os transforma em um sistema de destacamento colorido. Ele reconhece palavras-chave específicas nos comentários e aplica cores diferentes para cada tipo. É como ter um sistema de post-its digitais, só que integrado ao seu editor. A diferença é que agora você não pode mais ignorar aquele TODO que está ali há três meses.

### Dependencies - Só Uma, Graças a Deus

Diferente de outros plugins que exigem meia internet para funcionar, este só precisa do `plenary.nvim`. É uma biblioteca de utilitários que meio mundo do Neovim já usa anyway, então provavelmente você já tem instalada.

## Sistema de Keywords - Sua Taxonomia de Procrastinação

### FIX - Os Problemas que Você Sabe que Existem
Configurado com ícone de bug e cor vermelha (error). Reconhece também FIXME, BUG, FIXIT e ISSUE. Basicamente, tudo que está quebrado e você está adiando o conserto. A cor vermelha é apropriada porque deveria te causar ansiedade mesmo.

### TODO - A Procrastinação Clássica
O clássico. Ícone de papel e cor azul (info). Simples, direto, e provavelmente 80% dos seus comentários vão ser desse tipo. É a palavra mais honesta do vocabulário de desenvolvimento: "eu sei o que deveria fazer, mas não agora".

### HACK - As Gambiarra Conscientes
Ícone de raio com cor amarela (warning). Para aqueles momentos em que você sabe que está fazendo algo questionável, mas funciona e você não tem tempo para fazer direito. Pelo menos você está sendo honesto sobre a gambiarra.

### WARN - Os Avisos que Ninguém Lê
Ícone de warning tradicional. Inclui também WARNING e XXX como alternativas. Para quando você quer avisar o próximo desenvolvedor (que pode ser você daqui a seis meses) sobre alguma peculiaridade do código.

### PERF - Performance que Nunca Vai Ser Otimizada
Ícone de foguete para suas fantasias de otimização. Inclui OPTIM, PERFORMANCE e OPTIMIZE como alternativas. Porque todo mundo planeja otimizar depois, mas "depois" tem um jeito estranho de nunca chegar.

### NOTE - Observações que Parecem Importantes
Ícone de lâmpada com cor verde (hint). Também aceita INFO. Para aqueles comentários que explicam o "porquê" em vez do "o quê". Teoricamente são os mais úteis, mas na prática ficam obsoletos mais rápido que leite fora da geladeira.

### TEST - O Testing que Existe Só no Comentário
Ícone de tubo de ensaio com cor rosa (test). Aceita TESTING, PASSED e FAILED. Para quando você escreve sobre testes que deveria fazer, mas que provavelmente nunca vai escrever de verdade.

## Configuração Visual - Porque Aparência Importa

O plugin está configurado para destacar o fundo das keywords em negrito (`bg = "BOLD"`) enquanto mantém o texto normal (`fg = "NONE"`). É sutil o suficiente para não distrair, mas óbvio o suficiente para você não conseguir ignorar.

## Sistema de Highlighting - Como as Cores Funcionam

### Multiline Support
O highlighting funciona através de múltiplas linhas com até 10 linhas de contexto. Isso significa que você pode escrever comentários TODO longos e dramáticos que o plugin vai destacar tudo corretamente.

### Pattern Matching
Usa a regex `.*<(KEYWORDS)\s*:]` para encontrar as keywords. Funciona apenas em comentários (`comments_only = true`), então você não vai ter falsos positivos no meio do seu código normal.

### Cores do Tema Catppuccin
As cores estão mapeadas para o tema Catppuccin, que é bonito e popular. Error usa o vermelho catppuccin (`#f38ba8`), warning usa o pêssego (`#fab387`), e assim por diante. Se você usa outro tema, as cores vão fallback para os grupos de diagnostic padrão do Neovim.

## Search Integration - Encontrando Sua Dívida Técnica

O plugin usa `ripgrep` (rg) para buscar através do projeto inteiro. Os argumentos estão configurados para saída limpa sem cores ou cabeçalhos, mas com informações de arquivo e linha. É rápido e eficiente, assumindo que você tem o ripgrep instalado (e deveria ter).

## Keymaps - Navegação Entre Suas Pendências

### Navegação Sequencial
`]t` pula para o próximo comentário TODO no arquivo atual. `[t` volta para o anterior. É o jeito mais rápido de fazer uma auditoria de tudo que você está adiando no arquivo atual.

### Telescope Integration
`<leader>ft` abre todos os comentários TODO no Telescope para busca rápida. `<leader>fT` filtra apenas TODO, FIX e FIXME - presumivelmente os mais críticos. Útil para ter uma visão geral da bagunça em todo o projeto.

## Signs - Indicadores na Lateral

O plugin coloca pequenos indicadores na coluna de signs (lateral esquerda do editor) com prioridade 8. Não é muito intrusivo, mas te dá uma indicação visual rápida de onde estão seus comentários importantes sem precisar ler linha por linha.

## Sobre Produtividade

Aqui está a realidade: este plugin não vai te tornar mais produtivo. Ele só vai tornar mais difícil ignorar o trabalho que você está evitando. É como contratar alguém para ficar te lembrando das suas responsabilidades pendentes. Útil? Talvez. Confortável? Definitivamente não.

## Performance e Overhead

O plugin é relativamente leve. Ele só processa comentários e usa highlighting padrão do Neovim. O ripgrep para busca é rápido. O overhead principal vem dos signs e do highlighting em tempo real, mas nada que vá impactar significativamente a performance mesmo em arquivos grandes.

## Versão Melhorada do Código com Ícones Mais Semânticos

Aqui está uma versão mais funcional da sua configuração, trocando os emojis por símbolos Unicode mais semânticos e responsivos:

```lua
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile" },
  
  config = function()
    require("todo-comments").setup({
      signs = true,
      sign_priority = 8,
      
      keywords = {
        FIX = {
          icon = "×", -- Símbolo de erro/falha
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { 
          icon = "○", -- Círculo vazio indica pendência
          color = "info" 
        },
        HACK = { 
          icon = "!", -- Exclamação para gambiarra
          color = "warning" 
        },
        WARN = { 
          icon = "▲", -- Triângulo de warning padrão
          color = "warning", 
          alt = { "WARNING", "XXX" } 
        },
        PERF = { 
          icon = "↑", -- Seta para cima indica otimização
          alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } 
        },
        NOTE = { 
          icon = "※", -- Símbolo de referência/nota
          color = "hint", 
          alt = { "INFO" } 
        },
        TEST = { 
          icon = "✓", -- Checkmark para testes
          color = "test", 
          alt = { "TESTING", "PASSED", "FAILED" } 
        },
      },
      
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
      
      colors = {
        error = { "#f38ba8", "DiagnosticError" },
        warning = { "#fab387", "DiagnosticWarn" },  
        info = { "#89b4fa", "DiagnosticInfo" },
        hint = { "#a6e3a1", "DiagnosticHint" },
        default = { "#cba6f7", "Identifier" },
        test = { "#f5c2e7", "Identifier" }
      },
      
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], 
      },
    })
    
    -- Keymaps essenciais
    local map = vim.keymap.set
    
    map("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })
    
    map("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })
    
    map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    map("n", "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Find todos/fix/fixme" })
  end,
}
```

## Quando Usar (Ou Não Usar)

**Use se:**
- Você escreve muitos comentários TODO e quer organizá-los
- Trabalha em equipe e precisa comunicar pendências via código
- Gosta de ter visão geral das dívidas técnicas do projeto
- Quer ser forçado a encarar suas procrastinações

**Não use se:**
- Prefere um workflow minimalista sem distrações visuais
- Raramente escreve comentários no código
- Já tem um sistema externo de gerenciamento de tasks
- Acha que vai te deixar ansioso ver tudo que está pendente

## Conclusão Realista

O todo-comments.nvim é um daqueles plugins que faz exatamente o que promete sem drama. Não vai mudar sua vida, mas vai te ajudar a manter track das coisas que você está adiando. É bem implementado, rápido, e não tenta ser mais esperto que deveria ser.

Se você já tem o hábito de escrever comentários TODO, este plugin vai tornar o processo mais organizado e visível. Se você não tem esse hábito, o plugin não vai magicamente te dar disciplina. É uma ferramenta, não uma solução para falta de organização pessoal.

A versão melhorada com símbolos Unicode mais semânticos mantém toda a funcionalidade enquanto fica mais legível em diferentes fontes e tamanhos de terminal. Os emojis podem ser bonitos, mas símbolos simples são mais universalmente compatíveis e profissionalmente apropriados.
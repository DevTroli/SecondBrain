# Config do Telescope - Referência Rápida

## O que é o Telescope e Por Que Usá-lo

O Telescope é um plugin fundamental para Neovim que funciona como um "localizador fuzzy" extremamente poderoso. Pense nele como uma ferramenta de busca inteligente que permite encontrar arquivos, texto dentro de arquivos, buffers abertos, e muito mais, tudo através de uma interface unificada e intuitiva. Ele substitui a necessidade de navegar manualmente por diretórios ou lembrar nomes exatos de arquivos.

## Estrutura Básica da Configuração

Sua configuração atual segue o padrão moderno do Neovim com Lua, organizando o Telescope como um plugin gerenciado pelo sistema de plugins (provavelmente lazy.nvim). Vamos entender cada parte:

### 1. Definição do Plugin e Dependências

```lua
{
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",  -- Usa a versão estável
    dependencies = {
        "nvim-lua/plenary.nvim",  -- Biblioteca de utilitários essencial
        {
            "nvim-telescope/telescope-fzf-native.nvim",  -- Melhora performance
            build = "make",  -- Compila código nativo
        },
        "nvim-tree/nvim-web-devicons",  -- Ícones para tipos de arquivo
    },
```

O `plenary.nvim` é uma dependência obrigatória que fornece funções utilitárias. O `telescope-fzf-native` é crucial para performance, especialmente em projetos grandes, pois usa algoritmos de busca compilados em C. Os ícones melhoram a experiência visual.

### 2. Configurações Principais (defaults)

```lua
defaults = {
    prompt_prefix = " ",      -- Ícone no prompt de busca
    selection_caret = " ",   -- Indicador do item selecionado
    path_display = { "smart" },  -- Mostra caminhos de forma inteligente
    layout_strategy = "horizontal",  -- Layout padrão
    layout_config = {
        prompt_position = "top",  -- Busca no topo (mais natural)
        width = 0.50,            -- 50% da largura da tela
        height = 0.50,           -- 50% da altura da tela
    },
    sorting_strategy = "ascending",  -- Resultados do topo para baixo
```

A configuração `path_display = { "smart" }` é especialmente útil porque mostra apenas as partes relevantes dos caminhos de arquivo, evitando caminhos longos desnecessários. O `sorting_strategy = "ascending"` trabalha em conjunto com `prompt_position = "top"` para criar um fluxo visual natural.

### 3. Extensões e Performance

```lua
extensions = {
    fzf = {
        fuzzy = true,                    -- Habilita busca fuzzy
        override_generic_sorter = true,  -- Substitui ordenador padrão
        override_file_sorter = true,     -- Substitui ordenador de arquivos
        case_mode = "smart_case",        -- Case-sensitive inteligente
    },
},
```

Esta seção configura a extensão FZF nativa, que dramatically melhora a performance da busca, especialmente importante em projetos com milhares de arquivos.

### 4. Mapeamentos de Teclado Estratégicos

Sua configuração define atalhos muito práticos:

- **Ctrl+F**: Busca arquivos sem preview (mais rápido, foco na navegação)
- **Ctrl+B**: Lista buffers sem preview (troca rápida entre arquivos abertos)  
- **Ctrl+G**: Busca texto com preview (útil para encontrar código específico)
- **Leader+H**: Busca na documentação do Neovim

## Implementação Passo a Passo

### Passo 1: Configuração Inicial do Plugin Manager
Se você está começando do zero, primeiro configure um gerenciador de plugins como o lazy.nvim no seu `init.lua`:

```lua
-- No seu init.lua
require("config.lazy")  -- Carrega configuração do lazy
```

### Passo 2: Arquivo de Configuração do Telescope
Crie o arquivo `lua/plugins/telescope.lua` com sua configuração atual. Este arquivo será automaticamente carregado pelo lazy.nvim.

### Passo 3: Testando a Instalação
Depois de reiniciar o Neovim, o lazy.nvim deve instalar automaticamente o Telescope e suas dependências. Teste com:
- `:checkhealth telescope` para verificar se tudo está funcionando
- Use `Ctrl+F` para testar a busca de arquivos

## Conceitos Importantes para Entender

**Fuzzy Finding**: O termo "fuzzy" significa que você não precisa digitar o nome exato do arquivo. Por exemplo, digitando "telesc" pode encontrar "telescope.lua". Isso torna a navegação muito mais rápida e intuitiva.

**Previewer**: O preview mostra o conteúdo do arquivo selecionado em tempo real. Sua configuração inteligentemente desabilita o preview para buscas de arquivos e buffers (onde você quer velocidade) mas mantém para busca de texto (onde ver o contexto é importante).

**Themes**: O `themes.get_dropdown()` cria uma interface compacta que aparece no centro da tela, ideal para seleções rápidas.

## Dicas de Uso Avançado

Uma vez que você se acostumar com os atalhos básicos, pode explorar outras funcionalidades poderosas do Telescope como busca em histórico de comandos (`:Telescope command_history`), busca em commits do Git (`:Telescope git_commits`), ou até mesmo busca em símbolos LSP (`:Telescope lsp_document_symbols`).

A beleza desta configuração está na sua simplicidade e eficiência - ela fornece as funcionalidades mais importantes sem sobrecarregar o sistema ou criar confusão com muitas opções.
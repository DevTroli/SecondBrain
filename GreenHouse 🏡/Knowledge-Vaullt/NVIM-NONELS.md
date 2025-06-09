# Config None-ls - Referência Rápida

O None-ls é uma ferramenta fundamental para transformar seu Neovim em um ambiente de desenvolvimento robusto, funcionando como uma ponte entre o protocolo LSP (Language Server Protocol) e ferramentas externas de formatação e diagnóstico que não implementam LSP nativamente.

## Entendendo o Conceito

Imagine o None-ls como um tradutor universal. Enquanto o Neovim "fala" LSP para se comunicar com servidores de linguagem, muitas ferramentas úteis como Prettier, Rubocop ou ESLint "falam" apenas suas próprias linguagens. O None-ls pega essas ferramentas e as faz parecer servidores LSP verdadeiros aos olhos do Neovim, permitindo integração perfeita.

## Estrutura Base da Configuração

Baseando-se na sua configuração atual, vamos quebrar cada componente para entender como funciona:

### 1. Declaração do Plugin

```lua
return {
	"nvimtools/none-ls.nvim",
	config = function()
		-- Configuração aqui
	end,
}
```

Esta estrutura segue o padrão do lazy.nvim (gerenciador de plugins moderno). O `config = function()` garante que a configuração só execute após o plugin ser carregado, evitando erros de dependência.

### 2. Inicialização e Configuração das Fontes

```lua
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- Suas ferramentas aqui
	},
})
```

O `null_ls` é o objeto principal que gerencia todas as integrações. As `sources` são onde você define quais ferramentas externas o None-ls deve "traduzir" para o protocolo LSP.

## Categorias de Ferramentas

Nessa configuração, você usa duas categorias principais:

**Formatação (formatting):**
- `stylua`: Formatador para código Lua
- `prettier`: Formatador universal para JavaScript, TypeScript, CSS, HTML, JSON
- `rubocop`: Formatador para Ruby

**Diagnósticos (diagnostics):**
- `erb_lint`: Analisador para templates ERB (Ruby)
- `rubocop`: Também funciona como linter para Ruby

Esta separação é importante porque cada categoria serve um propósito específico no fluxo de trabalho de desenvolvimento.

## Configuração do Mapeamento de Teclas

```lua
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})
```

Este mapeamento conecta a tecla `<leader>F` (no modo normal) à função de formatação do LSP. Quando pressionada, ela ativa todas as ferramentas de formatação configuradas no None-ls para o arquivo atual.

## Expandindo a Configuração

Para criar uma configuração mais robusta, considere estas extensões:

### Adicionando Condições
```lua
null_ls.builtins.formatting.prettier.with({
	condition = function(utils)
		return utils.root_has_file({ "package.json", ".prettierrc" })
	end,
})
```

### Configurações Específicas por Tipo de Arquivo
```lua
sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettier.with({
		filetypes = { "javascript", "typescript", "css", "html" },
	}),
}
```

## Instalação de Dependências

Lembre-se que o None-ls é apenas o intermediário. Você precisa instalar as ferramentas reais:

```bash
# Para Prettier
npm install -g prettier

# Para Stylua
cargo install stylua

# Para Rubocop
gem install rubocop
```

## Debugging e Solução de Problemas

Se algo não funcionar, use `:NullLsInfo` para verificar se as ferramentas estão sendo detectadas corretamente. Este comando mostra quais sources estão ativas para o buffer atual e se as dependências estão instaladas.

## Integração com LSP Nativo

O None-ls se integra perfeitamente com outros servidores LSP. Por exemplo, você pode ter o `ruby-lsp` para completions e o `rubocop` via None-ls para formatação, trabalhando em harmonia no mesmo projeto.

Esta configuração cria uma base sólida para um ambiente de desenvolvimento profissional, onde formatação e linting acontecem de forma transparente, mantendo seu código consistente e livre de erros básicos.
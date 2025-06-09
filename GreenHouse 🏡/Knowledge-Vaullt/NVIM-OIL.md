# Configs Oil.nvim: Referência Rápida

O Oil.nvim representa uma mudança de paradigma fundamental na forma como interagimos com sistemas de arquivos dentro do Neovim. Enquanto outros gerenciadores de arquivos tratam a estrutura de diretórios como algo para ser navegado, o Oil a trata como algo para ser editado - e essa diferença filosófica muda tudo.

## A Revolução Conceitual: Arquivos Como Texto Editável

Imagine se você pudesse editar a estrutura do seu sistema de arquivos da mesma forma que edita um arquivo de texto. O Oil torna isso realidade ao transformar diretórios em buffers editáveis. Quando você abre um diretório com Oil, não está apenas visualizando uma lista de arquivos - está editando uma representação textual da estrutura de diretórios que pode ser modificada usando todos os poderes do Vim.

Esta abordagem é revolucionária porque aproveita décadas de muscle memory e ferramentas de edição de texto que você já domina. Quer renomear cinco arquivos de uma vez? Use busca e substituição. Precisa mover arquivos para diferentes diretórios? Corte e cole. Quer duplicar uma estrutura de arquivos? Copie linhas e modifique conforme necessário.

## Por Que Oil Quando Você Tem Neotree e Telescope?

Esta é uma pergunta que muitos desenvolvedores fazem, e a resposta revela como diferentes ferramentas servem diferentes aspectos do fluxo de trabalho de desenvolvimento.

### Neotree: O Explorador Visual

O Neotree excel como um explorador visual persistente. É perfeito para navegar em projetos grandes, entender hierarquias complexas, e manter contexto visual da estrutura do projeto. Pense no Neotree como um mapa sempre visível do seu território de código.

### Telescope: O Buscador Fuzzy

O Telescope é seu companheiro para busca rápida e navegação baseada em padrões. Quando você sabe aproximadamente o que procura mas não sua localização exata, o Telescope é imbatível para encontrar arquivos, símbolos, ou qualquer outro elemento indexável.

### Oil: O Editor de Estruturas

O Oil preenche um nicho completamente diferente: a manipulação direta e eficiente da estrutura de arquivos. Ele não está competindo com Neotree ou Telescope - está complementando-os ao oferecer capacidades que nenhum dos dois possui.

## Anatomia da Sua Configuração Minimalista

```lua
return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup()
    vim.keymap.set("n", "-", oil.toggle_float, {})
  end,
}
```

Sua configuração é intencionalmente minimalista, mas cada elemento serve um propósito específico:

### O Poder do Setup Padrão

O `oil.setup()` sem parâmetros aproveita as configurações padrão cuidadosamente projetadas. Isso inclui mapeamentos de teclas intuitivos dentro do buffer do Oil, integração com ferramentas de sistema, e comportamentos sensatos para operações de arquivo.

### A Genialidade do Toggle Float

O mapeamento `vim.keymap.set("n", "-", oil.toggle_float, {})` merece análise especial. A escolha da tecla `-` é brilhante porque espelha o conceito de "voltar" ou "subir" na hierarquia de diretórios, enquanto o `toggle_float` cria uma janela flutuante que aparece sobre seu trabalho atual sem perturbar o layout da tela.

## Casos de Uso Onde Oil Brilha

### Reorganização Rápida de Projetos

Imagine que você precisa reorganizar a estrutura de um projeto Rails, movendo arquivos entre diferentes diretórios. Com Oil, você abre o diretório, vê toda a estrutura como texto, e pode usar comandos de edição familiar para reorganizar tudo:

```
# Antes (visualização no Oil):
controllers/
  users_controller.rb
  admin_controller.rb
models/
  user.rb
views/
  users/
```

Você pode simplesmente cortar e colar linhas, renomear usando substituição de texto, ou até mesmo usar macros do Vim para operações repetitivas complexas.

### Renomeação em Massa

Suponha que você precise renomear uma série de arquivos seguindo uma nova convenção. No Oil, isso se torna uma operação de busca e substituição:

1. Abra o diretório com `-`
2. Use `:%s/old_pattern/new_pattern/g`
3. Salve com `:w`

Todos os arquivos são renomeados instantaneamente, algo que seria tedioso tanto no Neotree quanto impossível no Telescope.

### Criação de Estruturas Complexas

Quando você precisa criar uma estrutura de diretórios e arquivos complexa, o Oil permite que você "desenhe" a estrutura desejada como texto e depois a materialize salvando o buffer.

## A Sinergia com Suas Outras Ferramentas

O Oil não substitui Neotree ou Telescope - ele os complementa perfeitamente:

**Fluxo de Trabalho Típico:**
1. Use Neotree para navegar e entender a estrutura geral do projeto
2. Use Telescope para encontrar e abrir arquivos específicos rapidamente  
3. Use Oil quando precisar manipular a estrutura de arquivos em si

### Exemplo de Integração Harmoniosa

Imagine que você está refatorando um módulo grande:

1. **Neotree**: Mostra onde o módulo atual se encaixa na arquitetura geral
2. **Telescope**: Encontra rapidamente todos os arquivos que referenciam o módulo
3. **Oil**: Reorganiza os arquivos do módulo, cria novos diretórios, e renomeia arquivos conforme necessário

## Expandindo Sua Configuração: Possibilidades Avançadas

Embora sua configuração minimalista seja eficaz, considere estas extensões para casos de uso específicos:

### Configurações de Visualização Customizadas

```lua
oil.setup({
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, bufnr)
      return name == '.git'
    end,
  },
})
```

### Integração com Git

```lua
oil.setup({
  win_options = {
    signcolumn = "yes:2",  -- Mostra status do git
  },
})
```

### Ações Customizadas

Você pode adicionar ações customizadas que aproveitam o contexto do Oil:

```lua
vim.keymap.set("n", "<leader>ot", function()
  -- Abre terminal no diretório atual do Oil
  local dir = require("oil").get_current_dir()
  vim.cmd("terminal")
  vim.cmd("cd " .. dir)
end, { desc = "Open terminal in Oil directory" })
```

## A Filosofia Unix Aplicada à Navegação de Arquivos

O Oil encarna a filosofia Unix de "fazer uma coisa e fazê-la bem". Ele não tenta ser um explorador de arquivos completo com visualizações de árvore, pré-visualizações, ou integração com sistemas de controle de versão. Em vez disso, ele faz uma coisa extraordinariamente bem: permite que você edite estruturas de arquivos como se fossem texto.

Esta especialização é sua força. Quando você precisa de operações complexas em arquivos, nenhuma quantidade de cliques ou navegação por menus se compara à velocidade e precisão de usar comandos de edição de texto que você já conhece. O Oil transforma o sistema de arquivos em um domínio onde sua expertise em Vim se aplica diretamente.

A genialidade do Oil está em reconhecer que desenvolvedores passam tanto tempo manipulando estruturas de arquivos quanto código, e que as mesmas ferramentas poderosas que usamos para editar código deveriam estar disponíveis para editar essas estruturas. É uma ferramenta que não apenas melhora produtividade, mas muda fundamentalmente como você pensa sobre organização de projetos.
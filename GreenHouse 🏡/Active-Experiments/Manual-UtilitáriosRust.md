# Guia Prático: Utilitários Modernos em Rust para o Linux

Este guia apresenta alternativas modernas, escritas em Rust, para os comandos tradicionais do Linux. Estas ferramentas oferecem melhor desempenho, recursos adicionais e interfaces mais amigáveis.

## Tabela de Equivalências

| Comando Tradicional | Alternativa em Rust | Descrição Básica |
|---------------------|---------------------|------------------|
| `cat` | `bat` | Visualizador de arquivos com syntax highlighting |
| `ls` | `exa` | Listagem de diretórios com recursos visuais |
| `find` | `fd` | Busca de arquivos mais intuitiva e rápida |
| `ps` | `procs` | Visualização de processos com formato amigável |
| `sed` | `sd` | Substituição de texto com sintaxe simplificada |
| `du` | `dust` | Análise de uso de disco mais intuitiva |
| `grep` | `ripgrep` | Busca de padrões em texto extremamente rápida |
| `top` | `ytop` | Monitor de sistema interativo |
| `tldr` | `tealdeer` | Páginas de manual simplificadas com exemplos |
| `cd` | `zoxide` | Navegação inteligente entre diretórios |

## Instalação

A maioria destes utilitários pode ser instalada através do cargo (gerenciador de pacotes do Rust):

```bash
# Instalação via cargo
cargo install bat exa fd-find procs sd dust ripgrep ytop tealdeer zoxide

# Ou através de gerenciadores de pacotes como apt, brew, etc.
# Exemplo para Ubuntu/Debian
apt install bat exa fd-find ripgrep
```

## Detalhes por Ferramenta

### bat (substituto para cat)

**O que faz:** Exibe o conteúdo de arquivos com syntax highlighting, números de linha e integração com Git.

**Uso básico:**
```bash
# Exibir conteúdo de um arquivo
bat arquivo.txt

# Exibir múltiplos arquivos
bat arquivo1.txt arquivo2.txt

# Mostrar apenas as linhas 10-20
bat -r 10:20 arquivo.txt

# Sem números de linha
bat --plain arquivo.txt
```

**Dicas:**
- Use `bat -A` para mostrar caracteres invisíveis
- Crie um alias no seu `.bashrc` ou `.zshrc`: `alias cat='bat'`
- Configure seus temas com `bat --list-themes` e `bat --theme=TwoHands`

### exa (substituto para ls)

**O que faz:** Lista o conteúdo de diretórios com cores, ícones e informações extras.

**Uso básico:**
```bash
# Listagem básica
exa

# Listagem detalhada (como ls -l)
exa -l

# Incluir arquivos ocultos
exa -a

# Listagem em árvore
exa --tree

# Com ícones (precisa de fonte compatível)
exa --icons
```

**Dicas:**
- `exa -l --git` mostra status do Git para cada arquivo
- `exa -l --time-style=long-iso` para formato de data ISO
- Alias útil: `alias ls='exa --group-directories-first'`
- Listagem detalhada com ícones: `exa -la --icons --group-directories-first`

### fd (substituto para find)

**O que faz:** Encontra arquivos e diretórios de forma mais rápida e intuitiva.

**Uso básico:**
```bash
# Encontrar todos os arquivos .jpg
fd jpg

# Busca em um diretório específico
fd padrão diretório/

# Executar comando nos arquivos encontrados
fd jpg -x convert {} {.}.png

# Buscar apenas diretórios
fd -t d padrão
```

**Dicas:**
- Por padrão, fd ignora arquivos em .gitignore e ocultos
- Use `-H` para incluir arquivos ocultos
- Use `-I` para incluir arquivos ignorados pelo .gitignore
- `fd -e md` busca apenas arquivos com extensão .md

### procs (substituto para ps)

**O que faz:** Mostra informações sobre processos com formato mais legível e colorido.

**Uso básico:**
```bash
# Listagem básica de processos
procs

# Filtrar por nome
procs chrome

# Mostrar árvore de processos
procs --tree

# Ordenar por uso de CPU
procs --sortd cpu
```

**Dicas:**
- `procs --watch` atualiza a lista de processos em tempo real (como top)
- `procs --insert user,%cpu,memory` para escolher colunas específicas
- Para processos de todos os usuários: `procs -a`

### sd (substituto para sed)

**O que faz:** Realiza substituições de texto com sintaxe mais simples que o sed.

**Uso básico:**
```bash
# Substituir texto em um arquivo (in-place)
sd 'padrão' 'substituição' arquivo.txt

# Substituir usando expressões regulares
sd -s 'erro[0-9]+' 'bug' arquivo.txt

# Substituir com pipe
cat arquivo.txt | sd 'padrão' 'substituição'
```

**Dicas:**
- Não precisa escapar de barras como no sed
- Suporta expressões regulares de Perl por padrão
- Use `-f` para substituições de múltiplas linhas

### dust (substituto para du)

**O que faz:** Analisa uso de disco com interface mais intuitiva e organizada por tamanho.

**Uso básico:**
```bash
# Analisar o diretório atual
dust

# Analisar diretório específico
dust /home/usuario

# Limitar profundidade
dust -d 2

# Mostrar tamanhos em bytes
dust -b
```

**Dicas:**
- Use setas para navegar em diretórios grandes
- `dust -r` classifica em ordem reversa (menores primeiro)
- `dust -n 10` mostra apenas os 10 maiores itens

### ripgrep (rg) (substituto para grep)

**O que faz:** Busca texto em arquivos com performance muito superior ao grep.

**Uso básico:**
```bash
# Buscar texto em arquivos
rg "padrão"

# Busca sensível a maiúsculas/minúsculas
rg -s "Padrão"

# Buscar em diretório específico
rg "padrão" ./src/

# Buscar apenas em arquivos .js
rg -t js "função"
```

**Dicas:**
- Respeita .gitignore automaticamente
- `-A 3 -B 2` mostra 3 linhas após e 2 antes das correspondências
- `rg -l padrão` lista apenas nomes de arquivos
- `rg -C 5` mostra 5 linhas de contexto ao redor dos resultados

### ytop (substituto para top)

**O que faz:** Monitor de sistema interativo com interface gráfica TUI.

**Uso básico:**
```bash
# Iniciar ytop
ytop

# Usar tema escuro
ytop -c monokai

# Modo minimalista
ytop -m
```

**Dicas:**
- Pressione `h` para ajuda
- `f` para alternar vista em tela cheia para um processo
- `tab` para navegar entre visualizações
- `q` para sair

### tealdeer (substituto para tldr/man)

**O que faz:** Mostra exemplos práticos de uso de comandos, em vez de manuais completos.

**Uso básico:**
```bash
# Ver exemplos de um comando
tldr tar

# Atualizar cache
tldr --update

# Ver exemplos de comando específico da plataforma
tldr --os=linux find
```

**Dicas:**
- Use `-p` para escolher a plataforma (linux, osx, windows)
- Armazena exemplos localmente para uso offline
- Mais conciso e prático que as páginas de manual tradicionais

### zoxide (substituto para cd)

**O que faz:** Permite navegar entre diretórios de forma inteligente, lembrando dos mais usados.

**Uso básico:**
```bash
# Inicialmente, use como o cd normal
z diretório

# Depois de "ensinar" seus caminhos frequentes:
z projeto  # Vai direto para ~/desenvolvimento/meu-projeto

# Listar diretórios frequentes
z -l
```

**Configuração:**
```bash
# Adicionar ao .bashrc ou .zshrc:
eval "$(zoxide init bash)"  # ou zsh, fish, etc.
```

**Dicas:**
- Quanto mais você usa um diretório, maior a prioridade dele
- `zi` abre seletor interativo para escolher entre diretórios similares
- `z ..` funciona como `cd ..`
- `z -` volta ao diretório anterior

### Benefícios de Migrar para Estas Ferramentas

1. **Performance superior**: Aplicações em Rust são geralmente muito mais rápidas
2. **Recursos modernos**: Suporte a emojis, unicode, ícones, cores
3. **Compatibilidade**: Funcionam bem em pipelines existentes
4. **UX melhorada**: Interfaces mais intuitivas e amigáveis
5. **Defaults inteligentes**: Configurações sensatas por padrão

### Migrando Gradualmente

Para facilitar a transição, você pode criar aliases no seu arquivo `.bashrc` ou `.zshrc`:

```bash
# Aliases para ferramentas em Rust
alias cat='bat --paging=never'
alias ls='exa --group-directories-first'
alias find='fd'
alias grep='rg'
alias du='dust'
alias ps='procs'
alias sed='sd'
alias cd='z'
```

Adicione estes aliases e depois execute `source ~/.bashrc` para ativá-los sem reiniciar o terminal.

### Dicas para Lembrar dos Comandos

1. **Crie um arquivo de referência rápida**: Mantenha este guia em um arquivo markdown para consulta rápida
2. **Use aliases intuitivos**: Configure aliases que façam sentido para você
3. **Pratique regularmente**: Use os novos comandos por pelo menos uma semana consecutiva
4. **Explore as flags de ajuda**: Todos estes comandos têm documentação acessível via `--help`
5. **Personalize configurações**: A maioria dessas ferramentas permite personalização através de arquivos de configuração

#### Recursos Adicionais

- [GitHub de cada ferramenta](https://github.com/topics/rust-cli) para documentação completa
- [Awesome Rust](https://github.com/rust-unofficial/awesome-rust) para mais ferramentas em Rust
- [Rust CLI Working Group](https://github.com/rust-cli/team) para atualizações e novidades
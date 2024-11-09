## Gerenciando Dotfiles com Git

Você já quis versionar seus arquivos de configuração (dotfiles) de uma forma simples e elegante? Vou mostrar uma técnica que usa apenas Git - sem ferramentas extras ou links simbólicos.

## A Técnica em Resumo

A ideia é usar um repositório Git bare em uma pasta oculta (como `~/.cfg`) e um alias especial para gerenciar seus dotfiles diretamente do seu diretório home.

## Configuração Inicial

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Uso Diário

Depois de configurado, você gerencia seus dotfiles assim:

```bash
config add .vimrc
config commit -m "Atualiza vimrc"
config push
```

## Migrando para um Novo Sistema

1. Adicione o alias ao seu shell:
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

2. Clone seu repositório:
```bash
git clone --bare <seu-repositorio> $HOME/.cfg
```

3. Faça checkout dos arquivos:
```bash
config checkout
```

Se houver conflitos, o sistema criará backup dos arquivos existentes automaticamente.

## Vantagens

- Zero dependências além do Git
- Sem links simbólicos
- Branches diferentes para máquinas diferentes
- Backup e sincronização automáticos
- Histórico completo de mudanças

## Dica Pro

Para facilitar a instalação em novos sistemas, você pode criar um script de instalação e hospedá-lo em uma URL curta:

```bash
#!/bin/bash

# Script de instalação automática de dotfiles
# Salve como install.sh

# Configurações
DOTFILES_REPO="seu-repositorio-git" # Exemplo: https://github.com/seu-usuario/dotfiles.git
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
CONFIG_DIR="$HOME/.cfg"

# Função para fazer backup dos arquivos existentes
backup_existing_files() {
    echo "Criando backup dos dotfiles existentes em $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    while read file; do
        mkdir -p "$BACKUP_DIR/$(dirname "$file")"
        mv "$HOME/$file" "$BACKUP_DIR/$file"
    done
}

# Função para configurar o alias
setup_git_alias() {
    echo "Configurando alias 'config' para gerenciar dotfiles"
    alias config="/usr/bin/git --git-dir=$CONFIG_DIR/ --work-tree=$HOME"
    
    # Adiciona o alias ao shell apropriado
    for shell_rc in ".bashrc" ".zshrc"; do
        if [ -f "$HOME/$shell_rc" ]; then
            echo "Adicionando alias ao $shell_rc"
            echo "alias config='/usr/bin/git --git-dir=$CONFIG_DIR/ --work-tree=$HOME'" >> "$HOME/$shell_rc"
        fi
    done
}

# Função principal de instalação
install_dotfiles() {
    echo "Iniciando instalação dos dotfiles..."

    # Verifica se git está instalado
    if ! command -v git >/dev/null 2>&1; then
        echo "Git não está instalado. Por favor, instale o Git primeiro."
        exit 1
    fi

    # Remove instalação anterior se existir
    if [ -d "$CONFIG_DIR" ]; then
        echo "Removendo instalação anterior..."
        rm -rf "$CONFIG_DIR"
    fi

    # Clona o repositório
    echo "Clonando repositório de dotfiles..."
    git clone --bare "$DOTFILES_REPO" "$CONFIG_DIR"

    # Configura o alias temporariamente
    setup_git_alias

    # Tenta fazer checkout dos arquivos
    if ! config checkout; then
        echo "Fazendo backup dos dotfiles existentes..."
        backup_existing_files
        
        # Tenta checkout novamente
        if ! config checkout; then
            echo "Checkout falhou. Verifique os erros acima."
            exit 1
        fi
    fi

    # Configura o repositório
    config config --local status.showUntrackedFiles no

    echo "Instalação concluída com sucesso!"
    echo "Use o comando 'config' para gerenciar seus dotfiles. Exemplo: config status"
}

# Executa a instalação
install_dotfiles
```

## Como Usar

1. **Prepare o Script**
   - Salve o script acima como `install.sh`
   - Modifique a variável `DOTFILES_REPO` com a URL do seu repositório
   - Torne o script executável: `chmod +x install.sh`

2. **Hospede o Script**
   - Você pode hospedar em um Gist do GitHub
   - Use um serviço de encurtamento de URL como bit.ly
   - Ou hospede em seu próprio servidor

3. **Instalação Rápida**
   ```bash
   curl -Lks http://seu-script-de-instalacao | /bin/bash
   ```

## Recursos do Script

- ✨ Backup automático dos dotfiles existentes
- 🔄 Suporte para múltiplos shells (bash/zsh)
- 🛡️ Verificações de segurança básicas
- 📝 Logs informativos durante a instalação
- 🔧 Fácil personalização

## Personalizações Comuns

1. **Adicionar Verificações de Sistema**
   ```bash
   # No início do script
   check_system() {
       if [ "$(uname)" == "Darwin" ]; then
           # Configurações específicas para macOS
           echo "Detectado macOS"
       elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
           # Configurações específicas para Linux
           echo "Detectado Linux"
       fi
   }
   ```

2. **Adicionar Instalação de Dependências**
   ```bash
   install_dependencies() {
       if [ "$(uname)" == "Darwin" ]; then
           # Instala homebrew se necessário
           which brew >/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
       elif [ -f "/etc/debian_version" ]; then
           sudo apt-get update
           sudo apt-get install -y git curl
       fi
   }
   ```

## Dicas de Segurança

1. **Sempre verifique o script antes de executar**
   - Revise o código fonte antes de executar via curl
   - Use HTTPS para o download do script

2. **Use Hashes para Verificação**
   ```bash
   # Verifique a integridade do script
   echo "hash-esperado script.sh" | sha256sum -c
   ```

3. **Adicione Verificações de Permissão**
   ```bash
   if [ "$(id -u)" == "0" ]; then
       echo "Não execute este script como root!"
       exit 1
   fi
   ```

Este script torna a instalação de dotfiles muito mais robusta e segura, ideal para uso em diferentes sistemas. Você pode personalizá-lo ainda mais de acordo com suas necessidades específicas!

### MATERIAIS FONTE:
[GERENCIE DOTFILES COM GIT](https://www.atlassian.com/git/tutorials/dotfiles)
[Using Git to Manage System Configuration Files](https://www.wangzerui.com/2017/03/06/using-git-to-manage-system-configuration-files/)

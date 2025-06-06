## Guia Definitivo do GitHub CLI para Iniciantes

## Sumário
1. [[GIT-GitHubCLI#1.1 Introdução ao GitHub CLI|Introdução ao GitHub CLI]]
2. [[GIT-GitHubCLI#2.1 Instalação|Instalação]]
3. [[GIT-GitHubCLI#3.1 Primeiros Passos|Primeiros Passos]]
4. [[GIT-GitHubCLI#4.1 Gerenciando Repositórios|Gerenciando Repositórios]]
5. [[GIT-GitHubCLI#5.1 Fluxo de Trabalho com Branches|Fluxo de Trabalho com Branches]]
6. [[GIT-GitHubCLI#6.1 Pull Requests|Pull Requests]]
7. [[GIT-GitHubCLI#7.1 Issues|Issues]]
8. [[GIT-GitHubCLI#8.1 Codespaces|Codespaces]]
9. [[GIT-GitHubCLI#9.1 Gists e Snippets|Gists e Snippets]]
10. [[GIT-GitHubCLI#10.1 Workflows Avançados|Workflows Avançados]]
11. [[GIT-GitHubCLI#11.1 Aliases e Atalhos|Aliases e Atalhos]]
12. [[GIT-GitHubCLI#12.1 Automação|Automação]]
13. [[GIT-GitHubCLI#13.1 Dicas e Truques|Dicas e Truques]]
14. [[GIT-GitHubCLI#14.1 Recursos para Aprendizado|Recursos para Aprendizado]]


# 1.1 Introdução ao GitHub CLI

O GitHub CLI (Interface de Linha de Comando) é uma ferramenta que traz todo o poder do GitHub para o seu terminal. Com ele, você pode executar praticamente todas as ações que faria na interface web do GitHub diretamente do seu terminal, tornando seu fluxo de trabalho mais rápido e eficiente.

### 1.2 Por que usar o GitHub CLI?

- **Produtividade:** Execute comandos do GitHub sem sair do terminal
- **Automação:** Crie scripts para automatizar tarefas repetitivas
- **Eficiência:** Menos tempo navegando pela interface web, mais tempo codificando
- **Consistência:** Padronize seu fluxo de trabalho independente do ambiente

## 2.1 Instalação

#### 2.2Windows
```
winget install --id GitHub.cli
```

Ou com Chocolatey:
```
choco install gh
```

#### 2.3 macOS
```
brew install gh
```

#### 2.4 Linux (Ubuntu/Debian)
```
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```

#### 2.5 Verificação da instalação
Após instalar, verifique se está funcionando:
```
gh --version
```

## 3.1 Primeiros Passos

### 3.2 Autenticação
Antes de usar o GitHub CLI, você precisa se autenticar:

```
gh auth login
```

O comando inicia um processo interativo onde você pode escolher:
1. Login via navegador web
2. Login com token de autenticação
3. Login via SSH

Recomendado para iniciantes: escolha a opção do navegador web para facilitar.

### 3.3 Configuração Básica
Verifique sua configuração atual:
```
gh config list
```

Configure seu editor padrão (substituindo "code" pelo seu editor preferido):
```
gh config set editor "code"
```

## 4.1 Gerenciando Repositórios

### 4.2 Listar seus repositórios
```
gh repo list
```

### 4.3 Criar um novo repositório
```
gh repo create meu-projeto --public
```
Adicione `--clone` para clonar automaticamente após criar.

Para criar com mais opções:
```
gh repo create meu-projeto --description "Meu projeto incrível" --public --homepage "https://meusite.com" --gitignore Node --license mit
```

### 4.4 Clonar um repositório
```
gh repo clone usuario/repositorio
```

### 4.5 Ver detalhes de um repositório
```
gh repo view usuario/repositorio
```
Adicione `--web` para abrir no navegador.

### 4.6 Forkear um repositório
```
gh repo fork usuario/repositorio
```

## 5.1 Fluxo de Trabalho com Branches

### 5.2 Criar uma nova branch
```
gh repo clone usuario/repositorio
cd repositorio
git checkout -b minha-nova-feature
```

### 5.3 Status do seu trabalho
```
gh status
```

### 5.4 Visualizar diferenças
```
git diff
```

### 5.5 Commit e push
```
git add .
git commit -m "Adiciona nova funcionalidade"
git push -u origin minha-nova-feature
```

## 6.1 Pull Requests

### 6.2 Criar um Pull Request
Após fazer push da sua branch:
```
gh pr create --title "Implementa nova funcionalidade" --body "Esta PR implementa a funcionalidade X"
```

Para abrir um editor para descrição mais detalhada:
```
gh pr create --title "Implementa nova funcionalidade"
```

### 6.3 Listar Pull Requests
```
gh pr list
```

### 6.4 Ver detalhes de um Pull Request
```
gh pr view 123
```
Onde 123 é o número do PR.

Para ver no navegador:
```
gh pr view 123 --web
```

### 6.5 Revisar um Pull Request
```
gh pr checkout 123
```
Isso muda para a branch do PR.

Adicionar comentário:
```
gh pr review 123 --comment -b "Parece bom, mas poderia melhorar X"
```

Aprovar PR:
```
gh pr review 123 --approve
```

Solicitar mudanças:
```
gh pr review 123 --request-changes -b "Por favor, corrija X antes de prosseguir"
```

### 6.6 Merge de um Pull Request
```
gh pr merge 123
```

Opções adicionais:
```
gh pr merge 123 --squash
gh pr merge 123 --rebase
gh pr merge 123 --delete-branch
```

## 7.1 Issues

### 7.2 Criar uma Issue
```
gh issue create --title "Bug no login" --body "O login falha quando..."
```

Para uma descrição mais detalhada:
```
gh issue create --title "Bug no login"
```

### 7.3 Listar Issues
```
gh issue list
```

Filtrar issues:
```
gh issue list --assignee @me
gh issue list --label bug
gh issue list --state closed
```

### 7.4 Ver detalhes de uma Issue
```
gh issue view 456
```

Onde 456 é o número da issue.

### 7.5 Fechar uma Issue
```
gh issue close 456
```

Fechar com comentário:
```
gh issue close 456 -c "Resolvido na PR #123"
```

## 8.1 Codespaces

### 8.2 Listar Codespaces disponíveis
```
gh codespace list
```

### 8.3 Criar um novo Codespace
```
gh codespace create -r usuario/repositorio
```

### 8.4 Conectar a um Codespace via SSH
```
gh codespace ssh -c nome-do-codespace
```

### 8.5 Parar um Codespace
```
gh codespace stop -c nome-do-codespace
```

### 8.6 Excluir um Codespace
```
gh codespace delete -c nome-do-codespace
```

## 9.1 Gists e Snippets

### 9.2 Criar um Gist
A partir de um arquivo:
```
gh gist create arquivo.js
```

Múltiplos arquivos:
```
gh gist create arquivo1.js arquivo2.js
```

Gist privado:
```
gh gist create arquivo.js --private
```

### 9.3 Listar seus Gists
```
gh gist list
```

### 9.4 Clonar um Gist
```
gh gist clone ID-DO-GIST
```

### 9.5 Editar um Gist
```
gh gist edit ID-DO-GIST
```

## 10.1 Workflows Avançados

### 10.2 Ver ações e status de CI/CD
```
gh run list
```

Ver detalhes de uma execução específica:
```
gh run view ID-DA-EXECUCAO
```

Ver logs de uma execução:
```
gh run view ID-DA-EXECUCAO --log
```

### 10.3 Trabalhar com releases
Listar releases:
```
gh release list
```

Criar uma release:
```
gh release create v1.0.0 --title "Primeira versão" --notes "Notas da versão"
```

Fazer upload de arquivos para uma release:
```
gh release upload v1.0.0 arquivo.zip
```

## 11.1 Aliases e Atalhos

Crie comandos personalizados para tarefas comuns:

### 11.2 Adicionar um alias
```
gh alias set prs "pr list --assignee @me"
```

Agora você pode usar:
```
gh prs
```

Exemplos úteis de aliases:
```
gh alias set open-pr "pr create --fill --web"
gh alias set my-issues "issue list --assignee @me"
gh alias set co-pr "pr checkout"
```

### 11.3 Listar aliases
```
gh alias list
```

## 12.1 Automação

### 12.2 Uso em scripts
Você pode usar o GitHub CLI em scripts de automação:

```bash
#!/bin/bash
# Cria uma nova branch e PR automaticamente

BRANCH_NAME="feature/$(date +%Y%m%d)"
PR_TITLE="Feature: atualização diária"

git checkout -b $BRANCH_NAME
# ... fazer alterações
git add .
git commit -m "$PR_TITLE"
git push -u origin $BRANCH_NAME

gh pr create --title "$PR_TITLE" --body "Atualização automática de $(date +%d/%m/%Y)"
```

### 12.3 Integração com outras ferramentas
Exemplo com jq para processar saída JSON:

```bash
gh pr list --json number,title,author --jq '.[] | "PR #\(.number): \(.title) by \(.author.login)"'
```

## 13.1 Dicas e Truques

### 13.2 Formatação de saída
Obter dados em JSON para processamento:
```
gh issue list --json number,title,state
```

Filtrar com jq:
```
gh issue list --json number,title,state --jq '.[] | select(.state=="OPEN")'
```

### 13.3 Navegação rápida
Abrir repositório no navegador:
```
gh repo view --web
```

Abrir página de issues:
```
gh issue list --web
```

### 13.4 Visualização no terminal
Ver PR com diff colorido:
```
gh pr view 123 --comments
```

### 13.5 Modos interativos
Escolher um PR interativamente:
```
gh pr checkout
```

Isso mostra uma lista de PRs para escolher.

## 14.1 Recursos para Aprendizado

- **Documentação oficial**: `gh help`
- **Manual completo online**: https://cli.github.com/manual/
- **Exemplos**: https://github.com/cli/cli/tree/trunk/docs/examples
- **GitHub Learning Lab**: https://lab.github.com/
- **Comunidade GitHub**: https://github.community/

## Prática Recomendada: Workflow diário

Um fluxo de trabalho completo que você pode seguir:

1. Atualizar seu repositório local:
   ```
   git checkout main
   git pull
   ```

2. Criar uma nova branch para sua tarefa:
   ```
   git checkout -b feature/nova-funcionalidade
   ```

3. Fazer suas alterações e commit:
   ```
   # Faça alterações nos arquivos
   git add .
   git commit -m "Implementa nova funcionalidade"
   ```

4. Enviar para o GitHub:
   ```
   git push -u origin feature/nova-funcionalidade
   ```

5. Criar um Pull Request:
   ```
   gh pr create --title "Nova funcionalidade" --body "Esta PR implementa..."
   ```

6. Verificar status das suas contribuições:
   ```
   gh pr list --author @me
   gh issue list --assignee @me
   ```

7. Revisar e fazer merge quando aprovado:
   ```
   gh pr checks 123
   gh pr merge 123 --squash --delete-branch
   ```

---

Lembre-se: a prática é essencial! Use estes comandos diariamente e logo você dominará o GitHub CLI, tornando seu fluxo de trabalho mais eficiente e produtivo.
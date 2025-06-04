09/10/2024 | 10:30 A.M

Status: #done 
## Git Basics: Entendendo o Sistema de Controle de Versão e Seu Fluxo de Trabalho

O Git é uma das ferramentas mais importantes para desenvolvedores modernos, usado para gerenciar alterações em projetos e facilitar o trabalho colaborativo. Desenvolvido por Linus Torvalds em 2005, o Git se destaca como um sistema de controle de versão distribuído. Cada desenvolvedor possui uma cópia completa do histórico do projeto em sua máquina local, possibilitando o rastreamento detalhado das mudanças e uma gestão mais robusta de código.

Esse artigo explora conceitos-chave do Git, incluindo o fluxo de trabalho típico (usando tanto comandos **porcelain** quanto **plumbing**), e algumas dicas úteis para iniciantes que vão além do básico.

### Conceitos Fundamentais do Git

Antes de nos aprofundarmos, vamos revisar rapidamente alguns termos e conceitos fundamentais:

- **Repositório**: Local onde todo o histórico do projeto é armazenado. Ao clonar um repositório, você baixa todas as versões e mudanças feitas anteriormente.
- **Commit**: Registro de uma alteração no projeto. Cada commit é como uma "fotografia" do projeto naquele momento.
- **Branch**: Linha de desenvolvimento que permite trabalhar em novas funcionalidades sem afetar a linha principal do código.
- **Pull Request**: Solicitação para mesclar uma funcionalidade desenvolvida em uma branch de volta à branch principal.
- **TarBalls**: Arquivos compactados que agrupam múltiplos arquivos; frequentemente usados em releases para compartilhar o estado do projeto.

### Duas Abordagens: "Porcelain" e "Plumbing"

No Git, existem duas categorias principais de comandos: **Porcelain** e **Plumbing**.

- **Porcelain**: Comandos de alto nível, que são mais intuitivos e simplificam o uso do Git para a maioria dos desenvolvedores.
- **Plumbing**: Comandos de baixo nível, que manipulam diretamente os objetos internos do Git. São úteis para entender o funcionamento do Git em detalhes, embora não sejam necessários no uso diário.

### Fluxo de Trabalho com Git: Uma Visão Prática

#### Workflow usando Comandos Porcelain

Este é o fluxo de trabalho comum para a maioria dos desenvolvedores. Ele usa comandos que facilitam a interação com o Git:

1. **Clonar o Repositório**  
   ```bash
   git clone <url-do-repositório>
   ```
   Este comando cria uma cópia local completa do repositório remoto.

2. **Criar uma Nova Branch**  
   ```bash
   git branch minha-nova-feature
   git checkout minha-nova-feature
   ```
   Criar e mudar para uma nova branch permite que você trabalhe em uma funcionalidade isolada, sem afetar o código da branch principal.

3. **Fazer Alterações e Adicionar ao Staging**  
   ```bash
   git add .
   ```
   O comando `git add` coloca as mudanças em um "staging area", preparando-as para o commit. É aqui que você revisa as alterações antes de confirmá-las.

4. **Criar um Commit**  
   ```bash
   git commit -m "Descrição do que foi alterado"
   ```
   Ao fazer um commit, você cria um registro de todas as alterações feitas e armazenadas na staging area.

5. **Sincronizar as Alterações com o Repositório Remoto**  
   ```bash
   git push origin minha-nova-feature
   ```
   O `git push` envia as mudanças para o repositório remoto, permitindo que outros desenvolvedores acessem seu progresso.

6. **Criar um Pull Request**  
   Dependendo da plataforma (como GitHub, GitLab ou Bitbucket), você pode abrir um Pull Request para solicitar que suas alterações sejam mescladas na branch principal.

#### Workflow usando Comandos Plumbing

Embora o fluxo de trabalho porcelain cubra a maioria dos casos, os comandos plumbing permitem um entendimento mais profundo do Git e o controle direto sobre suas operações internas:

1. **Iniciar um Repositório Git Manualmente**
   ```bash
   git init
   ```
   Diferente do `git clone`, que já configura o repositório, `git init` cria um repositório vazio e permite adicionar arquivos manualmente.

2. **Adicionar Arquivos Diretos ao Objeto Git com `git hash-object`**
   ```bash
   git hash-object -w nome_do_arquivo
   ```
   Este comando cria um hash único para o arquivo e o armazena no repositório Git, gerando um objeto "blob".

3. **Criar uma Estrutura de Diretório com `git write-tree`**
   ```bash
   git write-tree
   ```
   Ele gera um "tree object" (estrutura de diretório), essencialmente uma snapshot dos arquivos no estado atual.

4. **Registrar o Commit Manualmente com `git commit-tree`**
   ```bash
   git commit-tree <id_do_objeto_tree> -m "Mensagem do commit"
   ```
   Diferente do `git commit`, que automatiza o processo, `git commit-tree` permite criar um commit usando diretamente o ID do objeto de árvore gerado.

5. **Atualizar o Índice com `git update-index`**
   ```bash
   git update-index --add nome_do_arquivo
   ```
   O `git update-index` permite gerenciar manualmente o índice do Git, atualizando quais arquivos devem estar no próximo commit.

### Dicas Práticas para Iniciantes em Git

1. **Commits Pequenos e Descritivos**: Tente fazer commits pequenos e focados em mudanças específicas. Isso facilita a rastreabilidade e revisão do código.

2. **Nunca Edite Commits Públicos**: Alterar commits já enviados para o repositório remoto pode causar conflitos para outros desenvolvedores. Evite `git rebase` ou `git amend` em commits já sincronizados com o repositório remoto.

3. **Use Aliases para Comandos Frequentes**: Git permite criar aliases para comandos. Isso ajuda a economizar tempo e torna o fluxo de trabalho mais eficiente:
   ```bash
   git config --global alias.st status
   git config --global alias.co checkout
   ```

4. **Limpeza Regular com `git gc`**: Use `git gc` (garbage collection) para limpar arquivos e referências antigas e liberar espaço no repositório.

5. **Diferença entre `git fetch` e `git pull`**: `git fetch` baixa as alterações do repositório remoto, mas não as aplica, enquanto `git pull` baixa e mescla diretamente as mudanças. Usar `git fetch` primeiro é útil para revisar o que foi alterado antes de mesclar.

### Conclusão

O Git oferece um conjunto robusto de ferramentas tanto para iniciantes quanto para usuários avançados. A abordagem **Porcelain** facilita o uso cotidiano, enquanto a **Plumbing** proporciona um entendimento mais detalhado, permitindo manipular o Git em seu nível mais fundamental. Com o tempo, as práticas recomendadas e o uso estratégico dessas ferramentas garantirão que seu fluxo de trabalho seja eficiente, organizado e seguro.

### MATERIAIS FONTE:
[ENTENDENDO GIT](https://www.youtube.com/watch?v=6Czd1Yetaac)
[TECH TALK WITH LINUS TORVALDS ABOUT GIT](https://www.youtube.com/watch?v=MjIPv8a0hU8)
[SO YOU THINK YOU KNOW GIT]()

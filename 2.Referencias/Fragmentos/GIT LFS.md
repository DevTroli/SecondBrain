# Gerenciamento Eficiente de Arquivos Grandes nos Projetos

## O que é Git LFS (Large File Storage)?
Git LFS é uma extensão do [[2.Referencias/Vídeos & Podcasts/GIT]] que permite o versionamento eficiente de arquivos grandes, especialmente útil para equipes que trabalham com:
- Arquivos Figma/Sketch (.fig, .sketch)
- Assets de UI/UX em alta resolução
- Protótipos interativos
- Recursos de design (PSD, AI, XD)
- Vídeos de demonstração de UX

```bash
# Estrutura típica de projeto design + dev
project/
├── src/
│   └── components/
├── designs/
│   ├── mockups/ (LFS)
│   ├── prototypes/ (LFS)
│   └── assets/ (LFS)
└── .gitattributes
```

## Instalação do Git LFS

```bash
# macOS
brew install git-lfs

# Arch Linux
sudo pacman -S git-lfs

# Após instalação, ative no Git
git lfs install
```

## Criando um Novo Repositório com Git LFS

```bash
# Inicializar novo repo
git init design-dev-project

cd design-dev-project

# Configurar LFS
git lfs install

# Configurar tracking para arquivos de design
git lfs track "*.psd"
git lfs track "*.sketch"
git lfs track "*.fig"
git lfs track "*.ai"
git lfs track "*.xd"

# Adicionar .gitattributes
git add .gitattributes
git commit -m "Configuração inicial do Git LFS para arquivos de design"
```

## Clonando Repositório LFS Existente

```bash
# Clone completo
git clone https://exemplo.com/design-dev-project.git

# Clone otimizado (apenas últimas versões)
git clone --depth=1 https://exemplo.com/design-dev-project.git
```

## Otimizando Clones e Pulls

#### Clones Mais Rápidos
```bash
# Clone sem baixar arquivos LFS
GIT_LFS_SKIP_SMUDGE=1 git clone https://exemplo.com/design-dev-project.git

# Baixar apenas arquivos LFS necessários
git lfs pull --include="designs/current-sprint/*"
```

#### Pulls Otimizados
```bash
# Pull apenas de arquivos modificados recentemente
git lfs pull --recent
git lfs pull --include="designs/sprint-${SPRINT_NUMBER}/*"
```

## Gerenciando Arquivos com Git LFS

#### Tracking
```bash
# Adicionar novos tipos de arquivo
git lfs track "designs/**/*.sketch"
git lfs track "assets/**/*.psd"

# Verificar arquivos tracked
git lfs track
```

#### Commits e Pushes
```bash
# Workflow normal do Git
git add designs/new-feature.sketch
git commit -m "Add: Nova interface do dashboard"
git push origin main
```

## Migração entre Servidores

```bash
# Exportar repositório com LFS
git lfs fetch --all
git lfs migrate export

# Importar em novo servidor
git lfs migrate import
```

## Gerenciamento de Histórico e Espaço

#### Fetch de Histórico Adicional
```bash
# Buscar histórico completo de arquivos específicos
git lfs fetch --all
git lfs fetch --recent --all
```

#### Limpeza de Arquivos
```bash
# Remover arquivos LFS locais
git lfs prune

# Remover do servidor (cuidado!)
git lfs push --delete origin refs/heads/main "path/to/old-design.psd"
```

## Inclusão/Exclusão Seletiva

```bash
# .gitattributes
*.psd filter=lfs diff=lfs merge=lfs -text
designs/wip/* -filter=lfs -diff=lfs -merge=lfs text
```

## Sistema de Locks

```bash
# Bloquear arquivo para edição
git lfs lock "designs/main-interface.sketch"

# Listar arquivos bloqueados
git lfs locks

# Desbloquear
git lfs unlock "designs/main-interface.sketch"
```

## Como o Git LFS Funciona (Design -> Dev)

1. **Armazenamento**
   - Arquivos grandes → servidor LFS
   - Ponteiros leves → repositório Git
   - Mantém histórico Git eficiente

2. **Workflow Design + Dev**
   ```
   Designer          →    Git LFS    →    Desenvolvedor
   [Figma update]    →   [commit]    →    [pull changes]
   ```

3. **Integração**
   - Designers trabalham em arquivos fonte
   - Devs acessam assets exportados
   - Sistema mantém sincronia

4. **Otimização**
   - Downloads sob demanda
   - Cache local inteligente
   - Bandwidth otimizado

## Melhores Práticas

1. **Organização**
   - Separar designs por sprints/versões
   - Usar estrutura clara de diretórios
   - Documentar convenções de nomenclatura

2. **Performance**
   - Usar clone parcial quando possível
   - Limpar cache regularmente
   - Manter tracking list atualizada

3. **Colaboração**
   - Usar locks para edições críticas
   - Manter comunicação designer-dev
   - Documentar workflow da equipe

4. **Manutenção**
   - Backup regular
   - Prune periódico
   - Monitoramento de uso

Este guia fornece uma base sólida para equipes que precisam integrar design e desenvolvimento usando Git LFS, mantendo o repositório eficiente e a colaboração fluida. Git LFS: Gerenciamento Eficiente de Arquivos Grandes em Projetos de Design e Desenvolvimento
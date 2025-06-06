# Fundamentos de Referências Git

## Hashes: A Base de Tudo
O Git fundamentalmente identifica commits através de hashes SHA-1. Cada commit recebe um identificador único de 40 caracteres (por exemplo: `0c708fdec272bc4446c6cabea4f0022c2b616eba`). Para praticidade, você pode usar apenas os primeiros caracteres necessários para identificação única:

```bash
git show 0c708f  # O Git encontrará o commit correto
```

Para resolver referências em hashes, use:
```bash
git rev-parse main  # Retorna o hash do último commit do branch main
```

## Anatomia do Sistema de Refs

#### Estrutura de Diretórios
```
.git/refs/
├── heads/        # Branches locais
│   ├── main
│   └── feature
├── remotes/      # Branches remotos
│   └── origin/
│       └── main
└── tags/         # Tags
    └── v0.9
```

Cada arquivo dentro dessa estrutura contém o hash do commit correspondente. Por exemplo:
```bash
cat .git/refs/heads/main  # Mostra o hash do último commit do branch main
```

#### Refs Especiais
Localizados no diretório `.git/`:
- `HEAD`: Referência atual
- `FETCH_HEAD`: Último branch obtido do remoto
- `ORIG_HEAD`: Backup do HEAD
- `MERGE_HEAD`: Commits sendo mesclados
- `CHERRY_PICK_HEAD`: Commit em cherry-pick

### Refs Compactadas (Packed Refs)

Para otimização, o Git ocasionalmente compacta refs em um único arquivo, usando o [[GIT-GC]]:
```bash
git gc  # Força a compactação
```

O arquivo `packed-refs` resultante tem este formato:
```
00f54250cf4e549fdfcafe2cf9a2c90bc3800285 refs/heads/feature
0e25143693cfe9d5c2e83944bbaf6d3c4505eb17 refs/heads/main
```

## Refspecs: Mapeamento Avançado

### Sintaxe Básica
```
[+]<src>:<dst>
```
- `+`: Força atualização não-fast-forward
- `src`: Branch fonte (local)
- `dst`: Branch destino (remoto)

### Exemplos Práticos
```bash
# Push main para qa-main
git push origin main:refs/heads/qa-main

# Deletar branch remoto
git push origin :feature-branch
# ou
git push origin --delete feature-branch
```

### Configuração no .git/config
```ini
[remote "origin"]
url = https://github.com/exemplo/repo.git
fetch = +refs/heads/*:refs/remotes/origin/*
push = refs/heads/main:refs/heads/qa-main
```

## Referências Relativas

### Navegação na Árvore de Commits
- `~n`: n commits para trás seguindo primeiro pai
- `^n`: n-ésimo pai (em merges)

Exemplos:
```bash
git show HEAD~2     # Avô do commit atual
git show HEAD^2     # Segundo pai (em merge)
git show HEAD^2^1   # Primeiro pai do segundo pai
```


## Considerações de Performance

- Refs compactadas (`packed-refs`) melhoram performance em repositórios grandes
- [[GIT-REFLOG]] podem crescer significativamente; limpe periodicamente com `git gc`
- Use refs relativas com moderação em scripts (porque podem ser ações computacionalmente custosas)

## Melhores Práticas

1. Mantenha convenções de [[DEV-SemanticsCommits]]
2. Limpe refs remotas obsoletas regularmente
3. Monitore o tamanho do reflog em repositórios grandes e limpe os com [[GIT-GC]]

# Reflog: Sistema de Recuperação

## Funcionamento
O reflog mantém histórico cronológico de todas alterações no repositório local.

```bash
git reflog
400e4b7 HEAD@{0}: checkout: moving from main to HEAD~2
0e25143 HEAD@{1}: commit (amend): Feature integration
```

## Recuperação de Estados
```bash
# Voltar para estado anterior
git checkout HEAD@{1}

# Criar branch de recuperação
git branch recovery-branch HEAD@{1}
```

## Casos de Uso Avançados

#### Rebase Interativo com Refs
```bash
git rebase -i HEAD~3  # Rebase interativo dos últimos 3 commits
```

#### Reset Seletivo
```bash
git reset HEAD^2  # Reset para o segundo pai de um merge
```

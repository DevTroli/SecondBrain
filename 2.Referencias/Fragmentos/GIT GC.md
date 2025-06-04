# Guia de Coleta de Lixo no Git

## O que é Git GC?
Git Garbage Collection (GC) é um processo de manutenção que otimiza seu repositório através de:
- Limpeza de arquivos desnecessários
- Otimização do armazenamento
- Compactação de dados
- Remoção de objetos obsoletos

## Funcionamento Básico

### Coleta Automática
O [[2.Referencias/Vídeos & Podcasts/GIT]] executa GC automaticamente quando:
- Você faz commits
- Executa merges
- Realiza rebases
- O número de objetos soltos atinge um limite

```bash
# Execução automática
git gc --auto
```

### Execução Manual
```bash
# Coleta básica
git gc

# Coleta agressiva (mais completa, mas mais lenta)
git gc --aggressive

# Coleta com remoção imediata de objetos antigos
git gc --prune=now
```

## Reempacotamento: O Coração do GC

O processo envolve:

1. **Identificação de Objetos Soltos**
   - Localiza arquivos em `.git/objects`
   - Identifica objetos não empacotados

2. **Compactação**
   - Combina objetos soltos em pack files
   - Aplica compactação delta
   - Remove redundâncias

3. **Otimização**
   - Melhora performance de clones
   - Reduz espaço em disco
   - Acelera operações como fetch e push

## Dicas Práticas

### Quando Usar GC Manual:
1. Antes de backups
2. Após deletar muitos branches/tags
3. Para recuperar repositórios corrompidos
4. Quando o repositório está muito grande

### Monitoramento
```bash
# Ativar logs detalhados
git config --global gc.verbose true
```

### Segurança
- GC normal é seguro
- `--aggressive` pode dificultar recuperação de dados
- Faça backup antes de GC agressivo

## Git GC vs Git Prune

- `git gc`: Processo completo de otimização
- `git prune`: Apenas remove objetos inacessíveis
- GC inclui prune em suas operações

## Melhores Práticas

1. Use GC regular periodicamente
2. Evite `--aggressive` em repositórios ativos
3. Mantenha backups antes de GCs maiores
4. Monitore o tamanho do repositório
5. Use `--prune` com cautela

Lembre-se: GC é uma ferramenta de manutenção importante, mas deve ser usada com conhecimento e cautela, especialmente em suas formas mais agressivas.

### MATERIAIS FONTE:
[Git – GC (Coleta de Lixo)](https://www.geeksforgeeks.org/git-gc-garbage-collection/)
[Como funciona a coleta de lixo no git](https://graphite.dev/guides/git-garbage-collection)
[GIT GC: COMPLETE GUIDE TO DOCS](https://www.atlassian.com/git/tutorials/git-gc)

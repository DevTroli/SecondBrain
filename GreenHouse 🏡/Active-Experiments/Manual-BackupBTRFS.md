# Backup em Sistemas Arch com Btrfs

## Introdução

Este guia ensina como configurar um sistema completo de backup para Arch Linux usando Btrfs snapshots, proporcionando proteção contra falhas do sistema, atualizações problemáticas e perda de dados. O Btrfs (B-tree File System) oferece snapshots instantâneos que capturam o estado completo do sistema sem ocupar espaço adicional inicialmente.

## Conceitos Fundamentais

### O que são Snapshots Btrfs?
Snapshots são "fotografias" do estado do seu sistema em um momento específico. Eles funcionam através de Copy-on-Write (CoW), ou seja, apenas as diferenças são armazenadas, tornando-os extremamente eficientes em espaço.

### Vantagens dos Snapshots Btrfs:
- **Instantâneos**: Criação em segundos, independente do tamanho dos dados
- **Eficiência de espaço**: Apenas mudanças consomem espaço adicional
- **Granularidade**: Pode fazer snapshot de subvolumes específicos
- **Rollback rápido**: Restauração em minutos

## Configuração Inicial

### 1. Verificando a Estrutura Btrfs

```bash
# Listar todos os subvolumes
sudo btrfs subvolume list /

# Verificar layout do sistema de arquivos
sudo btrfs filesystem show

# Verificar uso de espaço
sudo btrfs filesystem usage /
```

### 2. Instalando e Configurando o Snapper

```bash
# Instalar o Snapper
sudo pacman -S snapper

# Criar configuração para o subvolume raiz
sudo snapper -c root create-config /

# Verificar se foi criado corretamente
sudo snapper list-configs
```

### 3. Configurando Permissões e Acesso

```bash
# Adicionar usuário ao grupo para visualizar snapshots
sudo usermod -a -G wheel $USER

# Configurar permissões do diretório .snapshots
sudo chmod 750 /.snapshots
```

## Scripts de Automação

### Script 1: Criação de Snapshot Manual

```bash
#!/bin/bash
# ~/.local/bin/snapshot-create

DESCRIPTION="$1"
if [ -z "$DESCRIPTION" ]; then
    echo "Uso: snapshot-create 'descrição do snapshot'"
    exit 1
fi

echo "Criando snapshot: $DESCRIPTION"
sudo snapper -c root create --description "$DESCRIPTION"

echo "Snapshots atuais:"
sudo snapper -c root list | tail -5
```

### Script 2: Limpeza Inteligente de Snapshots

```bash
#!/bin/bash
# ~/.local/bin/snapshot-cleanup

echo "=== Status antes da limpeza ==="
sudo snapper -c root list | wc -l
sudo btrfs filesystem usage / | grep "Used:"

echo "=== Executando limpeza automática ==="
sudo snapper -c root cleanup number

echo "=== Status após limpeza ==="
sudo snapper -c root list | wc -l
sudo btrfs filesystem usage / | grep "Used:"
```

### Script 3: Backup Completo do Sistema

```bash
#!/bin/bash
# ~/.local/bin/system-backup

BACKUP_DESC="Sistema completo - $(date '+%Y-%m-%d %H:%M')"
EXTERNAL_DRIVE="/mnt/backup"  # Ajuste conforme necessário

echo "=== Iniciando backup completo do sistema ==="

# Criar snapshot local
echo "Criando snapshot local..."
SNAPSHOT_NUM=$(sudo snapper -c root create --print-number --description "$BACKUP_DESC")

# Verificar se drive externo está montado
if [ ! -d "$EXTERNAL_DRIVE" ]; then
    echo "ERRO: Drive de backup não encontrado em $EXTERNAL_DRIVE"
    exit 1
fi

# Sincronizar snapshot para drive externo
echo "Enviando snapshot para drive externo..."
sudo btrfs send /.snapshots/$SNAPSHOT_NUM/snapshot | sudo btrfs receive $EXTERNAL_DRIVE/

echo "=== Backup concluído ==="
echo "Snapshot local: $SNAPSHOT_NUM"
echo "Backup externo: $EXTERNAL_DRIVE/"
```

## Configuração Avançada do Snapper

### Editando Configurações

```bash
sudo nano /etc/snapper/configs/root
```

Configurações recomendadas:

```ini
# Limites de snapshots automáticos
TIMELINE_LIMIT_HOURLY="6"
TIMELINE_LIMIT_DAILY="7"
TIMELINE_LIMIT_WEEKLY="4"
TIMELINE_LIMIT_MONTHLY="6"
TIMELINE_LIMIT_YEARLY="2"

# Ativação de limpeza automática
TIMELINE_CLEANUP="yes"
NUMBER_CLEANUP="yes"

# Configurações de sincronização
SYNC_ACL="yes"
```

### Ativando Serviços Automáticos

```bash
# Ativar snapshots por cronograma
sudo systemctl enable snapper-timeline.timer
sudo systemctl start snapper-timeline.timer

# Ativar limpeza automática
sudo systemctl enable snapper-cleanup.timer
sudo systemctl start snapper-cleanup.timer

# Verificar status
systemctl status snapper-*.timer
```

## Integração com Pacman

### Hooks Automáticos para Atualizações

Criar hooks que fazem snapshots antes e depois de cada operação do pacman:

```bash
# Criar diretório de hooks
sudo mkdir -p /etc/pacman.d/hooks

# Hook pré-transação
sudo tee /etc/pacman.d/hooks/00-snapper-pre.hook << 'EOF'
[Trigger]
Operation = Upgrade
Operation = Install
Operation = Remove
Type = Package
Target = *

[Action]
Description = Criando snapshot pré-atualização...
When = PreTransaction
Depends = snapper
Exec = /usr/bin/snapper --no-dbus -c root create --cleanup-algorithm=number --description="pacman pré-transação"
EOF

# Hook pós-transação
sudo tee /etc/pacman.d/hooks/01-snapper-post.hook << 'EOF'
[Trigger]
Operation = Upgrade
Operation = Install
Operation = Remove
Type = Package
Target = *

[Action]
Description = Criando snapshot pós-atualização...
When = PostTransaction
Depends = snapper
Exec = /usr/bin/snapper --no-dbus -c root create --cleanup-algorithm=number --description="pacman pós-transação"
EOF
```

## Estratégias de Backup

### 1. Backup Local (Snapshots)
- **Frequência**: Automático (timeline) + manual antes de mudanças importantes
- **Retenção**: 7 dias (diário), 4 semanas (semanal), 6 meses (mensal)
- **Uso**: Restauração rápida, rollback de sistema

### 2. Backup Externo (Send/Receive)
- **Frequência**: Semanal ou após mudanças significativas
- **Destino**: HD externo, NAS, ou servidor remoto
- **Uso**: Recuperação de desastres, migração de sistema

### 3. Backup de Configurações (Git + Stow)
- **Frequência**: Após cada alteração
- **Destino**: Repositório Git (GitHub, GitLab)
- **Uso**: Sincronização entre máquinas, versionamento de dotfiles

## Recuperação e Restauração

### Restauração de Snapshot Local

```bash
# Listar snapshots disponíveis
sudo snapper -c root list

# Comparar dois snapshots
sudo snapper -c root status 1..2

# Restaurar diferenças entre snapshots
sudo snapper -c root undochange 1..2

# Rollback completo para snapshot específico
sudo snapper -c root rollback 5
```

### Restauração de Backup Externo

```bash
# Montar drive de backup
sudo mount /dev/sdX /mnt/backup

# Restaurar snapshot específico
sudo btrfs send /mnt/backup/snapshot | sudo btrfs receive /

# Configurar boot para usar snapshot restaurado
# (requer configuração específica do bootloader)
```

## Monitoramento e Manutenção

### Verificação Regular do Sistema

```bash
# Script de verificação mensal
#!/bin/bash
echo "=== Relatório de Snapshots ==="
sudo snapper -c root list

echo "=== Uso de Espaço Btrfs ==="
sudo btrfs filesystem usage /

echo "=== Verificação de Integridade ==="
sudo btrfs scrub start /
sudo btrfs scrub status /
```

### Alertas de Espaço

```bash
# Verificar se há espaço suficiente (incluir em cron)
#!/bin/bash
USED=$(sudo btrfs filesystem usage / | grep "Used:" | awk '{print $2}' | sed 's/GiB//')
if (( ${USED%.*} > 80 )); then
    echo "AVISO: Sistema de arquivos usando mais de 80% (${USED}GB)"
    # Enviar notificação ou email
fi
```

## Bônus: Integração com GNU Stow

### O que é GNU Stow?
GNU Stow é uma ferramenta que gerencia links simbólicos, ideal para organizar dotfiles e configurações em um repositório Git mantendo-os em seus locais originais.

### Configuração Básica do Stow

```bash
# Instalar Stow
sudo pacman -S stow

# Criar estrutura de dotfiles
mkdir -p ~/dotfiles
cd ~/dotfiles

# Exemplo de estrutura:
# dotfiles/
# ├── zsh/
# │   └── .zshrc
# ├── hyprland/
# │   └── .config/hypr/hyprland.conf
# └── nvim/
#     └── .config/nvim/init.lua
```

### Organizando Configurações

```bash
# Mover configurações para dotfiles
mkdir -p ~/dotfiles/hyprland/.config/hypr
mv ~/.config/hypr/* ~/dotfiles/hyprland/.config/hypr/

# Criar links simbólicos
cd ~/dotfiles
stow hyprland

# Verificar se links foram criados
ls -la ~/.config/hypr
```

### Workflow com Git

```bash
# Inicializar repositório
cd ~/dotfiles
git init
git add .
git commit -m "Configurações iniciais"

# Conectar ao repositório remoto
git remote add origin https://github.com/seu-usuario/dotfiles.git
git push -u origin main
```

### Automatização com Stow

```bash
#!/bin/bash
# ~/.local/bin/dotfiles-sync

cd ~/dotfiles

# Remover links existentes
stow -D */

# Recriar todos os links
for dir in */; do
    echo "Aplicando configurações: $dir"
    stow "$dir"
done

echo "Dotfiles sincronizados!"
```

### Integração Stow + Btrfs

Combine ambas as estratégias para proteção máxima:

1. **Stow**: Versiona e sincroniza dotfiles pessoais
2. **Btrfs**: Protege sistema completo, incluindo pacotes e configurações de sistema

```bash
# Script combinado de backup
#!/bin/bash
echo "=== Backup de Dotfiles (Git) ==="
cd ~/dotfiles
git add .
git commit -m "Backup automático - $(date)"
git push

echo "=== Snapshot do Sistema (Btrfs) ==="
sudo snapper -c root create --description "Backup completo - $(date '+%Y-%m-%d')"

echo "=== Backup completo finalizado ==="
```

## Conclusão

Este sistema de backup multicamadas oferece:
- **Proteção imediata**: Snapshots automáticos para rollback rápido
- **Recuperação de desastres**: Backups externos para falhas de hardware
- **Sincronização**: Dotfiles versionados para replicação entre máquinas
- **Automação**: Scripts que funcionam sem intervenção manual

Mantenha esse sistema atualizado e teste regularmente os procedimentos de restauração. Um backup que não foi testado não é um backup confiável.
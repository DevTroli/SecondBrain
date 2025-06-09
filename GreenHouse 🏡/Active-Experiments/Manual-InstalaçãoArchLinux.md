# Instalação Manual do Arch Linux com Btrfs
Este guia resume os passos essenciais para instalar manualmente o Arch Linux utilizando o sistema de arquivos Btrfs, permitindo o uso de snapshots para facilitar backups e recuperação do sistema. Também inclui soluções para problemas comuns que podem surgir durante a instalação.

## 1. Preparação Inicial

1. **Baixe a ISO do Arch Linux** do site oficial e crie um pendrive bootável
2. **Inicie pelo pendrive** e aguarde até chegar ao prompt de comando
3. **Verifique a conexão de rede**:
   ```bash
   ip link
   ping -c3 archlinux.org
   ```
4. **Para Wi-Fi** use o utilitário `iwctl`:
   ```bash
   iwctl
   device list
   station wlan0 scan
   station wlan0 get-networks
   station wlan0 connect NOME_DA_REDE
   exit
   ```
5. **Verifique o modo de boot** (UEFI ou Legacy):
   ```bash
   ls /sys/firmware/efi/efivars
   ```
   Se o comando mostrar conteúdo, você está em modo UEFI

## 2. Particionamento de Disco

1. **Identifique seu disco**:
   ```bash
   lsblk
   ```

2. **Crie as partições** (exemplo usando `cfdisk` com disco `/dev/nvme0n1`):
   ```bash
   cfdisk /dev/nvme0n1
   ```

   Para sistema UEFI, crie:
   - Partição EFI: 512 MiB, tipo "EFI System"
   - Partição raiz: resto do espaço, tipo "Linux filesystem"

   Para sistema Legacy/BIOS:
   - Partição boot: 512 MiB, tipo "Linux boot" (opcional)
   - Partição raiz: resto do espaço, tipo "Linux filesystem"

3. **Formate as partições**:
   ```bash
   # Partição EFI (no exemplo, nvme0n1p1)
   mkfs.fat -F32 /dev/nvme0n1p1
   
   # Partição raiz com Btrfs (no exemplo, nvme0n1p2)
   mkfs.btrfs /dev/nvme0n1p2
   ```

4. **Monte a partição raiz e crie subvolumes Btrfs**:
   ```bash
   # Monte a partição raiz
   mount /dev/nvme0n1p2 /mnt
   
   # Crie subvolumes Btrfs para facilitar snapshots
   btrfs subvolume create /mnt/@
   btrfs subvolume create /mnt/@home
   btrfs subvolume create /mnt/@var
   btrfs subvolume create /mnt/@snapshots
   
   # Desmonte para remontar com subvolumes
   umount /mnt
   ```

5. **Monte os subvolumes**:
   ```bash
   # Monte o subvolume raiz (@)
   mount -o noatime,compress=zstd,space_cache=v2,subvol=@ /dev/nvme0n1p2 /mnt
   
   # Crie diretórios para pontos de montagem
   mkdir -p /mnt/{boot,home,var,.snapshots}
   
   # Monte os outros subvolumes
   mount -o noatime,compress=zstd,space_cache=v2,subvol=@home /dev/nvme0n1p2 /mnt/home
   mount -o noatime,compress=zstd,space_cache=v2,subvol=@var /dev/nvme0n1p2 /mnt/var
   mount -o noatime,compress=zstd,space_cache=v2,subvol=@snapshots /dev/nvme0n1p2 /mnt/.snapshots
   
   # Monte a partição EFI
   mount /dev/nvme0n1p1 /mnt/boot
   ```

## 3. Instalação do Sistema Base

1. **Instale os pacotes base** e suporte para Btrfs:
   ```bash
   pacstrap /mnt base linux linux-firmware btrfs-progs
   ```

2. **Adicione utilitários essenciais**:
   ```bash
   pacstrap /mnt base-devel vim sudo networkmanager
   ```

3. **Gere o arquivo fstab**:
   ```bash
   genfstab -U /mnt >> /mnt/etc/fstab
   ```

## 4. Configuração do Sistema

1. **Entre no sistema com chroot**:
   ```bash
   arch-chroot /mnt
   ```

2. **Configure o fuso horário**:
   ```bash
   ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
   hwclock --systohc
   ```

3. **Configure o idioma**:
   ```bash
   # Edite o arquivo locale.gen
   vim /etc/locale.gen
   
   # Descomente pt_BR.UTF-8 UTF-8
   # Depois gere os locales
   locale-gen
   
   # Defina o idioma padrão
   echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
   ```

4. **Configure o teclado** (se necessário):
   ```bash
   echo "KEYMAP=br-abnt2" > /etc/vconsole.conf
   ```

5. **Configure o nome do computador**:
   ```bash
   echo "meucomputador" > /etc/hostname
   
   # Edite o arquivo hosts
   vim /etc/hosts
   ```
   Adicione:
   ```
   127.0.0.1    localhost
   ::1          localhost
   127.0.1.1    meucomputador.localdomain    meucomputador
   ```

6. **Configure a rede**:
   ```bash
   systemctl enable NetworkManager
   ```

7. **Configure senha do root**:
   ```bash
   passwd
   ```

8. **Crie um usuário**:
   ```bash
   useradd -mG wheel meuusuario
   passwd meuusuario
   
   # Configure sudo
   EDITOR=vim visudo
   # Descomente a linha %wheel ALL=(ALL) ALL
   ```

## 5. Configure o Bootloader

### Para GRUB (UEFI):

```bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

### Para systemd-boot (UEFI, mais leve):

```bash
bootctl install

# Crie entrada para o Arch Linux
vim /boot/loader/entries/arch.conf
```

Adicione:
```
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/nvme0n1p2) rw rootflags=subvol=@
```

## 6. Pacotes Adicionais para Snapshots

Instale o Snapper para gerenciar snapshots Btrfs:

```bash
pacman -S snapper
```

## 7. Finalização

1. **Saia do chroot**:
   ```bash
   exit
   ```

2. **Desmonte partições**:
   ```bash
   umount -R /mnt
   ```

3. **Reinicie**:
   ```bash
   reboot
   ```

## 8. Configuração Pós-instalação

Após reiniciar e fazer login, configure o Snapper:

```bash
# Crie configuração para root
sudo snapper -c root create-config /

# Crie configuração para home (opcional)
sudo snapper -c home create-config /home

# Crie seu primeiro snapshot
sudo snapper -c root create --description "Sistema recém-instalado"
```

## Dicas para Btrfs

- Use `btrfs filesystem df /` para ver o uso de espaço
- Use `snapper list` para listar snapshots
- Use `snapper -c root create --description "Antes da atualização"` antes de atualizações importantes
- Para restaurar um snapshot, é necessário iniciar pelo pendrive do Arch e montar o sistema

## 9. Solução de Problemas Comuns

Durante a instalação manual do Arch Linux, você pode encontrar diversos obstáculos. Esta seção aborda como resolver problemas comuns, especialmente aqueles relacionados ao sistema de pacotes e verificação de assinaturas.

### Problemas com Assinaturas PGP e Instalação de Pacotes

Se você receber erros como:
```
error: failed to commit transactions (invalid or corrupted package)
ERROR: Failed to install packages to new root
signature from [Mantenedor] is unknown trust
invalid or corrupted package (PGP signature)
```

Siga este procedimento de resolução:

1. **Verifique data e hora do sistema**:
   ```bash
   date
   timedatectl set-ntp true
   # Aguarde alguns segundos para sincronização
   date
   ```
   Uma data/hora incorreta pode invalidar assinaturas PGP.

2. **Reinicialize o sistema de chaves PGP**:
   ```bash
   # Remova o keyring atual
   rm -rf /etc/pacman.d/gnupg
   
   # Inicialize um novo keyring
   pacman-key --init
   
   # Aguarde a inicialização completa
   sleep 10
   
   # Popule o keyring com as chaves do Arch
   pacman-key --populate archlinux
   ```

3. **Atualize a lista de mirrors**:
   ```bash
   # Instale o reflector
   pacman -Sy reflector
   
   # Selecione os mirrors mais rápidos 
   reflector --country Brazil,United States --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
   ```
   Substitua pelos países geograficamente mais próximos de você.

4. **Modifique temporariamente a configuração do pacman**:
   ```bash
   # Edite o arquivo de configuração do pacman
   nano /etc/pacman.conf
   ```
   Encontre a linha com `SigLevel = Required DatabaseOptional` e mude para:
   ```
   SigLevel = Never
   ```
   Salve o arquivo (Ctrl+O, Enter, Ctrl+X).

5. **Sincronize repositórios e limpe o cache**:
   ```bash
   pacman -Syy
   rm -rf /var/cache/pacman/pkg/*
   ```

6. **Tente a instalação com opções alternativas**:
   ```bash
   # Tente com o parâmetro -K para ignorar verificação de chaves
   pacstrap -K /mnt base linux linux-firmware btrfs-progs
   
   # Ou tente com modo interativo e apenas o pacote base
   pacstrap -i /mnt base
   ```

7. **Se o problema persistir, tente a abordagem com pacman direto**:
   ```bash
   # Monte os diretórios necessários para chroot
   mkdir -p /mnt/{dev,proc,sys}
   mount --bind /dev /mnt/dev
   mount --bind /proc /mnt/proc
   mount --bind /sys /mnt/sys
   
   # Copie a resolução DNS
   mkdir -p /mnt/etc/
   cp /etc/resolv.conf /mnt/etc/
   
   # Use pacman diretamente com o root nesse diretório
   pacman --root /mnt --config /etc/pacman.conf -Sy base linux-lts linux-firmware btrfs-progs
   ```

### Outros Problemas Comuns

1. **Erro ao montar partições**:
   - Verifique se você formatou corretamente as partições
   - Confirme que os nomes dos dispositivos estão corretos (`lsblk`)

2. **Problemas com conexão Wi-Fi**:
   - Se `iwctl` não funcionar, tente: `wifi-menu` (se disponível) ou `wpa_supplicant`

3. **Sistema não inicia após instalação**:
   - Verifique se instalou o pacote do microcode correto (`intel-ucode` ou `amd-ucode`)
   - Confirme que o bootloader foi instalado corretamente
   - Verifique se os parâmetros na configuração do bootloader estão corretos (como UUIDs)

4. **Erros ao executar** `genfstab`:
   - Certifique-se de que todas as partições estão montadas corretamente
   - Tente usar `-U` (UUIDs) em vez de `-L` (labels) ou vice-versa

5. **Problemas com o ambiente live**:
   - Se a ISO estiver corrompida ou muito desatualizada, baixe uma nova
   - Tente uma mídia de instalação diferente (pendrive diferente, gravação mais lenta)

Lembre-se que enfrentar e resolver esses obstáculos é parte do processo de aprendizagem da "Arch Way". Cada problema resolvido aumenta sua compreensão e domínio sobre o sistema.
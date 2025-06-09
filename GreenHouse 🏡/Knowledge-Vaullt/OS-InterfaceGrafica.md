# Instalação dos Ambientes Gráficos Hyprland e AwesomeWM no Arch Linux

Vou explicar como instalar e configurar tanto o Hyprland (um compositor Wayland moderno) quanto o AwesomeWM (um gerenciador de janelas para X11), permitindo alternar entre eles conforme sua preferência. Esta explicação assume que você está trabalhando a partir de uma instalação base do Arch Linux com NetworkManager já configurado e funcionando.

## Preparando o Sistema

Antes de instalar os ambientes gráficos, precisamos garantir que seu sistema tenha os componentes básicos necessários:

```bash
# Atualize o sistema
sudo pacman -Syu

# Instale os pacotes básicos para ambiente gráfico
sudo pacman -S xorg xorg-server xorg-xinit mesa

# Instale drivers de vídeo conforme sua GPU
# Para Intel:
sudo pacman -S xf86-video-intel intel-media-driver libva-intel-driver

# Para AMD:
sudo pacman -S xf86-video-amdgpu vulkan-radeon libva-mesa-driver mesa-vdpau

# Para NVIDIA:
sudo pacman -S nvidia nvidia-utils nvidia-settings
```

## Instalando um Display Manager

Um display manager permitirá escolher entre os dois ambientes na tela de login:

```bash
# Instale o SDDM (funciona bem tanto com X11 quanto com Wayland)
sudo pacman -S sddm

# Habilite o serviço do SDDM
sudo systemctl enable sddm.service
```

## Instalando o AwesomeWM

Vamos começar com o AwesomeWM, que é um gerenciador de janelas leve e altamente configurável para o X11:

```bash
# Instale o AwesomeWM e pacotes complementares
sudo pacman -S awesome vicious rofi picom feh alacritty thunar firefox pavucontrol pulseaudio

# Pacotes adicionais úteis
sudo pacman -S lxappearance arc-gtk-theme papirus-icon-theme network-manager-applet

# Ferramentas de desenvolvimento para configuração
sudo pacman -S git base-devel
```

### Configurando o AwesomeWM

O AwesomeWM precisa de um arquivo de configuração para funcionar adequadamente:

```bash
# Crie o diretório de configuração
mkdir -p ~/.config/awesome

# Copie o arquivo de configuração padrão
cp /etc/xdg/awesome/rc.lua ~/.config/awesome/
```

## Instalando o Hyprland

O Hyprland é um compositor Wayland mais recente, focado em animações e efeitos visuais suaves com uma experiência de tiling window manager:

```bash
# Adicione o repositório do Hyprland (ele está no AUR, então vamos usar o yay)
# Primeiro, instale o yay:
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Agora, instale o Hyprland e pacotes relacionados
yay -S hyprland-git waybar-hyprland-git xdg-desktop-portal-hyprland-git

# Instale utilitários para o ambiente Wayland
sudo pacman -S kitty wofi wl-clipboard grim slurp swappy polkit-kde-agent
```

### Configurando o Hyprland

Vamos criar uma configuração básica para o Hyprland:

```bash
# Crie o diretório de configuração
mkdir -p ~/.config/hypr

# Crie o arquivo de configuração principal
vim ~/.config/hypr/hyprland.conf
```

Adicione o seguinte conteúdo básico ao arquivo:

```
# Configuração do Monitor
monitor=,preferred,auto,1

# Iniciar programas automáticos
exec-once = waybar & hyprpaper & firefox

# Configuração de entrada
input {
    kb_layout = us,br
    follow_mouse = 1
    sensitivity = 0
}

# Aparência
general {
    gaps_in = 5
    gaps_out = 10
    border_size = 2
    col.active_border = rgba(33ccffee)
    col.inactive_border = rgba(595959aa)
    layout = dwindle
}

# Decorações
decoration {
    rounding = 10
    blur = yes
    blur_size = 3
    blur_passes = 1
}

# Animações
animations {
    enabled = yes
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = fade, 1, 7, default
}

# Layouts
dwindle {
    pseudotile = yes
    preserve_split = yes
}

# Regras de janelas
windowrule = float, ^(pavucontrol)$
windowrule = float, ^(blueman-manager)$

# Atalhos de teclado
$mod = SUPER

bind = $mod, Return, exec, kitty
bind = $mod, Q, killactive, 
bind = $mod, M, exit, 
bind = $mod, E, exec, thunar
bind = $mod, V, togglefloating, 
bind = $mod, R, exec, wofi --show run
bind = $mod, P, pseudo, # dwindle
bind = $mod, J, togglesplit, # dwindle

# Move focus
bind = $mod, left, movefocus, l
bind = $mod, right, movefocus, r
bind = $mod, up, movefocus, u
bind = $mod, down, movefocus, d

# Move windows
bind = $mod SHIFT, left, movewindow, l
bind = $mod SHIFT, right, movewindow, r
bind = $mod SHIFT, up, movewindow, u
bind = $mod SHIFT, down, movewindow, d

# Workspaces
bind = $mod, 1, workspace, 1
bind = $mod, 2, workspace, 2
bind = $mod, 3, workspace, 3
bind = $mod, 4, workspace, 4
bind = $mod, 5, workspace, 5
bind = $mod, 6, workspace, 6
bind = $mod, 7, workspace, 7
bind = $mod, 8, workspace, 8
bind = $mod, 9, workspace, 9
bind = $mod, 0, workspace, 10

# Move to workspace
bind = $mod SHIFT, 1, movetoworkspace, 1
bind = $mod SHIFT, 2, movetoworkspace, 2
bind = $mod SHIFT, 3, movetoworkspace, 3
bind = $mod SHIFT, 4, movetoworkspace, 4
bind = $mod SHIFT, 5, movetoworkspace, 5
bind = $mod SHIFT, 6, movetoworkspace, 6
bind = $mod SHIFT, 7, movetoworkspace, 7
bind = $mod SHIFT, 8, movetoworkspace, 8
bind = $mod SHIFT, 9, movetoworkspace, 9
bind = $mod SHIFT, 0, movetoworkspace, 10
```

## Configurando o Display Manager para os Dois Ambientes

Agora vamos configurar o SDDM para que você possa escolher entre Hyprland e AwesomeWM na tela de login:

### Para o AwesomeWM

Crie um arquivo de entrada no X11:

```bash
sudo nano /usr/share/xsessions/awesome.desktop
```

Adicione o seguinte conteúdo:

```
[Desktop Entry]
Name=Awesome
Comment=Highly configurable framework window manager
Exec=awesome
TryExec=awesome
Type=Application
X-LightDM-DesktopName=Awesome
DesktopNames=Awesome
```

### Para o Hyprland

Crie um arquivo de entrada para o Wayland:

```bash
sudo nano /usr/share/wayland-sessions/hyprland.desktop
```

Adicione o seguinte conteúdo:

```
[Desktop Entry]
Name=Hyprland
Comment=An experimental Wayland compositor
Exec=Hyprland
Type=Application
```

## Instalando Temas e Personalizações

Para melhorar a aparência de ambos os ambientes:

```bash
# Fontes adicionais
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts ttf-roboto ttf-opensans ttf-hack ttf-fira-code ttf-jetbrains-mono

# GTK e Qt
sudo pacman -S qt5ct kvantum-qt5 kvantum-theme-materia materia-gtk-theme
```

## Reiniciando e Usando os Ambientes

Após todas essas instalações e configurações, reinicie seu sistema:

```bash
sudo reboot
```

Quando o sistema iniciar, você verá a tela de login do SDDM. No canto inferior esquerdo, haverá um botão para selecionar a sessão. Clique nele para alternar entre Hyprland e AwesomeWM.

## Personalização Adicional do AwesomeWM

O AwesomeWM vem com uma configuração básica, mas você pode personalizá-lo muito mais:

1. Instale alguns temas populares:

```bash
git clone https://github.com/lcpz/awesome-copycats.git ~/.config/awesome/themes
cp -r ~/.config/awesome/themes/themes/* ~/.config/awesome/themes/
```

2. Modifique o arquivo de configuração principal para usar um tema:

```bash
nano ~/.config/awesome/rc.lua
```

Na parte inicial do arquivo, procure a linha que define o tema e mude para um dos temas disponíveis, como:

```lua
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
```

Para:

```lua
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/powerarrow/theme.lua")
```

## Personalização Adicional do Hyprland

Para o Hyprland, você pode personalizar a barra superior (waybar):

```bash
mkdir -p ~/.config/waybar
cp /etc/xdg/waybar/config ~/.config/waybar/
cp /etc/xdg/waybar/style.css ~/.config/waybar/
```

Edite os arquivos de configuração para personalizar a aparência:

```bash
nano ~/.config/waybar/config
nano ~/.config/waybar/style.css
```

## Dicas para Uso Diário

### Atalhos de Teclado no AwesomeWM
- Mod4 (tecla Window) + Enter: Abre o terminal
- Mod4 + r: Executa comandos
- Mod4 + Shift + c: Fecha a janela atual
- Mod4 + Espaço: Alterna entre layouts
- Mod4 + j/k: Navega entre janelas
- Mod4 + 1-9: Muda para o workspace correspondente

### Atalhos de Teclado no Hyprland
- Super (tecla Windows) + Enter: Abre o terminal
- Super + C: Fecha a janela atual
- Super + space: Abre o lançador de aplicativos
- Super + Setas: Move o foco entre janelas
- Super + 1-0: Muda para o workspace correspondente

## Solução de Problemas

### Se o AwesomeWM não iniciar corretamente
Verifique os logs:
```bash
cat ~/.xsession-errors
```

### Se o Hyprland apresentar problemas
Verifique os logs:
```bash
cat ~/.local/share/hyprland/hyprland.log
```

### Problemas com drivers de vídeo
Certifique-se de ter instalado os drivers corretos para sua GPU:
```bash
lspci | grep -e VGA -e 3D
```

Essa instalação fornecerá dois ambientes desktop completamente diferentes: o AwesomeWM, um gerenciador de janelas leve baseado em X11 com foco em produtividade e personalização via Lua, e o Hyprland.
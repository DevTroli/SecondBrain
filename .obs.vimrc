 " .obsidian.vimrc
"
" A small .vimrc for Obsidian vim bindings
"
" To enable this file, you must install the Vimrc Support plugin for Obsidian:
" https://github.com/esm7/obsidian-vimrc-support
"_________________________________________________________________________

" ; (semicolon) - same as : (colon)
" Permite usar o ponto e vírgula (;) como atalho para abrir o modo de comando,
" equivalente ao uso de dois pontos (:).
"
nmap ; :

" (space) - same as : (colon)
" Permite usar a barra de espaço como atalho para abrir o modo de comando.
nmap <SPACE> :

" j and k navigate visual lines rather than logical ones
" Isso mapeia as teclas j e k para navegar pelas linhas visuais em vez das linhas lógicas,
" o que é útil em textos que ocupam mais de uma linha na exibição.
nmap j gj
nmap k gk

" Yank to system clipboard
" Configura o yank para usar o clipboard do sistema, facilitando copiar e colar fora do Obsidian.
set clipboard=unnamed



set shell=/bin/zsh
set encoding=utf-8

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'roman/golden-ratio'
Plug 'bling/vim-airline'
Plug 'matze/vim-move'
call plug#end()

" General Configuration
set nocompatible
syntax on "syntax
filetype on "load filetype-specific indent files
filetype plugin on
filetype indent on
set antialias
set nu
set cursorline
set visualbell "No Beeping
set hidden 
"set showcmd "Display commands
"set showmode "Display the mode
set wildmenu "display commandline autocompletion 
set showmatch "highlight matching [{()}]
"colorscheme anotherdark 
colorscheme seoul256
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set colorcolumn=80
set nowrap

" window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" move to beggining of the line
nnoremap B 0 
" move to end of the line
nnoremap E $

"NerdTree
"autocmd vimenter * if !argc() | NERDTree | endif
map <C-\> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
let g:NERDTreeWinPos = "right"

"GitGutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '*-'

" ctrlp config
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|\.(o|swp|pyc|egg)$'

"set omnifunc=syntaxcomplete#Complete
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
"setlocal foldmethod=marker foldmarker=start,end   "foldlevel=99
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja "jinja config
"Jedi Config
autocmd FileType python setlocal completeopt-=preview

" Navigation on insert mode
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

" Autocomplete
"au FileType python set omnifunc=pythoncomplete#Complete
"au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"au FileType html set omnifunc=htmlcomplete#CompleteTags
"au FileType css set omnifunc=csscomplete#CompleteCSS
" ruby Autocomplete
autocmd FileType eruby,ruby set omnifunc=rubycomplete#Complete
autocmd FileType eruby,ruby let g:rubycomplete_buffer_loading = 1
autocmd FileType eruby,ruby let g:rubycomplete_rails = 1 
autocmd FileType eruby,ruby let g:rubycomplete_classes_in_global = 1
" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" insert end
imap <S-CR> <CR><CR>end<Esc>-cc


if !has('gui_running')
    set t_Co=256
endif

"let g:lightline = {
"      \ 'colorscheme': 'Tomorrow',
"      \ 'component': {
"      \   'readonly': '%{&readonly?"Read Only":""}',
"      \ },
"      \ 'separator': { 'left': '','right': '' },
"     \ 'subseparator': { 'left': '|', 'right': '|' }
"     \ }
" Ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

" Easy Motion
let g:EasyMotion_leader_key = '<Leader>'

if exists('$TMUX') " allows cursor change in tmux mode
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" airline config
set laststatus=2
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

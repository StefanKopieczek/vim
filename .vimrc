" Set up the Pathogen bundle manager.
let g:pathogen_disabled = ['vim-go']
call pathogen#infect()
call pathogen#helptags()

" Color scheme
color molokai
:set t_Co=256

" Map ; to : to save the poor shift key.
nmap ; :

filetype on
filetype plugin on
filetype indent on

" Tweaks for coding.
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Apparently necessary to make go-vim work.
syntax enable
filetype plugin on

" Don't expand tabs for makefiles.
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Strip trailing whitespace
fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
    endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType markdown let b:noStripWhitespace=1
autocmd FileType asm set ft=nasm

" Show line numbers, with a black background.
set number
highlight LineNr ctermfg=white ctermbg=bg guifg=white guibg=bg

" Fugitive status line
set laststatus=2
set statusline=%1*%{fugitive#statusline()}%*%=%2*%-20.(Column\ %c%)%*
"hi StatusLine ctermfg=bg guifg=bg
"hi User1 ctermfg=green guifg=green
"hi User2 ctermfg=white guifg=green

" ---- Airline config
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" END airline config ---- "

" Syntastic config
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args ='--ignore="E501,E221,E241,E251"'
set <F12>=<C-v><F12>
map <F12> :SyntasticToggleMode<CR>

" Ctrl-p key remap
let g:ctrlp_map = '<c-p>'
nnoremap <leader>. :CtrlPTag<cr>

" ---- Buffer stuff:
set hidden
nmap <leader>t :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
" END buffer stuff ----"

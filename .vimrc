" Set up the Pathogen bundle manager.
call pathogen#infect()
call pathogen#helptags()

" Map ; to : to save the poor shift key.
nmap ; :

" Tweaks for coding.
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Fugitive status line
set laststatus=2
set statusline=%{fugitive#statusline()}
hi StatusLine ctermfg=black ctermbg=green

" Syntastic config
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8']

" Ctrl-p key remap
let g:ctrlp_map = '<c-p>'

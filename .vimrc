" Set up the Pathogen bundle manager.
call pathogen#infect()
call pathogen#helptags()

" Color scheme
color molokai
:set t_Co=256

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

" Show line numbers, with a black background.
set number
highlight LineNr ctermfg=white ctermbg=bg guifg=white guibg=bg

" Fugitive status line
set laststatus=2
set statusline=%{fugitive#statusline()}
hi StatusLine ctermfg=black ctermbg=green guifg=black guibg=green

" Syntastic config
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8']

" Ctrl-p key remap
let g:ctrlp_map = '<c-p>'

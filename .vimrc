" Set up the Pathogen bundle manager.
call pathogen#infect()
call pathogen#helptags()

" Tweaks for coding.
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Fugitive status line
set laststatus=2
set statusline=%{fugitive#statusline()}
hi StatusLine ctermfg=black ctermbg=green

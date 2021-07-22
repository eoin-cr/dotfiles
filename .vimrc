" Plugins
nnoremap <F5> :GundoToggle<CR>
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
" Plug 'sjl/badwolf'
call plug#end()

if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" Remapping keys to move around windows
" nnoremap <C-H> <C-W>h
" nnoremap <C-J> <C-W>n
" nnoremap <C-K> <C-W>e
" nnoremap <C-L> <C-W>i

" Map Colemak keys in alphabetical order.
noremap d g
noremap e k
noremap f e
noremap g t
noremap i l
noremap j y
noremap k n
noremap l u
noremap n j
noremap o p
noremap p r
noremap r s
noremap s d
noremap t f
noremap u i
noremap y o
noremap D G
noremap E K
noremap F E
noremap G T
noremap I L
noremap J Y
noremap K N
noremap L U
noremap N J
noremap O P
noremap P R
noremap R S
noremap S D
noremap T F
noremap U I
noremap Y O

:set expandtab
:set tabstop=4
:retab
:set shiftwidth=4

map <F6> :setlocal spell! spelllang=en_gb<CR>

set autoindent

set number
set relativenumber

" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" colourscheme
colorscheme badwolf

syntax enable

set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"folding is basically like in other IDEs where you can close all the lines in a function to make a 
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default

" space open/closes folds
nnoremap <space> za

set foldmethod=indent   " fold based on indent level

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" nnoremap gV `[v`]

let mapleader=","       " leader is comma

"km  is escape
inoremap km <esc>

" autogroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" setting backup folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Statusline

" :h mode() to see all modes
"let g:currentmode={
"    \ 'n'      : 'N ',
"    \ 'no'     : 'N·Operator Pending ',
"    \ 'v'      : 'V ',
"    \ 'V'      : 'V·Line ',
"    \ '\<C-V>' : 'V·Block ',
"    \ 's'      : 'Select ',
"    \ 'S'      : 'S·Line ',
"    \ '\<C-S>' : 'S·Block ',
"    \ 'i'      : 'I ',
"    \ 'R'      : 'R ',
"    \ 'Rv'     : 'V·Replace ',
"    \ 'c'      : 'Command ',
"    \ 'cv'     : 'Vim Ex ',
"    \ 'ce'     : 'Ex ',
"    \ 'r'      : 'Prompt ',
"    \ 'rm'     : 'More ',
"    \ 'r?'     : 'Confirm ',
"    \ '!'      : 'Shell ',
"    \ 't'      : 'Terminal '
"    \}
"
"" Automatically change the statusline color depending on mode
"function! ChangeStatuslineColor()
"  if (mode() =~# '\v(n|no)')
"    exe 'hi! StatusLine ctermfg=008'
"  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
"    exe 'hi! StatusLine ctermfg=005'
"  elseif (mode() ==# 'i')
"    exe 'hi! StatusLine ctermfg=004'
"  else
"    exe 'hi! StatusLine ctermfg=006'
"  endif
"
"  return ''
"endfunction
"
"" Find out current buffer's size and output it.
"function! FileSize()
"  let bytes = getfsize(expand('%:p'))
"  if (bytes >= 1024)
"    let kbytes = bytes / 1024
"  endif
"  if (exists('kbytes') && kbytes >= 1000)
"    let mbytes = kbytes / 1000
"  endif
"
"  if bytes <= 0
"    return '0'
"  endif
"
"  if (exists('mbytes'))
"    return mbytes . 'MB '
"  elseif (exists('kbytes'))
"    return kbytes . 'KB '
"  else
"    return bytes . 'B '
"  endif
"endfunction
"
"function! ReadOnly()
"  if &readonly || !&modifiable
"    return ''
"  else
"    return ''
"endfunction
"
"function! GitInfo()
"  let git = fugitive#head()
"  if git != ''
"    return ' '.fugitive#head()
"  else
"    return ''
"endfunction
"
"set laststatus=2
"set statusline=
"set statusline.=%{ChangeStatuslineColor()}               " Changing the statusline color
"set statusline.=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
"set statusline.=%8*\ [%n]                                " buffernr
"set statusline.=%8*\ %{GitInfo()}                        " Git Branch name: requires https://github.com/tpope/vim-fugitive
"set statusline.=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
"set statusline.=%*
"set statusline.=%9*\ %=                                  " Space
"set statusline.=%8*\ %y\                                 " FileType
"set statusline.=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
"set statusline.=%8*\ %-3(%{FileSize()}%)                 " File size
"set statusline.=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
"
"hi User1 ctermfg=007
"hi User2 ctermfg=008
"hi User3 ctermfg=008
"hi User4 ctermfg=008
"hi User5 ctermfg=008
"hi User7 ctermfg=008
"hi User8 ctermfg=008
"hi User9 ctermfg=007
"

" Running python files in vim with F9
map <F9> :w !python<CR>                                                                                    

" Emmet shortcuts
let g:user_emmet_leader_key=','

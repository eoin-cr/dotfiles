call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'skywind3000/asyncrun.vim'
call plug#end()

" Adding template every time a c file is created
autocmd BufNewFile *.c 0r /$HOME/.config/nvim/template.c

" Adding template every time a bash file is created
autocmd BufNewFile *.sh 0r /$HOME/.config/nvim/template.txt

" LaTeX config
nnoremap <Leader>cv :AsyncRun latexmk -pvc -pdf %<CR>

autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a zathura'


" ale
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': [], 'python': ['black', 'isort']}

" coc completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Plugins
nnoremap <F5> :GundoToggle<CR>
" call plug#begin()
" Plug 'tpope/vim-surround'
" Plug 'mattn/emmet-vim'
" Plug 'ap/vim-css-color'
" Plug 'sjl/badwolf'
" call plug#end()

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
noremap ; p
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
" colorscheme badwolf

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
nnoremap n gj
nnoremap e gk

" nnoremap gV `[v`]

let mapleader=","       " leader is comma

"km  is escape
inoremap km <esc>

" autogroups
" augroup configgroup
"     autocmd!
"     autocmd VimEnter * highlight clear SignColumn
"     autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
"                 \:call <SID>StripTrailingWhitespaces()
"     autocmd FileType java setlocal noexpandtab
"     autocmd FileType java setlocal list
"     autocmd FileType java setlocal listchars=tab:+\ ,eol:-
"     autocmd FileType java setlocal formatprg=par\ -w80\ -T4
"     autocmd FileType php setlocal expandtab
"     autocmd FileType php setlocal list
"     autocmd FileType php setlocal listchars=tab:+\ ,eol:-
"     autocmd FileType php setlocal formatprg=par\ -w80\ -T4
"     autocmd FileType ruby setlocal tabstop=2
"     autocmd FileType ruby setlocal shiftwidth=2
"     autocmd FileType ruby setlocal softtabstop=2
"     autocmd FileType ruby setlocal commentstring=#\ %s
"     autocmd FileType python setlocal commentstring=#\ %s
"     autocmd BufEnter *.cls setlocal filetype=java
"     autocmd BufEnter *.zsh-theme setlocal filetype=zsh
"     autocmd BufEnter Makefile setlocal noexpandtab
"     autocmd BufEnter *.sh setlocal tabstop=2
"     autocmd BufEnter *.sh setlocal shiftwidth=2
"     autocmd BufEnter *.sh setlocal softtabstop=2
" augroup END

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

" let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
set title
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" vimling:
	nm <leader><leader>d :call ToggleDeadKeys()<CR>
	imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader><leader>i :call ToggleIPA()<CR>
	imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader><leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff

	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

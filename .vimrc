" ___________________________________________________________________________ "
" ___________________________________________________________________________ "
" ___________________________________________________________________________ "
"  _             _  _  _        _                               __  _
" | |           (_)| || |      (_)                             / _|(_)
" | |__   _   _  _ | || |_  __  _  _ __     ___   ___   _ __  | |_  _   __ _
" | '_ \ | | | || || || __||__|| || '_ \   / __| / _ \ | '_ \ |  _|| | / _` |
" | |_) || |_| || || || |_     | || | | | | (__ | (_) || | | || |  | || (_| |
" |_.__/  \__,_||_||_| \__|    |_||_| |_|  \___| \___/ |_| |_||_|  |_| \__, |
"                                                                       __/ |
"                                                                      |___/
" ___________________________________________________________________________ "
" ___________________________________________________________________________ "
" ___________________________________________________________________________ "

" TODO
" f/t letters color

if has('win32')
	set fileformat=dos              " change end-of-line for windows files
endif

set termguicolors                 " Use gui color for terminal
set conceallevel=0                " manage conceal text
" set noequalalways               " do not resize all windows to equal size after closing/opening
" set eadirection                 " Tells when the 'equalalways' option applies
set splitright                    " new windows appeard right vsplit
set lazyredraw                   " don't draw screen while executing macro for speed

" set belloff                       " disable bell
set noerrorbells visualbell t_vb=

set spelllang=en                  " syntax check
setglobal helplang=en             " syntax check

set nostartofline                 " going below move the cursor tp the firrst non-blank line

set hls                           " highlight search

filetype plugin on
set path-=.

" set cmdheight=0

if has("nvim")
  " Pmenu transparancy
  " set pumblend=40
  hi PmenuSel blend=0
  set pumheight=3
endif

set completeopt=menuone,noselect  " completion menu
" set shortmess+=c                                             " Remove messages from in-completion menus

" ----------------- indent ---------------------------------------------------
" set smartindent                    " auto indent while editing
" set ai                              " acitve indentation objects

set softtabstop=4
set shiftwidth=2             " spaces per tab (when shifting)
set tabstop=4             " spaces per tab
" set smarttab         " <tab>/<BS> indent/dedent in leading whitespace
set autoindent          " maintain indent of current line
set indentexpr
" set noexpandtab        " don't expand tabs into spaces
set shiftround           " Round indent to multiple of 'shiftwidth'

set scrolloff=10                    " limit of line to scroll
set showtabline=2                   " always show tab number
set incsearch                       " Show search result while typing
"set inccommand=
set encoding=utf-8                  " encoding file
filetype plugin indent on           " Enable filetype detection for plugins and indentation options
set nocompatible
" set ignorecase                      " ingorecase when searching
set smartcase                      " ingorecase when searching
set path+=**                        " add previous directory for gf, :find, ..

" set diffopt+=indent-heuristica      " option for diffmmode
if has("nvim")
else
set wildmenu                        " activate completion menu
endif
set laststatus=2                    " activate always status bar


set showcmd                         " activate show command area below statusline
" set cmdheight=2                   " Better display for messages
set updatetime=100                  " Smaller updatetime for CursorHold & CursorHoldI
set mouse=a                         " enbable mouse functionnalities
set hidden                          " buffer are hidden when abandonned
set autoread                        " automatically reload files changed on disk
" set switchbuf=useopen               " quickfix reuses open windows
set switchbuf=usetab              " try to reuse windows/tabs when switching buffers

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif

set nobackup                        " don't make a backup before overwritting a file
" set paste
set noautoindent
set nowritebackup                   " don't make a backup before overwritting a file
set noswapfile                      " No swap files for unmodified buffers
set dir=/tmp                        " swap files to /tmp/
syntax on                           " activate syntax higlight

set virtualedit=onemore             " allow the cursor to go one char after end of line

" set relative numbers
set nu
set rnu

if has("nvim")
else
  set fillchars=vert:\|,fold:>,diff:-
endif
set suffixes+=.pyc,.pyo           " ignore compiled Python files
set suffixes+=.egg-info           " ignore compiled Python files
set suffixes+=.png                " don't edit .png files please
set wildignore+=*.pyc,*.pyo,*.pyd,*.so       " same as 'suffixes', but for tab completion
au BufEnter * set fo-=c fo-=r fo-=o " don't comment new line auto
set wildignore+=*/__pycache__/*   " compiled python files
set wildignore+=*/*.egg-info/*    " setuptools droppings
set wildignore+=*/.venv           " virtualenv
set wildignore+=*/local           " virtualenv

set undodir=~/.cache/undo   " backup directory location
set undolevels=10000                 " remember last 10000 changes

if has('nvim')
else
	set ttyfast                        " more smoothness, removed in neovim
endif

"  change mksession
set sessionoptions+=tabpages    " register tab
set sessionoptions-=blank       " dont't register blank pages

set backspace=indent,eol,start    " remove space in indent and end of line

" Show visual markers
set listchars=tab:>-,trail:·,extends:❯,precedes:❮,nbsp:␣,eol:↲
set list
set showbreak=↪\ \ \

"  autoformat options
set formatoptions-=o " dont inser comment leader when pressing <o> or <O>
set formatoptions+=n " recognize number list form formating
set formatoptions+=j " join comment when join lines
set formatoptions+=t " allow auto-wrap text
set formatoptions+=c " allow auto-wrap comment

if has('nvim')
  " builtin tool to filter quickfix entries
  " autocmd VimEnter packadd cfilter
  packadd cfilter
endif

if has('unix')
    " ---------------------------------------------------------------------- "
    "  ------ Unix config -------------------
    " ---------------------------------------------------------------------- "
    " Parent paths
    let g:dotfiles_path = $HOME
    let g:dotvim_path = $HOME . '/.vim'
    function! VimrcPath(path)                     " Get path relative to .vimrc file
    return g:dotfiles_path . '/.vim/' . a:path
    endfunction
    function! DotVimPath(path)                    " Get path relative to .vim directory
    return g:dotvim_path . '/' . a:path
    endfunction
    " Vimrc related paths for autocmds
    let g:vimrc_related_paths = [
    \ $MYVIMRC,
    \ VimrcPath('.vimrc'),
    \ VimrcPath('*.vim')
    \ ]
endif

if has('win32')
    " ---------------------------------------------------------------------- "
    "  ------ Windows config -------------------
    " ---------------------------------------------------------------------- "
    " Parent paths
    let g:dotfiles_path = $HOME
    let g:dotvim_path = $HOME . '\vimfiles'
    function! VimrcPath(path)                     " Get path relative to .vimrc file
        return g:dotfiles_path . '\vimfiles\' . a:path
    endfunction
    function! DotVimPath(path)                    " Get path relative to .vim directory
        return g:dotvim_path . '\' . a:path
    endfunction
    " Vimrc related paths for autocmds
    let g:vimrc_related_paths = [
    \ $MYVIMRC,
    \ VimrcPath('.vimrc'),
    \ VimrcPath('*vimfiles')
    \ ]
endif

" ---------------------------------------------------------------------------
" ----------------- C++ -----------------------------------------------------
" ---------------------------------------------------------------------------

" function! s:JbzCppMan()
"     let old_isk = &iskeyword
"     setl iskeyword+=:
"     let str = expand("<cword>")
"     let &l:iskeyword = old_isk
"     execute 'Man ' . str
" endfunction
" command! JbzCppMan :call s:JbzCppMan()
" au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>


" function! s:JbzRemoveDebugPrints()
"   let save_cursor = getcurpos()
"   :g/\/\/\ prdbg$/d
"   call setpos('.', save_cursor)
" endfunction
" command! JbzRemoveDebugPrints call s:JbzRemoveDebugPrints()
" au FileType c,cpp nnoremap <buffer><leader>rd :JbzRemoveDebugPrints<CR>


" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
"                 _____  _   _  _____  _____  _____ ___  ___
"                /  __ \| | | |/  ___||_   _||  _  ||  \/  |
"                | /  \/| | | |\ `--.   | |  | | | || .  . |
"                | |    | | | | `--. \  | |  | | | || |\/| |
"                | \__/\| |_| |/\__/ /  | |  \ \_/ /| |  | |
"                 \____/ \___/ \____/   \_/   \___/ \_|  |_/
"          ______  _   _  _   _  _____  _____  _____  _____  _   _  _____
"          |  ___|| | | || \ | |/  __ \|_   _||_   _||  _  || \ | |/  ___|
"          | |_   | | | ||  \| || /  \/  | |    | |  | | | ||  \| |\ `--.
"          |  _|  | | | || . ` || |      | |    | |  | | | || . ` | `--. \
"          | |    | |_| || |\  || \__/\  | |   _| |_ \ \_/ /| |\  |/\__/ /
"          \_|     \___/ \_| \_/ \____/  \_/   \___/  \___/ \_| \_/\____/
"
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "

"https://stackoverflow.com/questions/18319284/vim-sign-column-toggle
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=auto
        let b:signcolumn_on=0
    endif
endfunction

function! FillLine( str, str_end )
    " set tw to the desired total length
    let tw = 77
    if tw==0 | let tw = 77 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
		.s/$/\=(' '.repeat(a:str_end, 1))/
    endif
endfunction

" -------------------------------------------------------------------------- "
"                         python template
" -------------------------------------------------------------------------- "
"  apply a template when creating a python file

autocmd BufNewFile *.py :call CheckPyFile()

function! CheckPyFile()
		let s:file = "> FILE:           " . expand("%:t:r") . "." . expand("%:t:e")
		if (getline("1") !~ "# -*- coding: utf-8 -*")
				normal!ggO# -*- coding: utf-8 -*
				" normal!o"""
				" call append(2, s:file)
				" normal!o> AUTEUR:         P. GAUTHIER
				" let created = "> CREATED         " . expand(strftime('%y/%m/%d %T'))
				" call append(5, created)
				" " let modif = "> LAST MODIFIED:  " . expand(strftime('%y/%m/%d %T'))
				" " call append(6, modif)
				" normal!GGo
				" normal!o> DESCRIPTION:    TODO
				" normal!o"""
				normal!o
				normal!o
				normal!odef main() -> None:
				normal!o    """ Main script's function """
				normal!o    return
				normal!o
				normal!o
				normal!oif '__main__' == __name__:
				normal!o    main()
		endif
endfunction

fun! X()
    let s:a = gitbranch#name()
    echo s:a
    let s:b = substitute(s:a, "\/", "-", "")
    " /Hello
    echo "search workspace: ".expand(s:b)
    let @/ = s:b
    " :normal /s:a

endfun
map <leader>n :call X()<CR>

au VimEnter * call X() | normal! n

" When closing the buffer the 'modified date' is updated
" autocmd BufWinLeave *.py :call UpdateDatePyFile()
" autocmd FileChangedShell *.py :call UpdateDatePyFile()
" function! UpdateDatePyFile()
" 	" if &modified
" 	if (stridx(getline("7"), "> LAST MODIFIED:  ") !~ -1)
" 			:7d
" 			let modif = "> LAST MODIFIED:  " . expand(strftime('%y/%m/%d %T'))
" 			call append(6, modif)
" 			:update
" 	endif
" 	" endif
" endfunction

" autocmd BufWritePre * :%s/\s\+$//e

" for vim
" function! Synctex()
"     " remove 'silent' for debugging
"     execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
" endfunction
" https://gist.github.com/vext01/16df5bd48019d451e078
function! Synctex()
    let vimura_param = " --synctex-forward " . line('.') . ":" . col('.') . ":" . expand('%:p') . " " . substitute(expand('%:p'),"tex$","pdf", "")
    if has('nvim')
        call jobstart("vimura neovim" . vimura_param)
    else
        exe "silent !vimura vim" . vimura_param . "&"
    endif
    redraw!
endfunction

nnoremap <leader>f <cmd>.!figlet<cr>
""" Automation insert import python
nnoremap <leader>in gg/import<CR>)Oimport numpy as np<Esc><C-o><C-o>
nnoremap <leader>ip gg/import<CR>)Oimport pandas as pd<Esc><C-o><C-o>
nnoremap <leader>ib gg/import<CR>)Ofrom beartype import beartype<Esc><C-o><C-o>
nnoremap <leader>ic gg/import<CR>)Ofrom common.base import base<Esc><C-o><C-o>
nnoremap <leader>it yiwgg/import<CR>ofrom typing import <C-r>"<Esc><C-o><C-o>

" function! FindFiles()
"     call inputsave()
"     let l:dir = input("Find file in: ", expand("%:p:h"), "dir")
"     call inputrestore()
"     if l:dir != ""
"         call inputsave()
"         let l:file = input("File name: ")
"         call inputrestore()
"         let l:nf = 'find '.l:dir.' -type f -iname '.l:file.' -exec grep -nH -m 1 ".*" {} \;'
"         lexpr system(l:nf)
"     endif
" endfunction
" nnoremap <silent> <leader>fo :call FindFiles()<CR>

" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
"                  ______   ___   _____  _____  _____
"                  | ___ \ / _ \ /  ___||_   _|/  __ \
"                  | |_/ // /_\ \\ `--.   | |  | /  \/
"                  | ___ \|  _  | `--. \  | |  | |
"                  | |_/ /| | | |/\__/ / _| |_ | \__/\
"                  \____/ \_| |_/\____/  \___/  \____/
"           ___  ___  ___  ______ ______  _____  _   _  _____  _____
"           |  \/  | / _ \ | ___ \| ___ \|_   _|| \ | ||  __ \/  ___|
"           | .  . |/ /_\ \| |_/ /| |_/ /  | |  |  \| || |  \/\ `--.
"           | |\/| ||  _  ||  __/ |  __/   | |  | . ` || | __  `--. \
"           | |  | || | | || |    | |     _| |_ | |\  || |_\ \/\__/ /
"           \_|  |_/\_| |_/\_|    \_|     \___/ \_| \_/ \____/\____/
"                                      _                _
"                                     | |              (_)
"                _ __    ___    _ __  | | _   _   __ _  _  _ __
"               | '_ \  / _ \  | '_ \ | || | | | / _` || || '_ \
"               | | | || (_) | | |_) || || |_| || (_| || || | | |
"               |_| |_| \___/  | .__/ |_| \__,_| \__, ||_||_| |_|
"                              | |                __/ |
"                              |_|               |___/
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "

" ----------------- Leader key ---------------------------------------------- "
" let mapleader="<TAB>"

" -------------------------------------------------------------
"  ALt key activation
"  -----------------------------------------------------------
if has('nvim')
else
	execute "set <M-f>=\ef"
	execute "set <M-'>=\e'"
endif
nnoremap <silent> vv <C-w>v
" nnoremap <silent> vh <C-w>v<C-w>h
" nnoremap <silent> vl <C-w>v<C-w>l
" nnoremap <silent> sk <C-w>s<C-w>k
nnoremap <silent> 'c "_
noremap <Leader>R  :cdo %s//
noremap R yiw:%s///gc<Left><Left><Left><Left><C-r>"<Right>
noremap <leader>r yiwgniw:cdo %s/<C-r>"/<C-r>"/g
" noremap <silent> <Leader>r :set ro<CR>             " set current buffer to readonly
" noremap <silent> <Leader>R :set noreadonly<CR>     " set current buffer to noreadonly
map Q <Nop>                                        " disable entring in ex mode
noremap j gj
noremap k gk
noremap <space> y
noremap tt :tabclose<CR>
noremap gt :tabnew%<CR><C-o>
noremap <C-f> :find<space>
noremap " '
noremap ' "
noremap go o
noremap gO O

" noremap <space>u :find twinlico.py<CR>
" noremap <space>c :find simulation_base_config.py<CR>
" noremap <space>v :find virtual_patient_base.py<CR>

" In insert mode insert the last searched with <\   /> surrounding
" inoremap <A-a> <c-r>=substitute(@/, '^\%(\\<lt>\)\=\(.\{-}\)\%(\\>\)\=$', '\1', '')<cr>

nnoremap <silent>* :<C-u>call Star()\|set hlsearch<CR>
function! Star()
    let @c = expand('<cword>')
    let @/ = '\<' . @c . '\>'
    call histadd('/', @/)
endfunction


" Add newlines from normal mode
" nnoremap <CR> o<Esc>
" nnoremap <S-cr> O<Esc>

nnoremap <silent> '' "+yiw                         " copy word into clipboard
nnoremap <silent> '<space> "+yy                    " copy line into clipboard
" for comment line
map co :call FillLine('-', '#')<CR>                " for commenting fill rest of line with --- until char 79
map c' i#<Esc> :call FillLine('-', '#')<CR>        " make a whole comment lie # ---..-- #
" for print line
map cp :call FillLine('-', '")')<CR>               " fill rest of line with ---")

" nnoremap <expr> fs ':%s/'.expand('<cword>').'//gn<CR>``' " search current word under cursor
" nnoremap fj *N
nnoremap ck i" + \"<Esc>hK                           " cut too long string
" nnoremap P i<cr><esc>                              " cut line
:map H ^
:map L g_
inoremap <M-f> <Esc>:update<CR>                    " save buffer if changes
nnoremap <M-f> <Esc><Esc>:update<CR>

noremap fg "+yy
nnoremap g. /\V<C-r>"<CR>cgn<C-a><Esc>
" -------------------- quickfix list ----------------------------- #
" nnoremap <silent> <F5> :copen<cr>
" nnoremap ]c :cnext<CR>                             " go to next item in quickfix list
" nnoremap [c :cprev<CR>                             " go to previous item in quickfix list

" -------- autoformat files ------------------------------------------------- "
nnoremap <silent> <F9> :r! python -m black -l 79 expand('%:p')

"" ---- e.g press 1 to go to buffer 1 -----------
map <M-1> :tabn1<CR>
map <M-2> :tabn2<CR>
map <M-3> :tabn3<CR>
map <M-4> :tabn4<CR>
map <M-5> :tabn5<CR>
map <M-6> :tabn6<CR>
map <M-7> :tabn7<CR>
map <M-8> :tabn8<CR>
map <M-9> :tabn9<CR>

" ---- close buffers on left, rigth, ..
nnoremap ql <C-w>lZZ<CR>
nnoremap qh <C-w>hZZ<CR>
nnoremap qj <C-w>jZZ<CR>
nnoremap qk <C-w>kZZ<CR>
nnoremap qq :x<CR>

" ------ replace inner word and search replace word to reapeat -------
nnoremap cj #*cgn

" nnoremap <Leader>l :let &scrolloff=100-&scrolloff<CR>                " make edit line always centered

" ---------------------- loclist --------------------------
nnoremap <silent> <F3> :call LNext(0)<CR>
nnoremap <silent> <F4> :call LNext(1)<CR>
nnoremap ]l :lnext<CR>                             " go to next item in location list
nnoremap [l :lprev<CR>                             " go to next item in location list
nnoremap <C-w>p :lopen<CR>                  " open loclist
" nnoremap <C-p> :lcl<CR>                     " close loclist --------------- #
" nnoremap <M-u> :lla <CR>                    " navigate to last item in list

"
"
" ------------------------ search ------------------------------------------- #
"
nnoremap <silent> ff :nohlsearch<Bar>:echo<CR> " Press ff to turn off highlighting and clear any message already displayed.

"
" ------------------------ registers ---------------------------------------- #
"
" List contents of all registers
" nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
" Clean Registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

"
" --------------------- Tags ------------------------------------------------ #
nnoremap <C-W>[ :call FollowTag()<CR>zt   " Follow tag in a vertical window
"
"
" ------------------------ python pdb --------------------------------------- #
"
" Add easy nbreakpoint shortcut with correct identation
nnoremap <silent> <C-Y> :let a='import pdb; pdb.set_trace()'\|put=a<CR>kJi<CR><ESC>
nnoremap <silent> <A-d> :let a="__import__('ipdb').set_trace()"\|put=a<CR>kJi<CR><ESC>

"
" split
"
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
"max height Ctrl-w _
"maz width Ctrl-w |.
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up>  :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
"                ______  _      _   _  _____  _____  _   _  _____
"                | ___ \| |    | | | ||  __ \|_   _|| \ | |/  ___|
"                | |_/ /| |    | | | || |  \/  | |  |  \| |\ `--.
"                |  __/ | |    | | | || | __   | |  | . ` | `--. \
"                | |    | |____| |_| || |_\ \ _| |_ | |\  |/\__/ /
"                \_|    \_____/ \___/  \____/ \___/ \_| \_/\____/
"
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "

if has('win32')
    let g:plug_install_files = '$HOME\vimfiles\plugged'
endif
if has('unix')
    let g:plug_install_files = '$HOME/.vim/plugged'
endif
call plug#begin(g:plug_install_files)

" --------------------------------------------------------------
" ------------------ Neovim plugins  ---------------------------
" --------------------------------------------------------------
" Plug 'dominikduda/vim_current_word'
if has('nvim')
    " Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'kevinhwang91/rnvimr'                            " open ranger in nvim
    " Plug 'rcarriga/nvim-notify'
    Plug 'windwp/nvim-autopairs'
    Plug 'LudoPinelli/comment-box.nvim'
    Plug 'mcauley-penney/tidy.nvim'
    Plug 'ojroques/nvim-bufdel'
    Plug 'kyazdani42/nvim-web-devicons'                    " additionnal icons for neovim
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'kyazdani42/nvim-tree.lua'                        " file tree
    Plug 'stevearc/qf_helper.nvim'                         " better quickfix list
    Plug 'kevinhwang91/nvim-bqf'                           " better quickfix list
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'                    " Snippets collection for a set of different programming languages for faster development.
    " Plug 'kkharji/sqlite.lua'
    " Plug 'AckslD/nvim-neoclip.lua'                         " Sis a clipboard manager for neovim

    " -------------------------------------------------------------------------- #
    " ------------------ LSP --------------------------------------------------- #
    " -------------------------------------------------------------------------- #
    Plug 'neovim/nvim-lsp'                           " lsp configuration
    Plug 'neovim/nvim-lspconfig'                     " lsp configuration
    " Plug 'williamboman/nvim-lsp-installer'         " nvim-lspconfig companion -> mason.nvim
    Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'hrsh7th/nvim-cmp'                          " completion plugin
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }  " UI usefull to find best definition
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'ray-x/lsp_signature.nvim'                " force to see function signature when typing
    Plug 'saadparwaiz1/cmp_luasnip'

    Plug 'MunifTanjim/nui.nvim'

    Plug 'hrsh7th/cmp-cmdline'
    Plug 'folke/trouble.nvim'                              " pretty list for diagnostic, reference, quickfix, ..
    Plug 'SmiteshP/nvim-gps'
    Plug 'ggandor/lightspeed.nvim'
    Plug 'numToStr/Comment.nvim'

    " -------------------------------------------------------------------------- #
    " ------------------ theming ----------------------------------------------- #
    " -------------------------------------------------------------------------- #
    " Plug 'glepnir/dashboard-nvim'
    " Plug 'rmagatti/igs.nvim'                               " git helper
    Plug 'Julpikar/night-owl.nvim'
    Plug 'lewis6991/gitsigns.nvim'                         " show git diff
    Plug 'norcalli/nvim-colorizer.lua'                     " show colors from hex code
    Plug 'nvim-lua/plenary.nvim'                           " neovim outside function
    " Plug 'sindrets/diffview.nvim'                          " diffview
    Plug 'kwkarlwang/bufresize.nvim'                       " keep buffer proportions

    Plug 'nvim-lua/popup.nvim'                             " to install telescope
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'p00f/nvim-ts-rainbow'                             " rainbow parenthesis

    Plug 'lewis6991/spellsitter.nvim'                    " spell checker

    " ----------------------------------------------------------------------- "
    " Plug 'glepnir/indent-guides.nvim'                      " indent line
    Plug 'Shougo/denite.nvim'                              " file , buffers manager
    Plug 'ncm2/float-preview.nvim/'
    Plug 'vijaymarupudi/nvim-fzf'                          " fzf
    Plug 'ibhagwan/fzf-lua'
    Plug 'tiagovla/tokyodark.nvim'

    Plug 'davidgranstrom/nvim-markdown-preview'
    " Plug 'wuelnerdotexe/vim-enfocado'                      " colorschee
    Plug 'artart222/nvim-enfocado'                      " colorschee
    Plug 'folke/todo-comments.nvim'
    Plug 'dstein64/nvim-scrollview'

else
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}      " new community driven completion engine
    " Plug 'justinmk/vim-sneak'                               " jump using 2-chars
    Plug 'preservim/nerdtree'                              " file explorer
    Plug 'wellle/targets.vim'                              " Better objects
    Plug 'jeetsukumaran/vim-pythonsense'                   " add python objects (it works !!)
    Plug 'tpope/vim-commentary'                             " comment objects
    Plug 'luochen1990/rainbow'                             " rainbow parenthesis
    Plug 'nathom/filetype.nvim'                            " better startup ?
    Plug 'ryanoasis/vim-devicons'                          " add icon
endif

" --------------------------------------------------------------
" ---------------------- To config -----------------------------
" --------------------------------------------------------------
Plug 'jessekelighine/vindent.vim'
Plug 'itchyny/vim-gitbranch'                         " get current branch name
Plug 'Matt-A-Bennett/surround-funk.vim'
Plug 'svban/YankAssassin.vim'
Plug 'psliwka/vim-smoothie'
Plug 'rhysd/clever-f.vim'
Plug 'vim-scripts/restore_view.vim'
Plug 't9md/vim-textmanip'                            " move blocks of text easy
Plug 'tyru/open-browser.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'tpope/vim-scriptease'
" Plug 't9md/vim-choosewin'
" Plug 'junegunn/vim-easy-align'                       " Helps alignment TODO: LEARN
" Plug 'sjl/gundo.vim'                                 " add undo tree
" Plug 'chimay/wheel/'                                 " better join lines
" Plug 'junegunn/loclisteasy-align'
" Plug 'junegunn/fzf.vim'

" --------------------------------------------------------------
" ---------------------- C++ ------------------------------------
" --------------------------------------------------------------
Plug 'derekwyatt/vim-fswitch'

" --------------------------------------------------------------------------- "
" ---------------------- tmux ----------------------------------------------- "
" --------------------------------------------------------------------------- "
Plug 'roxma/vim-tmux-clipboard'                         " share copied buffer with tmux

" --------------------------------------------------------------------------- "
" ---------------------- IDE ------------------------------------------------ #
" --------------------------------------------------------------------------- "
Plug 'tpope/vim-sleuth'                                 " automatic indentation config
" Plug 'brooth/far.vim'                                   " search and replace
Plug 'chrisbra/NrrwRgn'                                 " allow working only on a selected region in a new buffer with :<range>NR
Plug 'mattn/vim-findroot'                               " Auto change directory to project root directory of the file.
Plug 'mhinz/vim-grepper'                                " Grep tool
Plug 'svermeulen/vim-subversive'                        " substitution
Plug 'tpope/vim-repeat'                                 " repetition plugin
Plug 'tpope/vim-surround'                              " surround oparator
Plug 'chrisbra/csv.vim'
" Plug 'AndrewRadev/sideways.vim'                         " move func args
" Plug 'qwertologe/nextval.vim'                           " better ctrl-a
" Plug 'yssl/QFEnter'                                   " open buffers from quickfix list easy
" Plug 'flwyd/vim-conjoin'                                " better join lines
" Plug 'fcpg/vim-shore'                                   " jump to first non-blak character when using j/k
" Plug 'maxboisvert/vim-simple-complete'                  " as-you-type keyword completion

" --------------------------------------------------------------------------- "
" ---------------------- code completion / inspect -------------------------- "
" --------------------------------------------------------------------------- "
" Plug 'MathSquared/vim-python-sql'
" Plug 'https://github.com/tpope/vim-endwise'           " end certain structures automatically
" Plug 'https://github.com/romainl/vim-qf'              " help with the quickfix lists
" Plug 'antoinemadec/coc-fzf'                           " integrate fzf with coc.vim
"
" --------------------------------------------------------------
" ---------------------- git -----------------------------------
" --------------------------------------------------------------
Plug 'tpope/vim-fugitive'                               " git integration plugin
" Plug 'rbong/vim-flog'                                   " Commit viewer
"
" --------------------------------------------------------------
" ---------------------- run in vim ----------------------------
" --------------------------------------------------------------
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}           " async executions
" Plug 'sillybun/vim-repl'                             " python terminal
" Plug 'https://github.com/gotcha/vimpdb'
" Plug 'https://github.com/thinca/vim-quickrun'          " Run python and others easely
" Plug 'romainl/vim-qf'                                " help with the quickfix lists
" Plug 'wincent/terminus'                              " send text to as windows
"
" --------------------------------------------------------------
" ---------------------- buffers -------------------------------
" --------------------------------------------------------------
" Plug 'jeetsukumaran/vim-buffergator'                   " buffer list

" --------------------------------------------------------------
"- ---------------------- Python -------------------------------
" --------------------------------------------------------------
Plug 'pgzzdiab/vim-unstack'                            " parse python callback from clipbord/tmux buffer into quickfix list
Plug 'mgedmin/python_open_module.vim'                  " Python standard library source code
Plug 'jeetsukumaran/vim-python-indent-black'
Plug 'kkoomen/vim-doge', {'do': { -> doge#install() }} " Docstring generator
" Plug 'jmcantrell/vim-virtualenv'                       " Tool for python venv
" Plug 'westurner/venv.vim'
" Plug 'tell-k/vim-autopep8'                           " autoformat python
" Plug 'wincent/terminus'                              " send text to as windows
"
" --------------------------------------------------------------
" ---------------------- Objects -------------------------------
" --------------------------------------------------------------
Plug 'tpope/vim-unimpaired'                            " exchange lines relatively
Plug 'FooSoft/vim-argwrap'                             " wrap functions args
Plug 'jeetsukumaran/vim-indentwise'                    " Move to indent
Plug 'michaeljsmith/vim-indent-object'                 " text object based on indentation levels.
Plug 'kana/vim-textobj-user'                           " add new text objects
" Plug 'glts/vim-textobj-comment'                        " comment text object
Plug 'kana/vim-textobj-entire'                        " whole buffer opbject
" Plug 'christoomey/vim-system-copy'                   " mapping for clipoard
"
" --------------------------------------------------------------
" ---------------------- Tags ----------------------------------
" --------------------------------------------------------------
" Plug 'skywind3000/gutentags_plus'                    " help to generate tags
" Plug 'ludovicchabant/vim-gutentags'                  " help to generate tags
" Plug 'mgedmin/pytag.vim'                             " better tags for python
" Plug 'mgedmin/python-imports.vim'                    " Insert Python import statements computed from tags, bound to <F5>
" Plug 'universal-ctags/ctags'                         " help to generate tags
"
" --------------------------------------------------------------
" ---------------------- Theming -------------------------------
" --------------------------------------------------------------

" Plug 'vim-airline/vim-airline'                         " tabline
" Plug 'vim-airline/vim-airline-themes'
if has('nvim')
  Plug 'bluz71/vim-nightfly-colors'
  Plug 'noib3/cokeline.nvim'                              " tabline
  Plug 'windwp/windline.nvim'                               " statusbar
  " Plug 'windwp/floatline.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'marko-cerovac/material.nvim'

  " Plug 'rktjmp/lush.nvim'
  " Plug 'ellisonleao/gruvbox.nvim'
  Plug 'Shatur/neovim-ayu'
  Plug 'rebelot/kanagawa.nvim'

" Plug 'Yggdroot/indentLine'                             " indent guide
" Plug 'hoob3rt/lualine.nvim'                          " statusbar
" Plug 'famiu/feline.nvim'                               " statusbar
" Plug 'romgrk/barbar.nvim'                              " bufferline
else
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
endif

Plug 'MTDL9/vim-log-highlighting'                      " highlight .log files
Plug 'camspiers/animate.vim'                           " windows move animation
" Plug 'psliwka/vim-smoothie'                            " Better scroll
Plug 'mhinz/vim-startify'                              " add start page to vim
" Plug 'kshenoy/vim-signature'                           " show marks in signcolumn

" Plug 'vim/killersheep'                               " absolutely essential
" old themes:
" Plug 'morhetz/gruvbox'                               " color theme
" Plug 'https://github.com/ogdenwebb/emacs-kaolin-themes'
" Plug 'https://github.com/fcpg/vim-fahrenheit'

" --------------------------------------------------------------
" ---------------------- Snippets ------------------------------
" --------------------------------------------------------------
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
"
" --------------------------------------------------------------
" ---------------------- Latex ---------------------------------
" --------------------------------------------------------------
Plug 'lervag/vimtex'                                   " Latex plugin
" Plug 'https://vimawesome.com/plugin/tex-fold'        " add-on for latex TODO
" Plug 'vim-grammarous'                                " Grammar corrections
"
" --------------------------------------------------------------
" ---------------------- Markdown file -------------------------
" --------------------------------------------------------------
" tyru/vim-markdown
" https://github.com/superbrothers/vim-quickrun-markdown-gfm/blob/ea8c26c4980eb84ae2bdbc99c753fcbaad557395/README.md
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " preview for markdown files
"
" R https://github.com/tyru/R-Vim-runtime
"
" --------------------------------------------------------------
" ---------------------- Databases -----------------------------
" --------------------------------------------------------------
" Plug 'MathSquared/vim-python-sql'
" https://github.com/tpope/vim-dadbod
" Plug 'tpope/vim-vinegar'
" mileszs/ack.vim                                      " wrap grep tools in vim
"

call plug#end()

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
" <<<<<<<<<<<<<<<<<<<< Plugin Configuration >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "

" --------------------------------------------------------------
" TreesitterContext
" --------------------------------------------------------------
" highlight TreesitterContext guibg=#F07178
" hi TreesitterContextBottom gui=underline guisp=Grey
highlight! TreesitterContext guifg=#F07178 guibg=#000000 gui=NONE cterm=NONE


if has('nvim')
      " some neovim packges are configured here
      " lua require('$HOME/.config/nvim/lua/lua_config.lua')
      lua require('lua_config')

endif

" --------------------------------------------------------------
" scrollview
" --------------------------------------------------------------
highlight! ScrollView guifg=#F07178 gui=NONE cterm=NONE
" highlight ScrollView ctermbg=159 guibg=LightCyan
let g:scrollview_signs_on_startup = ['all']


" --------------------------------------------------------------
" blankline indent
" --------------------------------------------------------------
if has('nvim')
" let g:indentLine_char = "▎"
" let g:indentLine_conceallevel = 2
endif

" --------------------------------------------------------------
" comment-box
" --------------------------------------------------------------
if has('nvim')
" left aligned fixed size box with left aligned text
" nnoremap <Leader>bb <Cmd>lua require('comment-box').lbox()<CR>
" vnoremap <Leader>bb <Cmd>lua require('comment-box').lbox()<CR>

" centered adapted box with centered text
nnoremap c<space> <Cmd>lua require('comment-box').accbox()<CR>
vnoremap c<space> <Cmd>lua require('comment-box').accbox()<CR>

" centered line
nnoremap <Leader>bl <Cmd>lua require('comment-box').cline()<CR>
" inoremap <M-l> <Cmd>lua require('comment-box').cline()<CR>

endif

" if has('nvim')

" 	" -------------------------------------------------------------
" 	"  barbar
" 	"  ------------------------------------------------------------
" 	" Move to previous/next
" 	nnoremap <silent> <A-[> :BufferPrevious<CR>
" 	nnoremap <silent> <A-]> :BufferNext<CR>
" 	" Re-order to previous/next
" 	nnoremap <silent> <A-{> :BufferMovePrevious<CR>
" 	nnoremap <silent> <A-}> :BufferMoveNext<CR>
" 	" Goto buffer in position...
" 	nnoremap <silent> <A-q> :BufferGoto 1<CR>
" 	nnoremap <silent> <A-w> :BufferGoto 2<CR>
" 	nnoremap <silent> <A-e> :BufferGoto 3<CR>
" 	nnoremap <silent> <A-r> :BufferGoto 4<CR>
" 	nnoremap <silent> <A-t> :BufferGoto 5<CR>
" 	nnoremap <silent> <A-y> :BufferGoto 6<CR>
" 	nnoremap <silent> <A-u> :BufferGoto 7<CR>
" 	nnoremap <silent> <A-i> :BufferGoto 8<CR>
" 	nnoremap <silent> <A-o> :BufferGoto 9<CR>
" 	nnoremap <silent> <A-p> :BufferLast<CR>

" 	" Close buffer
" 	nnoremap <silent> <A-c> :BufferClose<CR>
" 	" Magic buffer-picking mode
" 	nnoremap <silent> <A-s> :BufferPick<CR>
" 	" Sort automatically by...
" 	nnoremap <silent> <Leader>bd :BufferOrderByDirectory<CR>
" 	nnoremap <silent> <Leader>bl :BufferOrderByLanguage<CR>
" endif

" -------------------------------------------------------------
"  open-browser
"  ------------------------------------------------------------
"  open c++ doc
let g:openbrowser_search_engines = extend(
\ get(g:, 'openbrowser_search_engines', {}),
\ {
\   'microsoft': 'https://docs.microsoft.com/fr-fr/search/?scope=C%2B%2B&view=msvc-170&terms={query}',
\   'cppreference': 'https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={query}',
\   'qt': 'https://doc.qt.io/qt-5/search-results.html?q={query}',
\   'python': 'https://docs.python.org/dev/search.html?q={query}&check_keywords=yes&area=default',
\   'numpy': 'https://numpy.org/doc/stable/search.html?q={query}',
\   'scipy': 'https://docs.scipy.org/doc/scipy/search.html?q={query}',
\   'pandas': 'https://pandas.pydata.org/pandas-docs/stable/search.html?q={query}',
\   'web': 'https://duckduckgo.com/?q=python+doc+{query}&t=h_&ia=web',
\ },
\ 'keep'
\)
nnoremap <silent> <leader>cm :call openbrowser#smart_search(expand('<cword>'), "microsoft")<CR>
nnoremap <silent> <leader>osx :call openbrowser#smart_search(expand('<cword>'), "cppreference")<CR>
nnoremap <silent> <leader>osq :call openbrowser#smart_search(expand('<cword>'), "qt")<CR>
nnoremap <silent> <leader>dd :call openbrowser#smart_search(expand('<cword>'), "python")<CR>
nnoremap <silent> <leader>dn :call openbrowser#smart_search(expand('<cword>'), "numpy")<CR>
nnoremap <silent> <leader>dp :call openbrowser#smart_search(expand('<cword>'), "pandas")<CR>
nnoremap <silent> <leader>dw :call openbrowser#smart_search(expand('<cword>'), "web")<CR>

" -------------------------------------------------------------
" Fugitive Conflict Resolution
" -------------------------------------------------------------
nnoremap <leader>gm :Git mergetool<CR>
nnoremap <leader>2 :diffget //2<CR>
nnoremap <leader>3 :diffget //3<CR>


" -------------------------------------------------------------
"  fswitch
"  ------------------------------------------------------------
au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"
au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'
nnoremap <silent> <leader>F :FSHere<cr>
" Extra hotkeys to open header/source in the split
nnoremap <silent> <localleader>oh :FSSprlitLeft<cr>
nnoremap <silent> <localleader>oj :FSSplitBelow<cr>
nnoremap <silent> <localleader>ok :FSSplitAbove<cr>
nnoremap <silent> <localleader>ol :FSSplitRight<cr>

" -------------------------------------------------------------
"  vindent
"  ------------------------------------------------------------
" let g:vindent_motion_prev = '[l'
" let g:vindent_motion_next = ']l'
let g:vindent_object_XX_ii     = 'ii' " select current block.
let g:vindent_object_XX_ai     = 'ai' " select current block + one extra line  at beginning.
let g:vindent_object_XX_aI     = 'aI' " select current block + two extra lines at beginning and end.

" -------------------------------------------------------------
"  markdown-preview
"  ------------------------------------------------------------
" let g:nvim_markdown_preview_theme = 'solarized-dark'
nnoremap <leader>mp <plug>(nvim-markdown-preview)

" -------------------------------------------------------------
"  scrollbar
"  ------------------------------------------------------------
if has('nvim')
  " augroup ScrollbarInit
  "   autocmd!
  "   autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  "   autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  "   autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
  " augroup end

  " let g:scrollbar_shape = {
  "   \ 'head': '',
  "   \ 'body': '|',
  "   \ 'tail': '',
  "   \ }

  " let g:scrollbar_winblend = 80

endif

" -------------------------------------------------------------
"  bufdel
"  ------------------------------------------------------------
if has('nvim')
  nnoremap <silent> xx <cmd>BufDel<cr>
  nnoremap <silent> xc <cmd>BufDel!<cr>
endif

" " -------------------------------------------------------------
" "  lightspeed
" "  ------------------------------------------------------------
" map f <Plug>Lightspeed_f
" map F <Plug>Lightspeed_F
" map t <Plug>Lightspeed_t
" map T <Plug>Lightspeed_T
" map ; <Plug>Lightspeed_;_sx
" map , <Plug>Lightspeed_,_sx`
" map , <Plug>Lightspeed_;_fx

" " -------------------------------------------------------------
" "  clever-f
" "  ------------------------------------------------------------
let g:clever_f_smart_case = 1
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)
let g:clever_f_chars_match_any_signs=';'
"
" -------------------------------------------------------------
"  ultisnips
"  ------------------------------------------------------------
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" -------------------------------------------------------------
"  moonfly
"  ------------------------------------------------------------
" Vimscript initialization file
" let g:moonflyWithNerdIcon = 1
" Vimscript initialization file
" let g:moonflyWithNvimLspIndicator = 1
" let g:moonflyWithGitBranch = 1
" let g:moonflyWithGitBranchCharacter = 1

" -------------------------------------------------------------
"  Grepper
"  ------------------------------------------------------------
if has('nvim')
  " vim.g.kommentary_create_default_mappings = true
  " vim.api.nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
  " vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
  " vim.api.nvim_set_keymap("x", "<leader>ci", "<Plug>kommentary_visual_increase", {})
  " vim.api.nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
  " vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
  " vim.api.nvim_set_keymap("x", "<leader>cd", "<Plug>kommentary_visual_decrease", {})
endif

" -------------------------------------------------------------
"  Grepper
"  ------------------------------------------------------------
let g:grepper_quickfix=0             " use location list
let g:grepper_open=1
let g:grepper_switch=1              " Go into the location list after a search
let g:grepper_side=1                " Open a new window and show matches with surrounding contextu
let g:grepper_dir="repo"
let g:grepper_side=1
let g:grepper_tools=['ag']
let g:grepper_highlight=1

" --------------------------------------------------------------
" igs
" --------------------------------------------------------------
nnoremap <leader>gem <cmd>lua require('igs').edit_modified()<CR>
nnoremap <leader>ges <cmd>lua require('igs').edit_staged()<CR>
nnoremap <leader>gea <cmd>lua require('igs').edit_all()<CR>
nnoremap <leader>gqm <cmd>lua require('igs').qf_modified()<CR>
nnoremap <leader>gqs <cmd>lua require('igs').qf_staged()<CR>
nnoremap <leader>gqa <cmd>lua require('igs').qf_all()<CR>

" --------------------------------------------------------------
" unstack
" --------------------------------------------------------------
" nnoremap <A-a> :UnstackFromClipboard<CR>

" nnoremap <A-d> :UnstackFromClipboard \| copen<CR><C-w>JG<CR>
let g:unstack_populate_quickfix=1
let g:unstack_open_tab=0
let g:unstack_showsigns=0
" let g:unstack_extractors=0

" --------------------------------------------------------------
" qf_helper
" --------------------------------------------------------------
if has('nvim')
  " use <C-N> and <C-P> for next/prev.
  nnoremap <silent> <C-N> <cmd>QNext<CR>
  nnoremap <silent> <C-P> <cmd>QPrev<CR>
  " toggle the quickfix open/closed without jumping to it
  " nnoremap <silent> <leader>q <cmd>QFToggle!<CR>
  nnoremap <silent> <leader>q <cmd>copen<CR>
  nnoremap <silent> <leader>l <cmd>LLToggle!<CR>
  " <C-t>	open in a new tab
  " <C-s>	open in a horizontal split
  " <C-v>	open in a vertical split
  " <C-p>	open the entry but keep the cursor in the quickfix window
  " <C-k>	scroll up and open entry while keeping the cursor in the quickfix window
  " <C-j>	scroll down and open entry while keeping the cursor in the quickfix window
  " {	scroll up to the previous file
  " }	scroll down to the next file
endif

" --------------------------------------------------------------
" echo doc
" --------------------------------------------------------------
let g:echodoc#enable_at_startup=1

" --------------------------------------------------------------
" ------------------------- Indent  ----------------------------------------- "
" --------------------------------------------------------------
" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_guide_size=2
" l let g:indent_guides_auto_colors=1
" let g:indent_guides_color_change_percent = 8
" let g:indent_guides_start_level = 2
" let g:indent_guides_exclude_filetypes = ['help', 'startify']

" --------------------------------------------------------------
" alpha dll
" --------------------------------------------------------------
" if has('win32')
"     autocmd BufReadPost * call libcallnr("vimtweak64.dll", "SetAlpha", 225)
"     autocmd BufReadPost * call libcallnr("vimtweak64.dll", "EnableMaximize", 1)
" endif

" --------------------------------------------------------------
" doc
" --------------------------------------------------------------
let g:doge_doc_standard_python = 'sphinx'
let g:doge_mapping = '<Leader>do'

"
" --------------------------------------------------------------
" rainbow
" --------------------------------------------------------------
if has("nvim")
else
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
		\ 'guifgs': ['#FFCC00', '#82AAFF', '#fe8019']
\}
endif

" --------------------------------------------------------------
" tags
" --------------------------------------------------------------
" config project root markers.
" let g:gutentags_project_root = ['.root']
" generate databases in my cache directory, prevent gtags files polluting
" my project
" let g:gutentags_cache_dir = expand('~/.cache/tags')
" let g:tagbar_compact = 1
" let g:tagbar_show_tag_linenumbers = 1
" let g:tagbar_singleclick = 1
" let g:tagbar_show_linenumbers = 2
" " let g:tagbar_iconchars = ["\u2ba9", "\u2bae"]
" let g:tagbar_iconchars = ["🡲", "🡳"]
" let g:tagbar_autoshowtag = 0
" " let g:tagbar_scopestrs = {
" " 		\    'class': "\uf0e8",
" " 		\    'const': "\uf8ff",
" " 		\    'constant': "\uf8ff",
" " 		\    'enum': "\uf702",
" " 		\    'field': "\uf30b",
" " 		\    'func': "\uf794",
" " 		\    'function': "\uf794",
" " 		\    'getter': "\ufab6",
" " 		\    'implementation': "\uf776",
" " 		\    'interface': "\uf7fe",
" " 		\    'map': "\ufb44",
" " 		\    'member': "\uf02b",
" " 		\    'method': "\uf6a6",
" " 		\    'setter': "\uf7a9",
" " 		\    'variable': "\uf71b",
" " 		\ }
" https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
" let g:gutentags_modules = ['ctags', 'gtags_cscope'] "enable gtags module
" let g:gutentags_project_root = ['.root']   " config project root markers.
" let g:gutentags_cache_dir = expand('~/.cache/tags')
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_new = 1
" let g:gutentags_generate_on_missing = 1
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_empty_buffer = 0
" let g:gutentags_ctags_extra_args = [
"       \ '--tag-relative=yes',
"       \ '--fields=+ailmnS',
"       \ ]
" let g:tagbar_autoshowtag = 1
" " let g:tagbar_previewwin_pos = "aboveleft"
" command! MakeTags !ctags -R .
" " generate databases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_ctags_exclude = [
" 			\ "*.min.js", "*.min.css", "build", "vendor", ".git",
" 			\ '*.tmp', '*.csproj.user', '*.cache', '*.pdb', '*.pyc',
" 			\ '*.class', '*.sln', "node_modules", '*.less', '*.scss',
" 			\ '*.exe', '*.dll', '*.mp3',  '*.ogg', '*.swp',
" 			\ '*.swo', '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
"       \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz',
" 			\ '*.tar.bz2', '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
"       \ "*.vim/bundle/*", "tags*" , "*.idea/*"]
" " generate datebases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_plus_switch = 1      " change focus to quickfix window after search
" set previewheight=60                 " remap tag open in new split windows

" --------------------------------------------------------------
" animate
" --------------------------------------------------------------
let g:animate#duration = 200.0
let g:animate#easing_func = 'animate#ease_linear'

if has('nvim')
	" --------------------------------------------------------------
	" LUA TREE
	" --------------------------------------------------------------
	" let g:nvim_tree_width = 50 "30 by default
	let g:nvim_tree_ignore = ['.git', 'node_modules', '.cache', '.pyc', '__pycache__', '.DS_Store', 'tags', '.idea', '.sass-cache', '.aux'] "empty by default
	" let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
	" let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
	" let g:nvim_tree_show_icons = {
	" 	\ 'git': 0,
	" 	\ 'folders': 1,
	" 	\ 'files': 1,
	" 	\ }

else
	" --------------------------------------------------------------
	" nerdtree
	" --------------------------------------------------------------
	" hide brackets arounds icon node
	augroup nerdtree
		autocmd!
		autocmd FileType nerdtree syntax clear NERDTreeFlags
		autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
		autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
		autocmd FileType nerdtree setlocal conceallevel=3
		autocmd FileType nerdtree setlocal concealcursor=nvic
	augroup END

	let NERDTreeQuitOnOpen=0
	let NERDTreeIgnore = ['\.pyc$', '__pycache__', '^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
	let g:NERDTreeHighlightCursorline=1
	let g:NERDTreeShowBookmarks=1
	let g:NERDTreeShowHidden=1
	let g:NERDTreeShowLineNumbers=1   " display line number
	let g:NERDTreeAutoDeleteBuffer=1
	let g:NERDTreeDirArrowExpandable='⮞'
	let g:NERDTreeDirArrowCollapsible='⮟'
	let NERDTreeStatusline=""
endif

" --------------------------------------------------------------
" submersive
" --------------------------------------------------------------
let g:subversivePromptWithCurrent=1
let g:subversivePreserveCursorPosition=1 "cursor will not move when substitutions are applied

" -------------------- theme ------------------------------------------------ "
" if has('nvim')
" " we use lualine
" else
" --------------------------------------------------------------
" airline
" --------------------------------------------------------------
if has("nvim")
else
" let g:airline_theme = 'term'
let g:airline_theme = 'tomorrow'
let g:airline_inactive_collapse=1
let g:airline_experimental = 1
let g:airline_inactive_alt_sep=1
let g:airline_powerline_fonts = 1
let g:airline_disable_statusline = 1
let airline#extensions#tabline#disable_refresh = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
" enable/disable displaying tab type (e.g. [buffers]/[tabs]) >
let g:airline#extensions#tabline#close_symbol = ''
let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#buffer_min_count = 0   " show tabline only if there is more than 1 buffer

" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t' " show only file name on tabs

let g:airline#extensions#tabline#show_tab_type = 3
"  enable/disable displaying tab number in tabs mode. >

" let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#buffer_idx_mode=1
" let g:airline#extensions#tabline#show_tab_nr=1
" let g:airline#extensions#tabline#tab_nr_type=0
" let g:airline#extensions#tabline#buffer_nr_show=1

" let g:airline#extensions#tabline#buffer_nr_format = '%s:'

" ---------------- mapping tab ---------------------------------------------- "
let g:airline#extensions#tabline#buffer_idx_format = {
				\ '0': 'p:',
				\ '1': 'q:',
				\ '2': 'w:',
				\ '3': 'e:',
				\ '4': 'r:',
				\ '5': 't:',
				\ '6': 'y:',
				\ '7': 'u:',
				\ '8': 'i:',
				\ '9': 'o:'
				\}
endif

" --------------------------------------------------------------
" vimtex
" --------------------------------------------------------------
let g:vimtex_enabled=1
let g:livepreview_previewer = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
"" let g:livepreview_engine = 'lualatex'
let g:vimtex_compiler_method = 'latexmk'
let maplocalleader = "x"
"" let g:vimtex_compiler_latexmk_engines = 'lualatex'
"" See $pdf_mode = 4 in .latexmk for lualatx
let g:vimtex_compiler_latexmk = {
   \ 'backend' : 'jobs',
   \ 'background' : 1,
   \ 'build_dir' : '',
   \ 'callback' : 1,
   \ 'continuous' : 1,
   \ 'executable' : 'latexmk',
   \ 'options' : [
       \   '-shell-escape',
       \   '-silent',
       \   '-synctex=1',
       \   '-gg'
   \ ],
   \}
""
let g:tex_flavor = 'latex'

" -----------------------------------------------------
" specifig options for lualatex document like my cv
" -----------------------------------------------------
"" let g:livepreview_engine = 'lualatex'
"let g:vimtex_compiler_method = 'latexmk'
"" let g:vimtex_compiler_latexmk_engines = 'lualatex'
"" See $pdf_mode = 4 in .latexmk for lualatx
"let g:vimtex_compiler_latexmk = {
"    \ 'backend' : 'jobs',
"    \ 'background' : 1,
"    \ 'build_dir' : '',
"    \ 'callback' : 1,
"    \ 'continuous' : 1,
"    \ 'executable' : 'latexmk',
"    \ 'options' : [
"        \   '-shell-escape',
"        \   '-silent',
"        \   '-gg',
"        \   '-lualatex'
"    \ ],
"    \}
""
"let g:tex_flavor = 'latex'

" --------------------------------------------------------------
" startify
" --------------------------------------------------------------
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
          " \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]
let g:startify_files_number = 2
let g:webdevicons_enable_startify = 1
" let g:startify_session_autoload = 1
let g:startify_change_to_dir = 0
" let g:workspace_session_directory = $HOME . '/.cache/sessions/'
let g:startify_session_autoload = 1
let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'

let g:startify_custom_header = [
      \ '                                                                ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮                    ',
      \ '                                                                │││├┤ │ │╰┐┌╯││││                    ',
      \ '                                                                ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴                    ',
      \ ]
      " \ '                      ▄              ▄                                                                                                                    ▄              ▄      ',
      " \ '                     ▌▒█           ▄▀▒▌         _____   ______        ______           _____     ____      ____  ____      ______  _______              ▌▒█           ▄▀▒▌     ',
      " \ '                     ▌▒▒▀        ▄▀▒▒▒▐        |\    \ |\     \   ___|\     \     ____|\    \   |    |    |    ||    |    |      \/       \             ▌▒▒▀        ▄▀▒▒▒▐     ',
      " \ '                    ▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐        \\    \| \     \ |     \     \   /     /\    \  |    |    |    ||    |   /          /\     \            ▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐     ',
      " \ '                  ▄▄▀▒▒▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐        \|    \  \     ||     ,_____/| /     /  \    \ |    |    |    ||    |  /     /\   / /\     |          ▄▄▀▒▒▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐     ',
      " \ '                ▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀██▀▒▌        |     \  |    ||     \--"\_|/|     |    |    ||    |    |    ||    | /     /\ \_/ / /    /|         ▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀██▀▒▌     ',
      " \ '               ▐▒▒▒▄▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄▒▒▌       |      \ |    ||     /___/|  |     |    |    ||    |    |    ||    ||     |  \|_|/ /    / |        ▐▒▒▒▄▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄▒▒▌    ',
      " \ '               ▌▒▒▐▄█▀▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐       |    |\ \|    ||     \____|\ |\     \  /    /||\    \  /    /||    ||     |       |    |  |        ▌▒▒▐▄█▀▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐    ',
      " \ '              ▐▒▒▒▒▒▒▒▒▒▒▒▌██▀▒▒▒▒▒▒▒▒▀▄▌      |____||\_____/||____ "     /|| \_____\/____/ || \ ___\/___ / ||____||\____\       |____|  /       ▐▒▒▒▒▒▒▒▒▒▒▒▌██▀▒▒▒▒▒▒▒▒▀▄▌   ',
      " \ '              ▌▒▀▄██▄▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌      |    |/ \|   |||    /_____/ | \ |    ||    | / \ |   ||   | / |    || |    |      |    | /        ▌▒▀▄██▄▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌   ',
      " \ '              ▌▀▐▄█▄█▌▄▒▀▒▒▒▒▒▒░░░░░░▒▒▒▐      |____|   |___|/|____|     | /  \|____||____|/   \|___||___|/  |____| \|____|      |____|/         ▌▀▐▄█▄█▌▄▒▀▒▒▒▒▒▒░░░░░░▒▒▒▐   ',
      " \ '             ▐▒▀▐▀▐▀▒▒▄▄▒▄▒▒▒▒▒░░░░░░▒▒▒▒▌     \(       )/    \( |_____|/      \(    )/        \(    )/      \(      \(          )/             ▐▒▀▐▀▐▀▒▒▄▄▒▄▒▒▒▒▒░░░░░░▒▒▒▒▌  ',
      " \ '             ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒░░░░░░▒▒▒▐                                                                                                       ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒░░░░░░▒▒▒▐   ',
      " \ '              ▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌                                                                                                        ▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌   ',
      " \ '              ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐       go  brr   brrrrrrrrrrr   brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr       ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐    ',
      " \ '               ▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▌                                                                                                          ▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▌    ',
      " \ '                 ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀                                                                                                             ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀     ',
      " \ '                ▐▀▒▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀                                                                                                              ▐▀▒▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀       ',
      " \ '           ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓                      ',
      " \ '           ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒                      ',
      " \ '          ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░                      ',
      " \ '          ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██                       ',
      " \ '          ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒                      ',
      " \ '          ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░                      ',
      " \ '          ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░                      ',
      " \ '             ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░                         ',



" save session from current branch name
function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':~:t')
  let path = empty(path) ? 'no-project' : path
  let branch = gitbranch#name()
  let branch = empty(branch) ? '' : '-' . branch
  return substitute(path . branch, '/', '-', 'g')
endfunction

" autocmd User        StartifyReady silent execute 'SLoad '  . GetUniqueSessionName()
autocmd VimLeavePre *             silent execute 'SSave! ' . GetUniqueSessionName()


" -------------- make nerdtree work at startup ------------------------------ "
" autocmd VimEnter *
"                 \   if !argc()
"                 \ |   Startify
"                 \ |   NERDTree
"                 \ |   wincmd w
"                 \ | endif


" --------------------------------------------------------------
" quickrun
" --------------------------------------------------------------
" outputte /message/log = the output don't capture logging
            " \ 'runner':'terminal',
            " \ 'runner/terminal/into':1,
            " \ 'outputter/buffer/close_on_empty' : 1,
            " \ 'outputter/loclist/into':1

            " \ 'runner': 'vimproc',
            " \ 'runner':'terminal',
            " \ 'runner/terminal/into':1,
let b:quickrun_config = {
            \ 'outputter':'error',
            \ 'outputter/error/success':'buffer',
            \ 'outputter/error/error':'loclist',
            \  }

"             \ 'outputter/loclist/errorformat':'&errorformat',
            " \ 'outputter/buffer/close_on_empty' : 1,

            " \ "hook/close_unite_quickfix/enable_hook_loaded" : 1,
            " \ "hook/unite_quickfix/enable_failure" : 1,
            " \ "hook/close_quickfix/enable_exit" : 1,
            " \ "hook/close_buffer/enable_failure" : 1,
            " \ "hook/close_buffer/enable_empty_data" : 1,
            " \ "outputter/buffer/split" : ":botright 8sp",
            " \ "outputter" : "multi:buffer:quickfix",
            " \	"outputter/buffer/append":0,
            " \	"outputter":"buffered",
            " \	"outputter/buffered/target":"buffer",
            " \	"outputter/buffer/split":"Uniqtab",
            " \	"runner/vimproc/updatetime":0,
            " \ 'outputter/buffer/close_on_empty' : 1,
            " \ 'outputter/message/log':0,
            " \ 'runner/terminal/into':1,
            " \ 'outputter/loclist/into':1
            " \ 'outputter': 'quickfix'
            " \ 'outputter/quickfix/into':1
" 'tex': {
"         \    'command': 'platex',
"         \    'exec': ['%c -output-directory %s:h %s', 'dvipdfmx -o %s:r.pdf %s:r.dvi', 'open %s:r.pdf']
"         \   },
" let g:quickrun_config['sql'] = {
" 		\ 'command': 'psql',
" 		\ 'exec': ['%c %o < %s'],
" 		\ 'cmdopt': '%{MakepgsqlCommandOptions()}',
" 		\ }

" let g:quickrun_config['R'] = {'command': 'R', 'exec': ['%c -s --no-save -f %s', ':%s/.\b//g']}
" stop quickrun with <Ctrl-c>
nnoremap <expr><silent> <C-h> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-h>"

" --------------------------------------------------------------
" fzf
" --------------------------------------------------------------
"let g:fzf_tags_command = 'ctags -R'
" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline '
" let g:fzf_layout = { 'down': '30%' }
" let g:fzf_commands_expect = 'alt-enter'

let $FZF_DEFAULT_OPTS='
    \ --color=dark --color=fg:#B0BEC5,bg:-1,hl:#FF9800,bg+:-1,hl+:1
    \ --color=info:5,prompt:5,pointer:12,marker:1,spinner:1,header:-1
    \ --layout=reverse  --margin=1,4'

" function! CreateCenteredFloatingWindow()
"     let width = min([&columns - 4, max([80, &columns - 20])])
"     let height = min([&lines - 4, max([20, &lines - 10])])
"     let top = ((&lines - height) / 2) - 1
"     let left = (&columns - width) / 2
"     let opts = {'relative': 'editor', 'row': top, 'col': left,
" 			 \ 'width': width, 'height': height, 'style': 'minimal'}
"     let top = "┏" . repeat("━", width - 2) . "┓"
"     let mid = "┃" . repeat(" ", width - 2) . "┃"
"     let bot = "┗" . repeat("━", width - 2) . "┛"
"     let lines = [top] + repeat([mid], height - 2) + [bot]
"     let s:buf = nvim_create_buf(v:false, v:true)
"     call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
"     call nvim_open_win(s:buf, v:true, opts)
"     set winhl=Normal:Floating
"     let opts.row += 1
"     let opts.height -= 2
"     let opts.col += 2
"     let opts.width -= 4
"     call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"     au BufWipeout <buffer> exe 'bw '.s:buf
" endfunction
" let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" -------------------------------------------------------------------------- "
" coc
" -------------------------------------------------------------------------- "
if has('nvim')
else
  if has('win32') "specific options for windows
      let g:coc_node_path = 'C:\Program Files\nodejs\node'
  endif
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " ---------------- coc color ------------------------------------------------ #
  highlight! CocWarningSign guifg=#F07178 guibg=NONE gui=NONE cterm=NONE
  highlight! CocErrorSign guifg=#F07178 guibg=NONE gui=NONE cterm=NONE
  highlight! CocInfoSign  guifg=#F07178 guibg=NONE gui=NONE cterm=NONE
  highlight! CocHintSign guifg=#F07178 guibg=NONE gui=NONE cterm=NONE

  highlight! CocWarningHighlight guibg=NONE gui=NONE cterm=NONE
  highlight! CocErrorHighlight guibg=NONE gui=NONE cterm=NONE
  highlight! CocInfoHighlight  guibg=NONE gui=NONE cterm=NONE
  highlight! CocHintHighlight guibg=NONE gui=NONE cterm=NONE

  " use location list
  let g:coc_global_extensions = [
              \ 'coc-highlight',
              \ 'coc-lists',
              \ 'coc-python',
              \ 'coc-json',
              \ 'coc-sql',
              \ 'coc-snippets',
              \ 'coc-css',
              \ 'coc-html',
              \ 'coc-diagnostic',
              \ 'coc-syntax'
              \ ]
              " \ 'coc-tag',
              " \ 'coc-tsserver',
              " \ 'coc-vimtex',
              " \ 'coc-sh',
              " \ 'coc-prettier',
  " See coc config in "coc-settings.json" with :CocConfig
      "diagnostic.enable":,
  " Map Alt-n to trigger completion: >
  " function! s:check_back_space() abort
  "     let col = col('.') - 1
  "     return !col || getline('.')[col - 1]  =~# '\s'
  " endfunction
  "
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  "
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  "
  " Highlight the symbol and its references when holding the cursor.
  " autocmd CursorHold * silent call CocActionAsync('highlight')
  "
  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')
  "
  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call CocAction('fold', <f-args>)
  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')
  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endif

" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
"           ___  ___  ___  ______ ______  _____  _   _  _____  _____
"           |  \/  | / _ \ | ___ \| ___ \|_   _|| \ | ||  __ \/  ___|
"           | .  . |/ /_\ \| |_/ /| |_/ /  | |  |  \| || |  \/\ `--.
"           | |\/| ||  _  ||  __/ |  __/   | |  | . ` || | __  `--. \
"           | |  | || | | || |    | |     _| |_ | |\  || |_\ \/\__/ /
"           \_|  |_/\_| |_/\_|    \_|     \___/ \_| \_/ \____/\____/
"                ______  _      _   _  _____  _____  _   _  _____
"                | ___ \| |    | | | ||  __ \|_   _|| \ | |/  ___|
"                | |_/ /| |    | | | || |  \/  | |  |  \| |\ `--.
"                |  __/ | |    | | | || | __   | |  | . ` | `--. \
"                | |    | |____| |_| || |_\ \ _| |_ | |\  |/\__/ /
"                \_|    \_____/ \___/  \____/ \___/ \_| \_/\____/
"
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "

" " --------------------------------------------------------------------------
" " -- illuminate
" " -- -----------------------------------------------------------------------
" nnoremap <Down> :lua require"illuminate".next_reference{wrap=true}<cr>
" nnoremap <Up> :lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>
" nnoremap <A-s> :lua require"illuminate".toggle_pause()<cr>

" --------------------------------------------------------------------------
" -- airline
" -- -----------------------------------------------------------------------
if has("nvim")
else
nmap <silent> <A-q> <Plug>AirlineSelectTab1
nmap <silent> <A-w> <Plug>AirlineSelectTab2
nmap <silent> <A-e> <Plug>AirlineSelectTab3
nmap <silent> <A-r> <Plug>AirlineSelectTab4
nmap <silent> <A-t> <Plug>AirlineSelectTab5
nmap <silent> <A-y> <Plug>AirlineSelectTab6
nmap <silent> <A-u> <Plug>AirlineSelectTab7
nmap <silent> <A-i> <Plug>AirlineSelectTab8
nmap <silent> <A-o> <Plug>AirlineSelectTab9
nmap <silent> <A-o> <Plug>AirlineSelectTab9
nmap <silent> <A-p> <Plug>AirlineSelectTab0
nmap <silent> <A-[> <Plug>AirlineSelectPrevTab
nmap <silent> <A-]> <Plug>AirlineSelectNextTab
endif


" --------------------------------------------------------------------------
" -- cokeline
" -- -----------------------------------------------------------------------
if has("nvim")
nmap <silent> <A-q> <Plug>(cokeline-focus-1)
nmap <silent> <A-w> <Plug>(cokeline-focus-2)
nmap <silent> <A-e> <Plug>(cokeline-focus-3)
nmap <silent> <A-r> <Plug>(cokeline-focus-4)
nmap <silent> <A-t> <Plug>(cokeline-focus-5)
nmap <silent> <A-y> <Plug>(cokeline-focus-6)
nmap <silent> <A-u> <Plug>(cokeline-focus-7)
nmap <silent> <A-i> <Plug>(cokeline-focus-8)
nmap <silent> <A-o> <Plug>(cokeline-focus-9)
nmap <silent> gr10 <Plug>(cokeline-focus-10)
nmap <silent> gr11 <Plug>(cokeline-focus-11)
nmap <silent> gr12 <Plug>(cokeline-focus-12)
nmap <silent> gr13 <Plug>(cokeline-focus-13)
nmap <silent> gr14 <Plug>(cokeline-focus-14)
nmap <silent> gr15 <Plug>(cokeline-focus-15)
nmap <silent> gr16 <Plug>(cokeline-focus-16)
nmap <silent> gr17 <Plug>(cokeline-focus-17)
nmap <silent> gr18 <Plug>(cokeline-focus-18)
nmap <silent> gr19 <Plug>(cokeline-focus-19)
nmap <silent> gr20 <Plug>(cokeline-focus-20)
nmap <silent> gr21 <Plug>(cokeline-focus-21)
nmap <silent> gr22 <Plug>(cokeline-focus-22)
nmap <silent> gr23 <Plug>(cokeline-focus-23)
nmap <silent> gr24 <Plug>(cokeline-focus-24)
nmap <silent> gr25 <Plug>(cokeline-focus-24)
nmap <silent> gr26 <Plug>(cokeline-focus-24)
nmap <silent> gr27 <Plug>(cokeline-focus-24)
nmap <silent> gr28 <Plug>(cokeline-focus-24)
nmap <silent> gr29 <Plug>(cokeline-focus-24)
" Switch the position of the current buffer with the i-th buffer
nmap <silent> <A-Q> <Plug>(cokeline-switch-1)
nmap <silent> <A-W> <Plug>(cokeline-switch-2)
nmap <silent> <A-E> <Plug>(cokeline-switch-3)
nmap <silent> <A-R> <Plug>(cokeline-switch-4)
nmap <silent> <A-T> <Plug>(cokeline-switch-5)
nmap <silent> <A-Y> <Plug>(cokeline-switch-6)
nmap <silent> <A-U> <Plug>(cokeline-switch-7)
nmap <silent> <A-I> <Plug>(cokeline-switch-8)
nmap <silent> <A-O> <Plug>(cokeline-switch-9)
" Focus the previous/next buffer
nmap <silent> <A-[> <Plug>(cokeline-focus-prev)
nmap <silent> <A-]> <Plug>(cokeline-focus-next)
" Switch the position of the current buffer with the previous/next buffer
nmap <silent> <A-{> <Plug>(cokeline-switch-prev)
nmap <silent> <A-}> <Plug>(cokeline-switch-next)
endif


" --------------------------------------------------------------------------
" -- diffview
" -- -----------------------------------------------------------------------
nnoremap <leader>vo :DiffviewOpen<space>
nnoremap <leader>vd :DiffviewOpen develop<CR>
nnoremap <leader>vc :DiffviewClose<CR>

" --------------------------------------------------------------------------
" -- fugitive
" -- -----------------------------------------------------------------------
nnoremap <leader>G :Git<space>
nnoremap <leader>ga :Git add -u<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gm :Git commit<CR>
nnoremap <leader>gp :Git pull<CR>
nnoremap <leader>gg :Git push<CR>
nnoremap <leader>gc :Git checkout <C-r>+
"
" --------------------------------------------------------------------------
" -- lsp
" -- -----------------------------------------------------------------------
nnoremap <silent> <space>d :vsplit \| lua vim.lsp.buf.definition()<cr>
nnoremap <silent> <space>s :split \| lua vim.lsp.buf.definition()<cr>
nnoremap <silent> <space>g <cmd>tabnew%<cr> <C-o> <cmd>lua vim.lsp.buf.definition()<cr>

" --------------------------------------------------------------------------
" -- Lspsaga
" -- -----------------------------------------------------------------------
 " if has('nvim')
	" -- lsp provider to find the cursor word definition and reference
	" nnoremap <silent> cd <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
	" -- or use command LspSagaFinder
	" nnoremap <silent> gy :lspsaga lsp_finder<CR>

	" -- code action
	" nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
	" vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

	" -- show hover hover
	" nnoremap <silent>gh :Lspsaga hover_doc<CR>

	" -- scroll down hover doc or scroll in definition preview
	" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
	" -- scroll up hover doc
	" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

	" -- show signature help
	" nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

	" -- preview definition
	" nnoremap <silent> gl <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

	" -- show diagnostic
	" nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
	" autocmd BufReadPost * map ga :Lspsaga show_line_diagnostics<CR>
	" nnoremap <silent> ga <Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

	" -- jump diagnostic
	" nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
	" nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" endif

" --------------------------------------------------------------------------
" -- Grepper
" -- -----------------------------------------------------------------------
nnoremap <A-g> :Grepper<CR>
nmap gn  <plug>(GrepperOperator)
xmap gn  <plug>(GrepperOperator)

" --------------------------------------------------------------------------
" -- Telescope
" -- -----------------------------------------------------------------------
 if has('nvim')
	" Find files using Telescope command-line sugar.
	" nnoremap <leader>t :Telescope <CR>
	" nnoremap fn <cmd>Telescope find_files<cr>
	" nnoremap <space>n <cmd>Telescope git_files<cr>
	" nnoremap fn <cmd>Telescope live_grep<cr>
	nnoremap fn <cmd>Telescope grep_string<cr>
	nnoremap <space>b <cmd>Telescope buffers<cr>
	" nnoremap <space>/ <cmd>lua require('telescope.builtin').search_history()<cr>
	" nnoremap <space>m <cmd>lua require('telescope.builtin').marks()<cr>
	nnoremap x <cmd>lua require('telescope.builtin').treesitter()<cr>
	nnoremap <C-l> <cmd>lua require('telescope.builtin').loclist()<cr>

	" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

	" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
	" nnoremap <space>n :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
	nnoremap <space>n :lua require'telescope.builtin'.find_files()<cr>
endif

" " --------------------------------------------------------------------------
" " -- Compe
" " -- -----------------------------------------------------------------------
"  if has('nvim')
" 	inoremap <silent><expr> <C-Space> compe#complete()
" 	inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" 	inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" 	inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" 	inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" endif

" --------------------------------------------------------------------------
" -- YankAssassin
" -- -----------------------------------------------------------------------
augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{ higroup="IncSearch", timeout=200 }
  augroup END

" --------------------------------------------------------------------------
" -- QFEnter
" -- -----------------------------------------------------------------------
if has('nvim')
	let g:qfenter_keymap = {}
	let g:qfenter_keymap.vopen = ['<C-v>']
	let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
	let g:qfenter_keymap.topen = ['<C-t>']
endif


if has('nvim')
  " --------------------------------------------------------------------
  "  rnvimr
  " --------------------------------------------------------------------
  nnoremap <silent> <space>r :RnvimrToggle<CR>
  tnoremap <silent> <space>r <C-\><C-n>:RnvimrToggle<CR>

  " Resize floating window by all preset layouts
  " tnoremap <silent> <leader>ri <C-\><C-n>:RnvimrResize<CR>

  " Resize floating window by special preset layouts
  " tnoremap <silent> <leader>rl <C-\><C-n>:RnvimrResize 1,8,9,11,5<CR>

  " Hide the files included in gitignore
  let g:rnvimr_hide_gitignore = 1
  " Make Neovim wipe the buffers corresponding to the files deleted by Ranger
  let g:rnvimr_enable_bw = 1

  " Link CursorLine into RnvimrNormal highlight in the Floating window
  highlight link RnvimrNormal CursorLine

  " Map Rnvimr action
  let g:rnvimr_action = {
	      \ 'i': 'NvimEdit edit',
	      \ 'e': 'NvimEdit drop',
	      \ '<C-x>': 'NvimEdit split',
	      \ '<C-v>': 'NvimEdit vsplit',
	      \ 'gw': 'JumpNvimCwd',
	      \ 'yw': 'EmitRangerCwd'
	      \ }

endif

if has('nvim')

	" --------------------------------------------------------------------
	"  LUA TREE
	" --------------------------------------------------------------------
	nnoremap <A-m> :NvimTreeToggle<CR>
	nnoremap <leader>t :NvimTreeRefresh<CR>
	nnoremap <leader>n :NvimTreeFindFile<CR>
else
	" ------------------------------------------------------------------- "
	" NERDTree
	" ------------------------------------------------------------------- "
	map <A-m> :NERDTreeToggle<CR>
	function! NERDTreeYankCurrentNode()
			let n = g:NERDTreeFileNode.GetSelected()
			if n != {}
					call setreg('"', n.path.str())
			endif
	endfunction
endif

" -------------------------------------------------------------------------- "
" COMPLETION
" -------------------------------------------------------------------------- "
" if has('nvim')
"   " Because NeoVim's menu completions are in a vertical pum
"   cnoremap <expr> <C-k> pumvisible() ? "\<C-p>"       : "\<C-k>"
"   cnoremap <expr> <Tab> pumvisible() ? "\<C-y>"       : "\<Tab>"
"   cnoremap <expr> <C-f> pumvisible() ? "\<C-e>"       : "\<Right>"
"   cnoremap <expr> <C-p> pumvisible() ? "\<Up><C-p>"   : "\<Up>"
"   cnoremap <expr> <C-n> pumvisible() ? "\<C-e><Down>" : "\<Down>"
"   set cpoptions-=_ " Makes cw/cW include the whitespace after the word
"   set shada=!,'1000,<50,s10,h
" endif

" -------------------------------------------------------------
"  Trouble nvim
"  -----------------------------------------------------------
if has('nvim')
    nnoremap <leader>xx <cmd>TroubleToggle<cr>
    nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
    nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
    nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
    nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
    nnoremap gR <cmd>TroubleToggle lsp_references<cr>
endif

" -------------------------------------------------------------
"  vim sneak
"  ------------------------------------------------------------
if has("nvim")
else
  nmap f <Plug>Sneak_s
  nmap F <Plug>Sneak_S
  " visual-mode
  xmap f <Plug>Sneak_s
  xmap F <Plug>Sneak_S
  " operator-pending-mode
  omap f <Plug>Sneak_s
  omap F <Plug>Sneak_S
  let g:sneak#label = 1

  map x <Plug>Sneak_f
  map X <Plug>Sneak_F
  map t <Plug>Sneak_t
  map T <Plug>Sneak_T
endif

" -------------------------------------------------------------
"  ALt key activation
"  -----------------------------------------------------------
if has('nvim')
else
	execute "set <M-'> =\e'"
	execute "set <M-d> =\ed"
	execute "set <M-k> =\ek"
	execute "set <M-j> =\ej"
	execute "set <M-H> =\eH"
	execute "set <M-h> =\eh"
	execute "set <M-l> =\el"
	execute "set <M-L> =\el"
	execute "set <M-;> =\e;"
	execute "set <M-g> =\en"
	execute "set <M-g> =\en"
	" execute "set <M-c> =\ep"
	" execute "set <M-p> =\ep"
" execute "set <M-b> =\en"
endif

" --------- Wipe Grep ------------------------------------------------------- #
" nnoremap <M-'> :WipeReg<cr>

" ------------------- Doge -------------------------------------------------- #
" nnoremap <A-d> :DogeGenerate<cr>

" -------------------- buffergator ----------------------------------------- "
" map <M-b> :BuffergatorToggle<CR>

" -------------------------------------------------------------------------- "
" smoothie
" -------------------------------------------------------------------------- "
" nmap <Down> :call  smoothie#downwards()<CR>
" nmap <Up> :call  smoothie#upwards()<CR>"
" nmap <Down> <C-d>
" nmap <Up> <C-u>

" -------------------------------------------------------------------------- "
" TagBar
" -------------------------------------------------------------------------- "
nnoremap <leader>p :TagbarTogglePause<CR> "Freezes/Unfreezes the Tagbar Windowsf

" -------------------------------------------------------------------------- "
" workspace
" -------------------------------------------------------------------------- "
" nnoremap <leader>w :ToggleWorkspace<CR>
" nnoremap <leader>bc :CloseHiddenBuffers<CR>
" nnoremap <leader>a :ToggleAutosave<CR>

" -------------------------------------------------------------------------- "
" indentwise
" -------------------------------------------------------------------------- "
map [= <Plug>(IndentWisePreviousEqualIndent)
map ]= <Plug>(IndentWiseNextEqualIndent)
" map <M-L> <Plug>(IndentWisePreviousGreaterIndent)
" map <M-H> <Plug>(IndentWisePreviousLesserIndent)
" map <M-h> <Plug>(IndentWiseNextLesserIndent)
" map <M-l> <Plug>(IndentWiseNextGreaterIndent)
" map <M-E> <Plug>(IndentWisePreviousAbsoluteIndent)
" map <M-e> <Plug>(IndentWiseNextAbsoluteIndent)
" map <M-e> <Plug>(IndentWiseBlockScopeBoundaryBegin)
" map <M-e> <Plug>(IndentWiseBlockScopeBoundaryEnd)"

" -------------------------------------------------------------------------- "
" Sideway
" -------------------------------------------------------------------------- "
" to stay in container
" https://github.com/jeetsukumaran/vim-argwrap/commit/30edd6ba0a654d22db62359e4bca9d174f1eead5
" nnoremap <Leader>h :SidewaysLeft<cr>
" nnoremap <Leader>l :SidewaysRight<cr>
" nmap <leader>si <Plug>SidewaysArgumentInsertBefore
" nmap <leader>sa <Plug>SidewaysArgumentAppendAfter
" nmap <leader>sI <Plug>SidewaysArgumentInsertFirst
" nmap <leader>sA <Plug>SidewaysArgumentAppendLast

" -------------------------------------------------------------------------- "
" wrap
" -------------------------------------------------------------------------- "
nnoremap <silent> <M-;> :ArgWrap<CR><Esc>

" -------------------------------------------------------------------------- "
" vimtweak
" -------------------------------------------------------------------------- "
" Window transparency shortcuts
" let g:dll = globpath(&rtp, 'vimtweak.dll')
" function Transparency(v)
"   call libcallnr("vimtweak64.dll", "SetAlpha", 255-a:v)
" endfunction
" nnoremap <silent> <leader>a0 :call Transparency(0)<CR>
" nnoremap <silent> <leader>a1 :call Transparency(10)<CR>
" nnoremap <silent> <leader>a2 :call Transparency(20)<CR>
" nnoremap <silent> <leader>a3 :call Transparency(30)<CR>
" nnoremap <silent> <leader>a4 :call Transparency(40)<CR>
" nnoremap <silent> <leader>a5 :call Transparency(50)<CR>
" nnoremap <silent> <leader>a6 :call Transparency(60)<CR>
" nnoremap <silent> <leader>a7 :call Transparency(70)<CR>
" nnoremap <silent> <leader>mm :call libcallnr("vimtweak64.dll", "EnableMaximize", 1)<CR>
" nnoremap <silent> <leader>ms :call libcallnr("vimtweak64.dll", "EnableMaximize", 0)<CR>
" nnoremap <silent> <leader>mt :call libcallnr("vimtweak64.dll", "EnableTopMost", 1)<CR>
" nnoremap <silent> <leader>mp :call libcallnr("vimtweak64.dll", "EnableTopMost", 0)<CR>

" -------------------------------------------------------------------------- "
" vim-textobj-entire
" -------------------------------------------------------------------------- "

" nmap ae <plug>(textobj-entire-a)
" nmap <leader>ae <plug>(textobj-entire-i)

" -------------------------------------------------------------------------- "
" submersive
" -------------------------------------------------------------------------- "
nmap o <plug>(SubversiveSubstitute)
nmap oo <plug>(SubversiveSubstituteLine)
nmap O <plug>(SubversiveSubstituteToEndOfLine)
" Substitute Over Range Motion
nmap op <plug>(SubversiveSubstituteRange)
xmap op <plug>(SubversiveSubstituteRange)
nmap owp <plug>(SubversiveSubstituteWordRange)
" need to confirm substitution
nmap <leader>c <plug>(SubversiveSubstituteRangeConfirm)
xmap <leader>c <plug>(SubversiveSubstituteRangeConfirm)
nmap <leader>co <plug>(SubversiveSubstituteWordRangeConfirm)

" -------------------------------------------------------------------------- "
" latex
" -------------------------------------------------------------------------- "
map <C-s> :call Synctex()<cr>
nnoremap <A-c> :VimtexCompile<cr>
" :copen to see error
nnoremap <A-a> :copen<cr>
nnoremap <space>j :ccl<CR>
nnoremap <A-s> <plug>(vimtex-cmd-create)

" -------------------------------------------------------------------------- "
" animate
" -------------------------------------------------------------------------- "
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>

" -------------------------------------------------------------------------- "
" repl
" -------------------------------------------------------------------------- "
" nnoremap <leader>r :REPLToggle<CR>
" autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
" autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
" autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>

" --------------------------------------------------------------------------- #
"" QuickRun
" -------------------------------------------------------------------------- "
"nnoremap <M-i> :QuickRun -mode n<CR>
"vnoremap  <M-i> :QuickRun -mode v<CR>

" -------------------------------------------------------------------------- "
" Fzf
" -------------------------------------------------------------------------- "
" nnoremap <Leader> <C-w>
" let g:fzf_action = {
" 	\ 'C-t': 'tab split',
" 	\ 'C-s': 'split',
" 	\ 'C-v': 'vsplit' }
" nnoremap <leader>r :Rg<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap mm :Marks<CR>
" nnoremap <leader>m :BLines<CR>
" nnoremap <C-o> :FzfPreviewProjectFiles<CR>
" nmap <leader>f :Files<CR>
" nmap <leader>fi :find<space>
" nmap <leader>b :Buffers<CR>
" nmap <Leader>: :History:<CR>
" nmap <Leader>gm :Maps<CR>

" -------------------------------------------------------------------------- "
"  symboloutline
" --------------------------------------------------------------------------
" nnoremap <leader>S :SymbolsOutline<CR>

" -------------------------------------------------------------------------- "
" pycodestyle
" -------------------------------------------------------------------------- "
" let g:pylsp.plugins.pycodestyle.ignore = []
" let g:pylsp.plugins.pycodestyle.maxLineLength = 200

" -------------------------------------------------------------------------- "
" coc
" -------------------------------------------------------------------------- "
if has('nvim')
else
	inoremap <silent><expr> <M-g> coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	let g:coc_snippet_next = '<TAB>'
	inoremap <silent><expr> <TAB>
				\ pumvisible() ? coc#_select_confirm() :
				\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	let g:coc_snippet_next = '<TAB>'
	" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	" nmap  <silent><C-c> :CocEnable<CR>
	" nmap <M-c> :CocDiagnostics<CR>
	" nmap <silent> <M-p> <Plug>(coc-action-diagnosticPreview)
	nmap <silent> gs <Plug>(coc-action-diagnosticToggle)
	nmap <silent> gi <Plug>(coc-diagnostic-info)
	nmap <silent> gb <Plug>(coc-diagnostic-prev)
	nmap <silent> gn <Plug>(coc-diagnostic-next)
	" nmap <silent> me <Plug>(coc-diagnostic-error)
	nmap <silent> gh <Plug>(coc-action-jumpDefinition)
	nmap <silent> ge <Plug>(coc-action-jumpDeclaration)
	" nnoremap <silent> gr :call :<C-u>show_documentation<CR> " show Documentation
	nnoremap <silent><nowait> ga  :<C-u>CocList diagnostics<cr> " Show all diagnostics.
	nnoremap <silent><nowait> <Leader>u  :<C-u>CocList extensions<cr> " Manage extensions.
	" Symbol renaming.
	" nmap <leader>rn <Plug>(coc-rename)
	" xmap <leader>f  <Plug>(coc-format-selected)
	" nmap <leader>f  <Plug>(coc-format-selected)
endif

" -------------------------------------------------------------
"  hop
"  ------------------------------------------------------------
" nnoremap <silent><nowait> f <cmd>lua require'hop'.hint_words()

" -------------------------------------------------------------------------- "
" pythonsense
" -------------------------------------------------------------------------- "
if has('nvim')
else
  "  keep default mapping listed below
  " map <buffer> ac <Plug>(PythonsenseOuterClassTextObject)
  " map <buffer> ic <Plug>(PythonsenseInnerClassTextObject)
  " map <buffer> af <Plug>(PythonsenseOuterFunctionTextObject)
  " map <buffer> if <Plug>(PythonsenseInnerFunctionTextObject)
  " map <buffer> ad <Plug>(PythonsenseOuterDocStringTextObject)
 " map <buffer> id <Plug>(PythonsenseInnerDocStringTextObject)
  " map <buffer> ]] <Plug>(PythonsenseStartOfNextPythonClass)
  " map <buffer> ][ <Plug>(PythonsenseEndOfPythonClass)
  " map <buffer> [[ <Plug>(PythonsenseStartOfPythonClass)
  " map <buffer> [] <Plug>(PythonsenseEndOfPreviousPythonClass)
  autocmd BufReadPost * map mj <Plug>(PythonsenseStartOfNextPythonFunction)
  autocmd BufReadPost * map Mj <Plug>(PythonsenseEndOfPythonFunction)
  autocmd BufReadPost * map mk <Plug>(PythonsenseStartOfPythonFunction)
  autocmd BufReadPost * map Mk <Plug>(PythonsenseEndOfPreviousPythonFunction)
endif

" --------------------------------------------------------------------------- #
"  -----------------<< FineCmdline >>---------------------------------------- #
" --------------------------------------------------------------------------- #
" nnoremap : <cmd>FineCmdline<CR>
" nnoremap <leader>r yiw<cmd>FineCmdline<CR>%s///gc<left><left><left><left><C-r>"<right>
" nnoremap <C-f> <cmd>FineCmdline<CR>find<space>

" -------------------------------------------------------------------------- "
" luasnip
" -------------------------------------------------------------------------- "

function! Template_1()
  let att  = getreg('a')
  exe 'normal!o@property'
  exe 'normal!odef ' . att . '(self):'
  exe 'normal!o    """'
  exe 'normal!<<o    Basic getter'
  exe 'normal!o    """'
  exe 'normal!o    return self._' . att
  exe 'normal!o'
  exe 'normal!o@' . att . '.setter'
  exe 'normal!o@beartype'
  exe 'normal!odef ' . att . '(self, in_' . att . '):'
  exe 'normal!o    self._' . att . ' = in_' . att
  exe 'normal!o'
endfunction


nnoremap <leader>sa g^f_l"aye/@property<CR>k:call Template_1()<CR>11k<10j....>10jjj>3j8j>>
" 8k<8j....>8<CR>j>3<CR>8j>>




" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "
"                 _____  _____  _      _____ ______  _____
"                /  __ \|  _  || |    |  _  || ___ \/  ___|
"                | /  \/| | | || |    | | | || |_/ /\ `--.
"                | |    | | | || |    | | | ||    /  `--. \
"                | \__/\\ \_/ /| |____\ \_/ /| |\ \ /\__/ /
"                 \____/ \___/ \_____/ \___/ \_| \_|\____/
" _____________________________________________________________________________ "
" _____________________________________________________________________________ "

" ------------------------------------------------------------------------- "
" ------------------- colorscheme ------------------------------------------- #
" ------------------------------------------------------------------------- "

if has('nvim')
    " let g:enfocado_style = 'nature' " Available: `nature` or `neon`.
    " let g:enfocado_plugins = [
    "   \   'cmp',
    "   \   'gitsigns',
    "   \   'indent-blankline',
    "   \   'lsp',
    "   \   'telescope',
    "   \ ]
    " colorscheme enfocado
    colorscheme ayu
    " colorscheme night-owl
    " colorscheme kanagawa
    " colorscheme nightfly
else
    colorscheme material
    let $BAT_THEME='material'

    " colorscheme ayu
    " let ayucolor="mirage"   " for dark version of theme
endif


set background=dark

set cursorline                               " Highlight current line
" hi CursorLine guibg=#0D1016
" hi TabLineFill guibg=#0D1016

" -------------------------------------------------------------
"  vim sneak
"  ------------------------------------------------------------
" highlight Sneak guifg=#14191F guibg=#F29718
" highlight SneakScope guifg=#14191F guibg=#F29718

" ------------------------------------------------------------------------- "
" ------------------- LSP --------------------------------------------------- #
" ------------------------------------------------------------------------- "
 if has('nvim')
	" hi link LspFloatWinBorder guifg='#F29718' guibg='#14191F'
	" hi link LspSagaHoverBorder guifg='#F29718' guibg='#14191F'
	" hi link LspSagaSignatureHelpBorder guifg='#F29718' guibg='#14191F'
	" hi link LspSagaDefPreviewBorder guifg='#F29718' guibg='#14191F'
	" hi link LspLinesDiagBorder guifg='#F29718' guibg='#14191F'
	let g:LspDiagnosticsSignError = ""
	let g:LspDiagnosticsSignWarning = ""
	let g:LspDiagnosticsSignInformation = ""
	let g:LspDiagnosticsSignHint = ""
endif

" ------------------------------------------------------------------------- "
" ------------------- column limit ---------------------------------------- "
" ------------------------------------------------------------------------- "
" highlight ColorColumn guibg= #213B47
" set colorcolumn=80
" set colorcolumn=90
" set colorcolumn=100

" ------------------------------------------------------------------------- "
" ------------------- folding --------------------------------------------- "
" ------------------------------------------------------------------------- "
" highlight! Folded guibg=NONE guifg=#6c71c4 gui=underline
" highlight! FoldColumn guibg=darkgrey guifg=#000000

" " ------------------------------------------------------------------------- "
" " ---------------- search color ------------------------------------------- "
" " ------------------------------------------------------------------------- "
" hi! Search gui=NONE guibg=#B0BEC5 guifg=#000000
" hi! IncSearch gui=NONE guibg=#00BCD4 guifg=#B20602

" ------------------------------------------------------------------------- "
" ----------------- current line number color ----------------------------- "
" ------------------------------------------------------------------------- "
" hi! CursorLineNr guifg=#F29718 guibg=#000000
" hi! LineNr guifg=#009688 guibg=NONE

" ------------------------------------------------------------------------- "
" ---------------------- VertSplit ---------------------------------------- "
" ------------------------------------------------------------------------- "
" hi VertSplit guibg=NONE guifg=#000000
" hi TjbLine guibg=#000000 guifg=#073642
" hi! Pmenu guibg=#b58900 guibg=#000000

" --------- startify color ---------------------------------------
" highlight! StartifyHeader guifg=#2aa198
" highlight! StartifyFooter guifg=#2aa198

" -------------------------------------------------------------
"  vim signature
"  ------------------------------------------------------------
" hi SignatureMarkText guifg=#B0BEC5 guibg=NONE

" -------------------------------------------------------------------------- #
"  ----------------- treesitter-context --------------------------------------- #
" -------------------------------------------------------------------------- #
highlight! TreesitterContext guibg=#383E4C

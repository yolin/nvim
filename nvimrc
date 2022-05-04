"%s/\(xxxx\)/(\1)/gci
" fist number
":let i=0|g/^/s//\=i.','/ |let i+=1
":%s/^/\=line('.').','/
":%!python -m json.tool


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.nvim/plugged')
"
" original repos on github
"Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
"Plug 'mhinz/vim-signify'
"Bundle 'Townk/vim-autoclose'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/CRefVim'
Plug 'pangloss/vim-javascript'
"Plug 'ryanss/vim-hackernews'
" Plug 'kdurant/LanguageRefVim'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'justinmk/vim-syntax-extra'

"scroll
Plug 'terryma/vim-smooth-scroll'

Plug 'junegunn/limelight.vim'

"Note
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

"paste
Plug 'ConradIrwin/vim-bracketed-paste'

" Plug 'kshenoy/vim-signature'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/MultipleSearch'
Plug 'terryma/vim-multiple-cursors'

"snip
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

"yank
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'

"comment
Plug 'tpope/vim-commentary'

"python PEP8 check
" Plug 'nvie/vim-flake8'
" Plug 'Vimjas/vim-python-pep8-indent'

Plug 'roxma/vim-paste-easy'

Plug 'vimwiki/vimwiki'

Plug 'JamshedVesuna/vim-markdown-preview'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

"coc config
" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" 
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"


"vim-markdown-preview, need install grip(pip install grip), and apt install xdotool
let vim_markdown_preview_github=1

"let g:molokai_original = 1
"let g:rehash256 = 1
"set termguicolors

let g:EasyClipUseCutDefaults = 0

"MultieSearch
let g:MultipleSearchMaxColors=13
let g:MultipleSearchColorSequence="red,yellow,blue,green,magenta,lightred,cyan,lightyellow,gray,brown,lightblue,darkmagenta,darkcyan"
let g:MultipleSearchTextColorSequence="white,black,white,black,white,black,black,black,black,white,black,white,white"

"ag setting
let g:ag_prg="/usr/bin/ag --column"


"
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

" set leader to ,
"let mapleader=","
let g:mapleader=","

" general
set history=50 " keep 50 lines of command line history
set number " enable line numbers
set autoindent " enable autoindent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4 " insert 2 spaces for a tab
set expandtab " use space instead of tab
set softtabstop=4
set shiftwidth=4 " the number of space characters inserted for indentation
set shell=sh

"----------yolin molokai-----------
colors gruvbox " vim color scheme
let g:gruvbox_contrast_dark = 'hard'
"-------------- yolin end---------------

"----------yolin papaercolor-----------
set background=dark
"colorscheme PaperColor
"--------------yolin end----------

set autoread " auto read when file is changed from outside
set history=50 " keep 50 lines of command line history
set mouse=a " mouse support
"if has("gui_running")
"  if has("gui_gtk2")
"    set guifont=Inconsolata\ 16
"  elseif has("gui_macvim")
"    set guifont=Menlo\ Regular:h16
"  elseif has("gui_win32")
"    set guifont=Consolas:h13:cANSI
"  endif
"  set t_Co=256 " 256 color mode
"endif
"if has("gui_macvim") " macvim shift movement
"  let macvim_hig_shift_movement = 1
"endif
"set cursorline " highlight current line , slower....disable it
set clipboard=unnamed " use +
"set clipboard+=unnamedplus "use *
set showmatch " Cursor shows matching ) and }
set showmode " Show current mode
" disable sound on errors
"set noeb vb t_vb=
"
" status line {
set laststatus=2
set statusline=%<%F\ [%{&ff}]%h%m%r%y%=%-14.(%l,%c%V%)\ %P
" --- ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" --- PowerLine
let g:Powerline_symbols = 'fancy' " require fontpatcher

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column

" --- tagbar
"let g:tagbar_left=1

" ------------------------------------------------yolin add --------------------------------------------
set nocompatible

filetype on
filetype plugin on
filetype indent on
syntax on

set ruler
set tags=tags;
set write
set cmdheight=1
"set t_Co=256
set backspace=2
set ls=2
set magic "can change buffer not save
set hid
set ignorecase
set tagstack
"set wildmenu
"set esckeys
" Sets how many lines of history VIM has to remember.vimrc
set history=700
set display=lastline
set virtualedit=block
" Set to auto read when a file is changed from the outside
if exists("&autoread")
set autoread
endif 

"no sound on errors
set noerrorbells
set novisualbell

set hlsearch
set autochdir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
" set nobackup
" set nowb
set noswapfile

set backupdir=~/CSCOPE/.vimtmp
set directory=~/CSCOPE/.vimtmp
set undofile
set undodir=~/CSCOPE/.vimtmp
set undolevels=1000
set undoreload=10000

"set lbr
set tw=500
set wrap "Wrap lines
"list space/tab
set list
set winaltkeys=no

set listchars=tab:\|\ 

"a.vim
let g:alternateSearchPath='sfr:./h,sfr:./include,sfr:./source,sfr:./src,sfr:./,sfr:./inc,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

"auto remove blank on line end
"autocmd FileType c,cpp,java,php,perl,python,ruby,sh,html,htm autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
"autocmd FileType python setlocal foldmethod=indent smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
"
let g:EasyMotion_leader_key='f'

"NERD.vim
let NERDTreeWinPos="left"
"let NERDTreeMouseMode=3
"let NERDTreeShowBookmarks=1
"autorun
"autocmd VimEnter * NERDTreeToggle
"autocmd VimEnter * wincmd p


"mapping
nnoremap <space><space> :noh<cr>:call MySwitchToWorkBuf()<cr>
nnoremap <leader><space> <esc>:Limelight0.8<cr>

nnoremap `<esc> :qa<cr>

noremap <leader><xF1> <esc>:NERDTreeFind<cr>
noremap <xF1> <esc>:NERDTreeToggle<cr>
noremap <xF2> <esc>:TagbarToggle<cr>
"noremap <xF3> <esc>:!grep --color -irsnI <c-r>+ <c-r>=getcwd()<cr>
noremap <xF3> <esc>:Ag "<c-r>+" <c-r>=getcwd()<cr>
"noremap <F4> <esc>:set noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
noremap <F4> <esc>:set expandtab!<cr>
noremap <F5> <esc>:Search <c-r>+<cr>
noremap <F6> <esc>:SearchReinit<cr>:SearchReset<cr>
"F7 for vim-flake8 use
noremap <F7> <esc>:BookmarkShowAll<cr>
noremap <F8> <esc>:call MySwitchToWorkBuf()<cr>:BufExplorer<cr>
"noremap <F9> <esc>:!~/.nvim/gencs.sh <c-r>=getcwd()<cr>
noremap <F10> <esc>:call ReloadAllCSCOPE("ISD2")<cr>
noremap <F11> <esc>:call ReloadAllCSCOPE("SmartOpenWrt")<cr>
noremap <F12> <esc>:call ReloadCSCOPE()<cr>


inoremap <xF1> <esc>:call MySwitchToWorkBuf()<cr>:NERDTreeToggle<cr>
inoremap <leader><c-xF1> <esc>:NERDTreeFind<cr>
inoremap <xF2> <esc>:TagbarToggle<cr>
inoremap <xF3> <esc>:Ag "<c-r>+" <c-r>=getcwd()<cr>
inoremap <F4> <esc>:set expandtab!<cr>
inoremap <F5> <esc>:Search <c-r>+<cr>
inoremap <F6> <esc>:SearchReinit<cr>:SearchReset<cr>
"F7 for vim-flake8 use
inoremap <F7> <esc>:BookmarkShowAll<cr>
inoremap <F8> <esc>:call MySwitchToWorkBuf()<cr>:BufExplorer<cr>
"inoremap <F9> <esc>:!~/.nvim/gencs.sh <c-r>=getcwd()<cr>
inoremap <F10> <esc>:call ReloadAllCSCOPE("ISD2"")<cr>
inoremap <F11> <esc>:call ReloadAllCSCOPE("SmartOpenWrt")<cr>
inoremap <F12> <esc>:call ReloadCSCOPE()<cr>

vnoremap <F5> y<esc>:Search <c-r>0<cr>
vnoremap <xF3> y<esc>:Ag "<c-r>0" <c-r>=getcwd()<cr>

noremap <c-j> :GitGutterNextHunk<cr>
noremap <c-k> :GitGutterPrevHunk<cr>

noremap <c-h> :BookmarkNext<cr>
noremap <c-l> :BookmarkPrev<cr>

" noremap <m-j> ]`
" noremap <m-k> [`

noremap <c-xDown> <c-w>j
noremap <c-xUp> <c-w>k
noremap <c-xLeft> <c-w>h
noremap <c-xRight> <c-w>l

inoremap <c-xDown> <esc><c-w>j
inoremap <c-xUp> <esc><c-w>k
inoremap <c-xLeft> <esc><c-w>h
inoremap <c-xRight> <esc><c-w>l

noremap <leader>jj <c-w>j
noremap <leader>kk <c-w>k
noremap <leader>hh <c-w>h
noremap <leader>ll <c-w>l

"noremap <m-xLeft> <esc>:tabprevious<cr>
"noremap <m-xRight> <esc>:tabnext<cr>
"inoremap <m-xLeft> <esc>:tabprevious<cr>
"inoremap <m-xRight> <esc>:tabnext<cr>

noremap <a-k> <esc>:bp<cr>
noremap <a-j> <esc>:bn<cr>

noremap <m-xUp> <esc>:bp<cr>
noremap <m-xDown> <esc>:bn<cr>
noremap <m-xLeft> <esc>:vertical res -3<cr>
noremap <m-xRight> <esc>:vertical res +3<cr>


inoremap <m-xUp> <esc>:bp<cr>
inoremap <m-xDown> <esc>:bn<cr>
inoremap <m-xLeft> <esc>:vertical res -3<cr>
inoremap <m-xRight> <esc>:vertical res +3<cr>

"nnoremap <c-v> <c-r>+
vnoremap <c-x> "+x
vnoremap <c-c> "+y
vnoremap <c-v> "+p
"vnoremap <c-x> "*x
"vnoremap <c-c> "*y
"vnoremap <c-v> "*p

inoremap <c-v> <c-r>+

"nnoremap <leader>u <ESC>:silent! !~/.nvim/gentag.sh <c-r>=getcwd()<cr> &<cr>
inoremap <c-s> <ESC>:update<cr>
nnoremap <c-s> :update<cr>
"nnoremap <leader><space> <ESC>:redraw!<cr>
nnoremap <leader>q <ESC>:bd<cr>
nnoremap <leader>aq <ESC>:qa<cr>

" to move effeciently between splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" --- vim-easyclip
xmap x <Plug>MoveMotionXPlug
nmap X <Plug>MoveMotionLinePlug

"au Filetype html,htm,xml,xsl source ~/.nvim/scripts/closetag.vim
"autocmd VimEnter * source ~/.nvim/Session.vim 
au BufRead * set expandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *.make set filetype=make noexpandtab
au BufRead *.mk set filetype=make noexpandtab
au BufRead *.ISD set filetype=make noexpandtab
au BufRead Makefile set filetype=make noexpandtab
au BufRead Makefile* set filetype=make noexpandtab
au BufRead *.in set noexpandtab
au BufRead *.conf set noexpandtab
au FileType hog setlocal commentstring=#\ %s
au BufRead product_config.make setlocal commentstring=#\ %s\ is\ not\ set
au BufRead *.htm set filetype=javascript noexpandtab
au BufRead *.html set filetype=javascript noexpandtab
au BufRead *.cgi set filetype=javascript noexpandtab
au BufRead *js.htm set filetype=javascript noexpandtab
au BufRead *js.html set filetype=javascript noexpandtab
au BufRead *css.htm set filetype=javascript noexpandtab
au BufRead *css.html set filetype=javascript noexpandtab
au BufRead *.in set syntax=kconfig
"au BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab
au BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab
au BufRead *.shc set filetype=sh noexpandtab

" add spell checking and automatic wrapping at the
" recommended 72 columns to you commit messages
au Filetype gitcommit setlocal spell textwidth=72

au BufWinEnter \[Buf\ List\] setl nonumber


"au VimEnter * NERDTreeFind
"
"au BufWritePost *.c,*.cpp,*.h silent! !cscope -bkq -i /CSCOPE/ISD2/MIPS32_APPS/sysconfig/cscope.files -f /CSCOPE/ISD2/MIPS32_APPS/sysconfig/cscope.out &
set cscopequickfix=s-,c-,d-,i-,t-,e-
"
let g:myGenCSCOPE_DB = "~/CSCOPE/"
let g:myCSCOPE_SHOW = "/tmp/cscope_show.txt"
let g:myGenIndex = 1

function! ReloadAllCSCOPE(var)
    let CSFOLDER=system('find ' .g:myGenCSCOPE_DB. ' -name "*.out" |grep ' . a:var)
    silent! cs kill -1
    let l:csfolder = substitute(CSFOLDER, "\n", "  ", "g")
    let s:csarray = split(l:csfolder)
    for i in range(0, len(s:csarray)-1)
        execute "silent! cs add "s:csarray[i]
    endfo
    "cs show
endfunction

function! MyGetInput(start,end,idx)
    let tmp = [0,0] "index,option  -1:quit,0:do nothing,1:enter,2:edit,3:switch,4:back switch
    let tmp[0] = a:idx
    let gc = getchar()
    let nc = nr2char(gc)
    let i = '0'

    if gc=="\<right>" || nc == 'l'
        let tmp[1] = 3
    elseif gc=="\<left>" || nc == 'h'
        let tmp[1] = 4
    elseif gc == "\<backspace>"
        let tmp[1] = -1
    elseif nc == "i" || nc == 'a' || nc == "\r" || nc == "\n"
        let tmp[1] =  2
    elseif gc == "\<up>" || nc == 'k'
        let tmp[0] -= 1
        if(tmp[0]<a:start)
            let tmp[0] = a:end
        endif
        let tmp[1] =  0
    elseif gc == "\<down>" || nc == 'j'
        let tmp[0] += 1
        if(tmp[0]>a:end)
            let tmp[0] = a:start
        endif
        let tmp[1] = 0
    elseif gc == "\<F12>"
        let tmp[1] = -12
    elseif nc == nr2char(27)  || nc == "q" "escape
        let tmp[1] = -1
    elseif nc == '0'
        if(0<=a:end)
            let tmp = [0,2]
        endif
    elseif nc == '1'
        if(1<=a:end)
            let tmp = [1,2]
        endif
    elseif nc == '2'
        if(2<=a:end)
            let tmp = [2,2]
        endif
    elseif nc == '3'
        if(3<=a:end)
            let tmp = [3,2]
        endif
    elseif nc == '4'
        if(4<=a:end)
            let tmp = [4,2]
        endif
    elseif nc == '5'
        if(5<=a:end)
            let tmp = [5,2]
        endif
    elseif nc == '6'
        if(6<=a:end)
            let tmp = [6,2]
        endif
    elseif nc == '7'
        if(7<=a:end)
            let tmp = [7,2]
        endif
    elseif nc == '8'
        if(8<=a:end)
            let tmp = [8,2]
        endif
    elseif nc == '9'
        if(9<=a:end)
            let tmp = [9,2]
        endif
    endif
    return tmp
endfunc

function! ShowMyGenTag()
    let startidx = 0
    let endidx = 4
    "let tmp = ['CS action:', ' 1) Add directly', ' 2) Show', ' 3) Add',' 4) Delete',' 5/q) Quit']
    let tmp = [' 0) Gen', ' 1) Add',' 2) Delete',' q or Backspace) Quit',' F12) Auto add']
    let csshow = system('cat ' . g:myCSCOPE_SHOW)
    let string = ''
    let i = 0
    echo csshow
    echo '-----------'
    while i <= endidx
        if( g:myGenIndex == i )
            let string = '>'.tmp[i]
        else
            let string = ' '.tmp[i]
        endif
        echo string
        let i += 1
    endwhile

    let idxdo = [0,0] "return index and options
    let idxdo =  MyGetInput(startidx,endidx,g:myGenIndex)
    let g:myGenIndex = idxdo[0]

    return idxdo[1]
endfunc

function! UpdateCscopeShow()
    execute 'redir! > ' . g:myCSCOPE_SHOW
    execute 'silent cs show'
    execute 'redir END'
    redraw!
endfunc

function! RecCSCOPE()
    let action = ShowMyGenTag()
    let recursive = 1
    let i = 1
    "-12 = F12
    "action 2 = enter
    if(action == 2 || action == 5 || action == -12)
        if(g:myGenIndex == 1 || g:myGenIndex == 4 || action == -12)
            "set cscopetag
            "set csto = 0
            "set nocsverb
            let currentDir = expand(getcwd())
            if(g:myGenIndex == 4 || action == -12)
                "auto gen/add from ~/CSCOPE
                let cstemp = currentDir
            else "g:myGenIndex == 1
                let cstemp = input("Add?", expand("%:p:h"), "file")
            endif
            let db = g:myGenCSCOPE_DB . cstemp . '/'
            execute 'silent !mkdir -p ' . db
            execute 'cd ' . db
            while i < 15
                if filereadable(expand(db . "cscope.out"))
                    execute 'silent! cs add ' . db
                    let i = 15
                else
                    let db = db . "/../"
                    execute 'cd ..'
                    let i += 1
                endif
            endwhile
            execute 'cd ' . currentDir
            let recursive = 1
            call UpdateCscopeShow()
        elseif(g:myGenIndex == 0)
            let currentDir = expand(getcwd())
            let gentemp = input("Generate?", expand("%:p:h"), "file")
            redraw!
            execute '!~/.nvim/gencs.sh ' . gentemp
            " call input("Enter to continue auto cs add")
            let db = g:myGenCSCOPE_DB . gentemp . '/'
            execute 'silent! cs add ' . db
            redraw!
            call UpdateCscopeShow()
            let recursive = 1
        elseif(g:myGenIndex == 2)
            let cstemp = input("Delete?")
            if( cstemp != "" )
                execute 'cs kill ' . cstemp
                execute 'silent! cs reset'
            endif
            call UpdateCscopeShow()
        elseif(g:myGenIndex == 3)
            let recursive = 0
            redraw!
        else
            let recursive = 0
            redraw!
        endif
    elseif(action == -1)
        let recursive = 0
        redraw!
    else
        redraw!
    endif

    return recursive
endfunction

function! ReloadCSCOPE()
    redraw!
    call UpdateCscopeShow()
    call MySwitchToWorkBuf()
    let myGenTagDir = expand(getcwd())
    let tmp = 1
    while tmp != 0
        let tmp = RecCSCOPE()
        if(tmp == 0)
            redraw!
            return
        endif
    endwhile
endfunction

if has("cscope")
    set cscopeverbose
    nmap <LEADER>s :cs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    nmap <C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    nmap <LEADER>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <LEADER>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <LEADER>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <LEADER>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif
let g:snipMate = { 'snippet_version' : 1 }
let g:notes_directories = ['~/Documents/Notes']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" global variable
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:myMenuIndex = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switchtoworkbuf by Yolin 
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySwitchToWorkBuf()

    let tempname = bufname("%")

    if(tempname =~# '.*_BASE_.*') || (tempname =~# '.*_LOCAL_.*') || (tempname =~# '.*_REMOTE_.*')
        execute "wincmd j"
        return 0
    endif
    if(tempname =~# '.*fugitiveblame')
        execute "wincmd l"
    endif

    if( strlen(tempname) > 10 )
        let tempname = strpart(tempname,0,10)
    endif

    if(tempname == 'NERD_tree_')
        execute "wincmd l"
    endif

    if(tempname == '__Tagbar__')
        execute "wincmd h"
    endif

    if(tempname == '') "SignatureBuffer
        execute "wincmd k"
    endif

    execute "Limelight!"

    return 0
endfunction
command! -nargs=* -complete=file MySwitchToWorkBuf call MySwitchToWorkBuf()

"-------------- yolin end---------------

"-------------markdown preview------------------

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" example
"nmap <C-s> <Plug>MarkdownPreview
"nmap <M-s> <Plug>MarkdownPreviewStop
nmap <LEADER>m <Plug>MarkdownPreviewToggle

"-------------markdown preview------------------

" | | | (_)
" | | | |_ _ __ ___  _ __ ___
" | | | | | '_ ` _ \| '__/ __|
" \ \_/ / | | | | | | | | (__
"  \___/|_|_| |_| |_|_|  \___|
"

" Setup NeoBundle  ----------------------------------------------------------{{{
" If vundle is not installed, do it first
  if (!isdirectory(expand("$HOME/.vim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.vim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.vim/repos/github.com/Shougo/dein.vim"))
  endif


  set nocompatible

" Required:
    set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim/

" Required:
  call dein#begin(expand('~/.vim'))
  let pluginsExist = 0
" Let NeoBundle manage NeoBundle
" Required:
  " instalacion de plugins
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')

  call dein#add('prettier/vim-prettier', { 'do': 'yarn install' })

  " marca al lado de los numeros 
  call dein#add('kshenoy/vim-signature')
  " tag con f4 
  call dein#add('majutsushi/tagbar')
  " ejecuta desde vim a una terminal tmux
  call dein#add('benmills/vimux') 
  " node jade template
  call dein#add('digitaltoad/vim-jade')
  " permite abrir ubicacion del archivo en el nerdtree
  call dein#add('jistr/vim-nerdtree-tabs')
  " guarda session
  call dein#add('thaerkh/vim-workspace')
  " reemplazar texto match case e interactivo
  call dein#add('tpope/vim-abolish')

  " muestra + o - al lado de numeros solo git
  call dein#add('airblade/vim-gitgutter')
  " muestra + o - al lado de numero s(para todos svn, git, etc )
  "call dein#add('mhinz/vim-signify')
 

  call dein#add('Chiel92/vim-autoformat')

	" analiza la sintaxis 
  call dein#add('scrooloose/syntastic')

  " syntax
  call dein#add('flazz/vim-colorschemes')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('bigfish/vim-js-context-coloring')
 
  call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
  call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'}) "syntax for ecma require yajs
  call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']}) " comment en js
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('Quramy/vim-js-pretty-template')
  call dein#add('othree/html5.vim')
  call dein#add('1995eaton/vim-better-javascript-completion', {'on_ft': ['javascript']})
  call dein#add('kchmck/vim-coffee-script', {'on_ft': 'coffee'})
  call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss']})

  " esquema de color
  call dein#add('mhartington/oceanic-next')
  " call dein#add('crusoexia/vim-monokai')
 
  call dein#add('elzr/vim-json', {'on_ft': 'json'})
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('suan/vim-instant-markdown', {'on_ft': 'markdown'})
  call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('Quramy/tsuquyomi')
  call dein#add('heavenshell/vim-flood')
 
  " call dein#add('Yggdroot/indentLine') "muestra el | en la identacion
  call dein#add('Raimondi/delimitMate', {'on_ft': ['javascript', 'typescript', 'css', 'scss']})

  call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})

  " git en vim
  call dein#add('tpope/vim-fugitive')
  " + y - de git al lado de los numeros de linea
  call dein#add('jreybert/vimagit')
  " nerdtree con indicaciones de git 
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  " nerdtree con iconos
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  " iconos en las barras de vim
  call dein#add('ryanoasis/vim-devicons')
 
  " call dein#add('https://github.com/jaxbot/github-issues.vim')
  " gist github
  call dein#add('mattn/gist-vim')

	" abre buffer para modificar seleccion
  call dein#add('chrisbra/NrrwRgn')
	" modifica texto ej cs"' cambia " por '
  call dein#add('tpope/vim-surround')
	" repetir comandos
  call dein#add('tpope/vim-repeat')
  " captura configuracion a usar en el proyecto de un archivo
  call dein#add('editorconfig/editorconfig-vim')
  " arbol de directorios
  call dein#add('scrooloose/nerdtree')

  call dein#add('AndrewRadev/switch.vim')

  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('tmux-plugins/vim-tmux-focus-events')

  " idicadores footer y header de vim
  call dein#add('vim-airline/vim-airline')
  " comentar rapido ej: gcc comenta posicion 
  call dein#add('tomtom/tcomment_vim')

  call dein#add('mattn/emmet-vim', {'on_ft': 'html'})
  " call dein#add('ap/vim-css-color')

  " reemplaza ctrl-p busqueda etc
  call dein#add('Shougo/unite.vim')

  " vim 8 o neovim
  " call dein#add('Shougo/Denite.nvim')
  " ver https://github.com/h1mesuke/unite-outline/wiki
  call dein#add('Shougo/unite-outline')
  " call dein#add('ujihisa/unite-colorscheme')
  " call dein#add('junkblocker/unite-codesearch')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  " call dein#add('Shougo/neocomplete.vim')
  " call dein#add('maralla/completor.vim')

	"solo para neovim ?
  "call dein#add('Shougo/deoplete.nvim')
  " auto completar
  " call dein#add('ternjs/tern_for_vim', {'build': 'npm install'})
  call dein#add('Valloric/YouCompleteMe', {'build': './install.py'})

  " estod 3 no idea
  " call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
  " call dein#add('Shougo/neoinclude.vim')
  " call dein#add('ujihisa/neco-look')

  call dein#add('dense-analysis/ale')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('honza/vim-snippets')
  " call dein#add('matthewsimo/angular-vim-snippets')
  " salir de las pestañas buffer
  call dein#add('mhinz/vim-sayonara')
  " call dein#add('mattn/webapi-vim')
  call dein#add('terryma/vim-multiple-cursors')
  " completa con datos de github
  " call dein#add('rhysd/github-complete.vim')
  " redimensionar vim ej :Goyo 500
  call dein#add('junegunn/goyo.vim')
  " ignora error en un intervalo puesto
  " call dein#add('vim-scripts/SyntaxRange')
  " color a 24 bit solo vim > 8 o neo vim, y colorscheme
  " call dein#add('jacoborus/tender.vim')
  if dein#check_install()
    call dein#install()
  endif
  call dein#end()

" Required:
  filetype plugin indent on
" }}}

" System Settings  ----------------------------------------------------------{{{

" Let airline tell me my status
  "set termguicolors
  set noshowmode
  set noswapfile
  filetype on
  set relativenumber number
  set tabstop=2 shiftwidth=2 expandtab
  set conceallevel=0
" block select not limited by shortest line
  set virtualedit=
  set wildmenu
  set laststatus=2
  "set colorcolumn=100
  set wrap linebreak nolist
  set wildmode=full
" leader is ,
  let mapleader = ','
  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"
" Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
              " center buffer around cursor when opening files
  autocmd BufRead * normal zz
  let g:jsx_ext_required = 0
  set complete=.,w,b,u,t,k
  let g:gitgutter_max_signs = 1000  " default value

  autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
  let g:indentLine_char='│'
  " enable deoplete
	"let g:deoplete#enable_at_startup = 1

  let g:neocomplete#enable_at_startup = 1
  "let g:unite_source_codesearch_command = '$HOME/bin/csearch'
  let g:table_mode_corner="|"

" }}}

" System mappings  ----------------------------------------------------------{{{

" No need for ex mode
  " nnoremap Q <nop>
" recording macros is not my thing
  " map q <Nop>
" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
" Navigate between display lines
  noremap  <silent> <Up>   gk
  noremap  <silent> <Down> gj
  noremap  <silent> k gk
  noremap  <silent> j gj
  "noremap  <silent> <Home> g<Home>
  noremap  <silent> <End>  g<End>
  "inoremap <silent> <Home> <C-o>g<Home>
  inoremap <silent> <End>  <C-o>g<End>
" copy current files path to clipboard
  nmap cp :let @+ = expand("%") <cr>

" ,f to format code, requires formatters: read the docs
  " noremap <leader>f :Autoformat<CR>
  noremap <leader>TM :TableModeToggle<CR>
" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
  noremap H ^
  noremap L g_
  noremap J 5j
  noremap K 5k
" this is the best, let me tell you why
" how annoying is that everytime you want to do something in vim
" you have to do shift-; to get :, can't we just do ;?
" Plus what does ; do anyways??
" if you do have a plugin that needs ;, you can just wap the mapping
" nnoremap : ;
" give it a try and you will like it
  nnoremap ; :
  inoremap <c-f> <c-x><c-f>
" Copy to osx clipboard
  vnoremap <C-c> "*y<CR>
  "vnoremap y "*y<CR>
  "nnoremap Y "*Y<CR>
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'

" Align blocks of text and keep them selected
  vmap < <gv
  vmap > >gv
  nnoremap <leader>d "_d
  vnoremap <leader>d "_d
  vnoremap <c-/> :TComment<cr>
  " map <esc> :noh<cr>
autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>

nnoremap <leader>e :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! s:PlaceholderImgTag(size)
  let url = 'http://dummyimage.com/' . a:size . '/000000/555555'
  let [width,height] = split(a:size, 'x')
  execute "normal a<img src=\"".url."\" width=\"".width."\" height=\"".height."\" />"
  endfunction
command! -nargs=1 PlaceholderImgTag call s:PlaceholderImgTag(<f-args>)

"}}}

" Themes, Commands, etc  ----------------------------------------------------{{{
" Theme
syntax enable
colorscheme OceanicNext
set background=dark
" set background=light
" no need to fold things in markdown all the time
let g:vim_markdown_folding_disabled = 1
" turn on spelling for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
" highlight bad words in red
autocmd BufRead,BufNewFile *.md hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224
" disable markdown auto-preview. Gets annoying
let g:instant_markdown_autostart = 0
"}}}

" Fold, gets it's own section  ----------------------------------------------{{{

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

function! JavaScriptFold() "{{{
  " syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
  setlocal foldmethod=syntax
  setlocal foldlevel=99
  echo "hello"
  syn region foldBraces start=/{/ skip=/\(\/\/.*\)\|\(\/.*\/\)/ end=/}/ transparent fold keepend extend
endfunction "}}}

" function! HTMLFold() "{{{
"   " syn sync fromstart
"   set foldmethod=syntax
"   syn region HTMLFold start=+^<\([^/?!><]*[^/]>\)\&.*\(<\1\|[[:alnum:]]\)$+ end=+^</.*[^-?]>$+ fold transparent keepend extend
"   syn match HTMLCData "<!\[CDATA\[\_.\{-}\]\]>" fold transparent extend
"   syn match HTMLCommentFold "<!--\_.\{-}-->" fold transparent extend
" endfunction "}}}

set foldtext=MyFoldText()

autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

autocmd FileType vim setlocal fdc=1
set foldlevel=99
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

" au FileType html call HTMLFold()
" autocmd FileType html setlocal foldmethod=syntax
autocmd FileType html setlocal fdl=99

" autocmd FileType javascript call JavaScriptFold()
autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
autocmd FileType javascript,typescript,css,scss,json setlocal foldmethod=marker
autocmd FileType javascript,typescript,css,scss,json setlocal foldmarker={,}
autocmd FileType coffee setl foldmethod=indent
" au FileType html nnoremap <buffer> <leader>F zfat
" }}}

" NERDTree ------------------------------------------------------------------{{{

map <silent> - :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1

  " let g:webdevicons_enable_nerdtree = 0
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  " let g:NERDTreeFileExtensionHighlightFullName = 1

"}}}

" Snipppets -----------------------------------------------------------------{{{

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets, ~/Github/ionic-snippets, ~/.vim/bundle/angular-vim-snippets/snippets'

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

"}}}

" Typescript & Javscript omni complete --------------------------------------{{{
  let g:vimjs#casesensistive = 1
  let g:vimjs#smartcomplete = 1
  let g:tsuquyomi_disable_quickfix = 1
  let g:vim_json_syntax_conceal = 0
  autocmd FileType setlocal completeopt+=noselect,menu,preview
  set completeopt+=noselect,menu,preview
  " if !exists('g:neocomplete#force_omni_input_patterns')
  "   let g:neocomplete#force_omni_input_patterns = {}
  " endif
  " let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'

"}}}

" Emmet customization -------------------------------------------------------{{{
" Enable Emmet in all modes
" Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return "\<C-y>,"
  endif
" return a regular tab character
  return "\<tab>"
  endfunction
  autocmd FileType html,markdown imap <buffer><expr><tab> <sid>expand_html_tab()
  let g:user_emmet_mode='a'
  let g:user_emmet_complete_tag = 1
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
"}}}

" unite ---------------------------------------------------------------------{{{
let g:completor_node_binary="/usr/local/bin/node"
let g:completor_python_binary = ' /usr/local/lib/python3.5/site-packages'
let g:unite_data_directory='~/.nvim/.cache/unite'
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib', '--ignore', 'node_modules']
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
                  \ '-i --vimgrep --hidden --ignore ' .
                  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

nnoremap <silent> <c-p> :Unite -auto-resize -start-insert -direction=botright file_rec/async<CR>
nnoremap <silent> <leader>a :Unite -auto-resize -start-insert -direction=botright grep<CR>
" nnoremap <silent> <leader>c :Unite -auto-resize -start-insert -direction=botright colorscheme<CR>
" nnoremap <silent> <leader>u :Unite neobundle/update<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()

function! s:unite_settings() "{{{
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction "}}}

" Git from unite...ERMERGERD ------------------------------------------------{{{
let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places
let g:unite_source_menu_menus.git = {
  \ 'description' : 'Fugitive interface',
  \}
let g:unite_source_menu_menus.git.command_candidates = [
  \[' git status', 'Gstatus'],
  \[' git diff', 'Gvdiff'],
  \[' git commit', 'Gcommit'],
  \[' git stage/add', 'Gwrite'],
  \[' git checkout', 'Gread'],
  \[' git rm', 'Gremove'],
  \[' git cd', 'Gcd'],
  \[' git push', 'exe "Git! push " input("remote/branch: ")'],
  \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
  \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
  \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
  \[' git fetch', 'Gfetch'],
  \[' git merge', 'Gmerge'],
  \[' git browse', 'Gbrowse'],
  \[' git head', 'Gedit HEAD^'],
  \[' git parent', 'edit %:h'],
  \[' git log commit buffers', 'Glog --'],
  \[' git log current file', 'Glog -- %'],
  \[' git log last n commits', 'exe "Glog -" input("num: ")'],
  \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
  \[' git log until date', 'exe "Glog --until=" input("day: ")'],
  \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
  \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
  \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
  \[' git mv', 'exe "Gmove " input("destination: ")'],
  \[' git grep',  'exe "Ggrep " input("string: ")'],
  \[' git prompt', 'exe "Git! " input("command: ")'],
  \] " Append ' --' after log to get commit info commit buffers
nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git -start-insert menu:git<CR>
"}}}
"}}}

" Navigate between vim buffers and tmux panels ------------------------------{{{
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
"}}}

" vim-airline ---------------------------------------------------------------{{{
let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
" let g:airline_theme='base16_solarized'
" con x cierro buffer, con x salgo de vim
cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'Sayonara' : 'q'
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'x' : 'x'
nmap <leader>t :term<cr>
nmap <leader>, :bnext<CR>
nmap <leader>. :bprevious<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
"}}}

" Linting -------------------------------------------------------------------{{{
	let g:syntastic_check_on_open=1
	let g:syntastic_javascript_checkers = ['eslint']
  function! JscsFix()
      let l:winview = winsaveview()
      % ! jscs -x
      call winrestview(l:winview)
  endfunction
  command JscsFix :call JscsFix()
  noremap <leader>j :JscsFix<CR>
"}}}
"
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS

" Propios -------------------------------------------------------------------{{{
  " copiar y pegar 
  vmap <C-c> :!xclip -f -sel clip<CR>
  map <C-v> :r!xclip -o -sel clip

  nmap <F3> :NERDTreeFind<cr>
  nmap <F4> :TagbarToggle<CR>
  nmap <F5> :set wrap!<CR>
  nnoremap <F6> :set invpaste paste?<CR>
  set pastetoggle=<F6>

  autocmd VimEnter * AirlineToggleWhitespace

  set ignorecase
  set nowrap

  let g:nerdtree_tabs_open_on_console_startup=2
  let g:nerdtree_tabs_autofind=1

  " guardar sesion
  nnoremap <leader>s :ToggleWorkspace<CR>

  map <Home><Home> ^
  imap <Home><Home> <C-O>^

  "shell con control-z
  map <C-Z> :shell<cr>

  " w!! to sudo & write a file
  cmap w!! %!sudo tee >/dev/null %

  "cambiar a modo normal con 
  imap jj <Esc><Right>

  nmap tn :bnext<CR>
  nmap tp :bprevious<CR>
  nmap tt :enew<CR>

  " ignorar todo estos directorios y archivos
  " let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', 'node_modules', 'bower_components', 'bin', 'vendor', 'cache', 'logs', 'AppCache.php', 'autoload.php', 'bootstrap.php.cache', 'check.php', 'console', 'phpunit.xml.dist', 'SymfonyRequirements.php', 'README.md', 'composer.phar', 'composer.lock']
  
  noremap H <HOME>
  noremap HH ^

	" separar seleccion para edicion en otro buffer
  " por defecto selecciono y con ,rn abre en un buffer el texto seleccionado para modificar, al guardar estos cambios modifica el original
	" imap <Leader>nr :NRM!
	" aumenta el tamaño del buffer creado cuando se apreta leader space
	let g:nrrw_rgn_incr = 40

  let g:used_javascript_libs = 'react'

  " abre tmux abajo y ejecuta 
  map rp :VimuxRunCommand "ls -l"<cr>
  map rx :VimuxCloseRunner<cr>

  " con .. voy adonde se instancia la variable y guarda la marca para volver con 'a
  nmap .. ma:TernDef<CR>

  " con ff voy a archivo como con gf
  nmap ff $bbgf<CR>

  if filereadable(expand(".prettierrc"))
    nmap <leader>f :Prettier<CR>
  else 
    nmap <leader>f :Autoformat<CR>
  endif

  "gcc comentar gc comentar varias lineas
  " buscar y reemplazar global
  ":%S/nombre{,s}/reemplazo{,s}/g
  ":%S/nombre{,s}/reemplazo{,s}/gc interactivo
 
"}}}

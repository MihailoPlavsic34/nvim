let s:cpo_save=&cpo
set cpo&vim
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <C-W> u
inoremap <C-U> u
nnoremap  zz
nnoremap  <Cmd>silent !tmux neww tmux-sessionizer
nnoremap <NL> <Cmd>cprevzz
nnoremap  <Cmd>cnextzz
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
nnoremap  zz
nnoremap  w 
nnoremap <silent>  x <Cmd>!chmod +x %
nnoremap  s :%s/\<\>//gI<Left><Left><Left>
nnoremap  j <Cmd>lprevzz
nnoremap  k <Cmd>lnextzz
vnoremap  d "_d
nnoremap  d "_d
nnoremap  Y "+Y
vnoremap  y "+y
nnoremap  y "+y
xnoremap  p "_dP
xnoremap # y?\V"
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
xnoremap * y/\V"
nnoremap J mzJ`z
vnoremap J :m '>+1gv=gv
vnoremap K :m '<-2gv=gv
nnoremap N Nzzzv
nnoremap Q <Nop>
nnoremap Y y$
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
xmap a% <Plug>(MatchitVisualTextObject)
xnoremap gb <Plug>(comment_toggle_blockwise_visual)
xnoremap gc <Plug>(comment_toggle_linewise_visual)
nnoremap gb <Plug>(comment_toggle_blockwise)
nnoremap gc <Plug>(comment_toggle_linewise)
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
nnoremap n nzzzv
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))
xnoremap <Plug>(comment_toggle_blockwise_visual) <Cmd>lua require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())
xnoremap <Plug>(comment_toggle_linewise_visual) <Cmd>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nnoremap <C-J> <Cmd>cprevzz
nnoremap <C-K> <Cmd>cnextzz
nnoremap <C-F> <Cmd>silent !tmux neww tmux-sessionizer
nnoremap <C-U> zz
nnoremap <C-D> zz
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
inoremap  u
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set eventignore=BufEnter,BufLeave,BufWinLeave,InsertLeave,CursorMoved,BufWritePost
set expandtab
set nohlsearch
set indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,0=end,0=until
set isfname=#,$,%,+,,,-,.,/,48-57,=,@,_,~,@-@
set runtimepath=~/.config/nvim,/etc/xdg/nvim,~/.local/share/nvim/site,~/.local/share/nvim/site/pack/*/start/*,~/.local/share/nvim/site/pack/packer/start/packer.nvim,/usr/local/share/nvim/site,/usr/share/nvim/site,/opt/nvim-linux64/share/nvim/runtime,/opt/nvim-linux64/share/nvim/runtime/pack/dist/opt/matchit,/opt/nvim-linux64/lib/nvim,~/.local/share/nvim/site/pack/*/start/*/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,~/.local/share/nvim/site/after,/etc/xdg/nvim/after,~/.config/nvim/after
set scrolloff=8
set shiftwidth=4
set smartindent
set softtabstop=4
set noswapfile
set tabstop=4
set termguicolors
set undodir=~/.vim/undodir
set undofile
set updatetime=50
set window=77
" vim: set ft=vim :

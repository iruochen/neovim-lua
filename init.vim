" 兼容vi
set nocompatible

" snazzy 透明背景
let g:SnazzyTransparent = 1

" vim 识别不同的文件格式
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"常用设置
" 代码折叠
set foldmethod=indent
set foldlevel=99
" 代码高亮
syntax on
" 显示行号
set number
set relativenumber
" 鼠标
set mouse=a
" utf-8编码
set encoding=utf-8

" 解决某些终端运行vim配色问题
let &t_ut=''
" 设置tab缩进为2
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" 显示行尾空格
set list
set listchars=tab:▸\ ,trail:▫

" 将光标位置设置为第5行
set scrolloff=5

" 缩进相关
set tw=0
set indentexpr=

" 退格键在行首按下可以回到行尾
set backspace=indent,eol,start

" vim 光标在普通模式和写入模式下有不同的样式
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" 状态栏
set laststatus=2
" vim命令会在当前文件目录下执行
set autochdir

" 文件打开时，光标回到上一次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 将leader键设置为空格
let mapleader=" "
" 行号显示
set norelativenumber
" 高亮当前光标所在行
set cursorline
" 自动换行
set wrap
" 显示命令
set showcmd
" 命令提示
set wildmenu
" 搜索高亮
set hlsearch
" 输入时高亮
set incsearch
" 打开新文件时去除高亮
exec "nohlsearch"
" 忽略大小写
set ignorecase
" 智能大小写
set smartcase

""""""""""""" 按键映射
" 搜索结果显示到中间
noremap n nzz
noremap N Nzz
" 使用空格加回车取消显示搜索结果
noremap <LEADER><CR> :nohlsearch<CR>

" 粘贴
" 支持在Visual模式下，通过C-y复制到系统剪切板
vnoremap <C-y> "+y
" 支持在normal模式下，通过C-p粘贴系统剪切板
nnoremap <C-p> "*p
" 支持在normal模式下，通过C-p粘贴系统剪切板
nnoremap <C-y> "+y

map <C-j> 4j
map <C-k> 4k
map s <nop>
" S 保存
map S :w<CR>
" Q 退出
map Q :q<CR>
" R 刷新配置
map R :source ~/Appdata/Local/nvim/init.vim<CR>

" 向右分屏
map sl :set splitright<CR>:vsplit<CR>
" 向左分屏
map sh :set nosplitright<CR>:vsplit<CR>
" 向上分屏
map sk :set nosplitbelow<CR>:split<CR>
" 向下分屏
map sj :set splitbelow<CR>:split<CR>
" 分屏间移动映射
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
" insert 模式映射<Leader>w 保存文件
" inoremap <leader>s <Esc>:w<cr>
" jj 映射到esc
" `^: 光标回到上一次编辑的位置
inoremap jj <Esc>`^
" command 下json格式化
com! FormatJSON %!python3 -m json.tool
" 空格选中单词
" map <space> viw
" 在 visual 模式下转换选中文本的大小写
vmap \ U
" 在 insert 模式下 <C-d> 删除当前行
imap <C-d> <Esc>ddi
" 快速打开目录树
nnoremap tt <Esc>:NERDTreeToggle<CR>
" nerdTree 搜索快捷键映射
nnoremap <LEADER>f :NERDTreeFind<CR>
" nerdTree 显示隐藏文件
let NERDTreeShowHidden=1
" nerdTree 忽略的文件
let NERDTreeIgnore= [
   \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.swp$',
   \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
   \ ]

" 模糊搜索
let g:ctrlp_map = '<LEADER>s'
" 纵向分屏
" map ss <C-w>t<C-w>H
" 横向分屏
" map sv <C-w>t<C-w>K

" 改变分屏大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" 打开新的标签页
map tu :tabe<CR>
" 移动到左标签页
map th :-tabnext<CR>
" 移动到右标签页
map tl :+tabnext<CR>

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Press space twice to jump to the next '<++>' and edit it
nmap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
" ]s ]S 查看下一个/上一个拼写错误
" 在错误单词下 z= 可以看到修改建议
" insert模式下 Ctrl+x s 有提示
nmap <LEADER>sc :set spell!<CR>

" 插件
call plug#begin('~/AppData/Local/nvim/plug')

" 状态栏美化
Plug 'vim-airline/vim-airline'
" vim 主题
Plug 'connorholyday/vim-snazzy'
" vim 开屏插件
Plug 'mhinz/vim-startify'
" 代码缩进插件
Plug 'yggdroot/indentline'
" 文件目录插件
Plug 'scrooloose/nerdtree'
" 模糊搜索器
Plug 'ctrlpvim/ctrlp.vim'
" 文件中定位插件 ss搜索
Plug 'easymotion/vim-easymotion'
" 成对编辑
Plug 'tpope/vim-surround'
" fzf 搜索插件
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" 主题
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
" 代码注释插件
Plug 'tpope/vim-commentary'
" markdown预览插件
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" markdown 图片快速插入
Plug 'ekickx/clipboard-image.nvim'
call plug#end()

" snazzy 主题应用
color snazzy
" easymotion 映射(递归映射)
nmap ss <Plug>(easymotion-s2)


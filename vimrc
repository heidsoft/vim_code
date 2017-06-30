syntax enable
set nu " 显示行行号
set guifont=Monaco:h10 noanti " 设置字体
set hlsearch " 设置搜索结果高亮显示
" set bg=dark  " 设置背景颜色
set autoindent " 设置自动搜排
" colorscheme jellybeans   " 设置主题
colorscheme wombat
autocmd vimenter * NERDTree " 自动打开文件浏览


" 插件管理与设置
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'  " 管理插件
Plugin 'flazz/vim-colorschemes' " 颜色主题插件
Plugin 'scrooloose/nerdtree' " 文件浏览
Plugin 'Xuyuanp/nerdtree-git-plugin' " 支持git 文件浏览
Plugin 'scrooloose/nerdcommenter' " 代码注释
Plugin 'motemen/git-vim' " vim git插件
Plugin 'fisadev/vim-isort' " 导入排序
Plugin 'scrooloose/syntastic' " 语言检查
Plugin 'pignacio/vim-yapf-format' " 格式化python 
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8' " pep8 检查



call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

"------------------------ 配置插件设置-----------------

" python PEP8 
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
" 高亮错误的空格
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" 自动导入
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set clipboard=unnamed


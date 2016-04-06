set nocompatible

"let mapleader="\"

"vundle config
filetype off
if has("win32")
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
    let $VIMRC = $VIM . "/_vimrc"
else
    set rtp+=~/.vim/bundle/Vundle.vim/
    let $VIMRC = "~/.vimrc"
endif

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'bsdelf/bufferhint'
"Plugin 'bling/vim-airline'
call vundle#end()

"normal config
filetype plugin indent on                           "侦测文件类型, 载入文件类型插件, 为特定文件类型载入相关缩进文件
syntax on                                           "语法高亮
colorscheme solarized								"主题

set guifont=Inziu_1mn_SC:h16						"字体
set guioptions-=m									"隐藏菜单栏
set guioptions-=T                                   "隐藏工具栏
set guioptions-=r                                   "关闭右侧滚动条

set autochdir                                       "自动切换当前目录为当前文件所在目录
set nobackup                                        "不产生备份文件
set showmatch                                       "光标短暂的调到匹配的括号处
set formatoptions+=mM                               "中文字符的折行与拼接
set nu												"显示行号
"set ru                                             "显示标尺
set cursorline                                      "突出显示当前行
set ai
set autoindent
set smartindent                                     "新行使用智能自动缩进
set textwidth=0                                     "取消自动换行
set hidden                                          "允许在有未保存的修改时切换缓冲区

set laststatus=2                                    "显示状态栏
set statusline=[%1*%*buffer:%n%R%Y,%{&fileformat},%{&encoding}]\ %F%=%0(CHAR=0x%B\ OFFSET=%o/%{FileSize()}\ ROW=%l/%L(%p%%)\ COL=%c%)

set hlsearch                                        "搜索时高亮显示找到的文本
set incsearch                                       "输入即时搜索
set ignorecase smartcase                            "搜索时忽略大小写，但在有一个或以上大写字母时对大小写敏感

set backspace=indent,eol,start                      "设置退格键模式
set tabstop=4                                       "tab键宽度为4，但仍然是tab，只是vim将其解释成4个空格的宽度
set shiftwidth=4                                    "缩进使用4个空格的宽度
set softtabstop=4                                   "设置tab所占的列数，当输入tab时，设为4个空格的宽度
set smarttab                                        "按下Backspace键可以删除tab键的空格
set expandtab                                       "扩展tab为空格

set wildmenu										"增强命令补全

set helplang=cn										"中文帮助
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1,euc-jp,euc-kr
set fileencoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set ambiwidth=double
language messages zh_CN.utf-8

"Key Mapping
map <silent> <leader>ee :e $VIMRC<CR>               "加载vimrc文件
nnoremap <C-tab> :bn<CR>                            "Ctrl-Tab
nnoremap <C-s-tab> :bp<CR>                          "Ctrl-Shift-Tab
autocmd! bufwritepost $VIMRC source %		        "vimrc保存时自动加载

"bufferhint key mapping
"nnoremap - :call bufferhint#Popup()<CR>
"nnoremap \ :call bufferhint#LoadPrevious()<CR>

if has("win32")
	au GUIEnter * simalt ~x							"默认最大化窗口
    set termencoding=cp936
endif

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return 0
    else
        return bytes
    endif
endfunction

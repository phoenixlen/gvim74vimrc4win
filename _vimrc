set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


unmap <C-Y>
set nu			"���к�
"set numberwidth=5
set ruler		" ��ʾ���
set nobackup		"���Զ�����
set list
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set listchars=tab:>-,trail:$,extends:>,precedes:<,eol:$
"set nowrap		"�Զ�����
set wrap		"�Զ�����
set columns=100
set nocompatible	" ��Ҫʹ��vi�ļ���ģʽ������vim�Լ���
set history=100	" history�ļ�����Ҫ��¼������
set confirm	"�ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��
" Backspace deletes like most programs in insert mode
set backspace=2
set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab
" Make it obvious where 80 characters is
set textwidth=120
set colorcolumn=+1
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5
set clipboard+=unnamed	" ��windows���������
" Color scheme
colorscheme desert
"colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
let g:molokai_original = 1	"If you prefer the scheme to match the original monokai background color, put this in your .vimrc file
let g:rehash256 = 1

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"���ñ���,�����������
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim "����windows��Gvimʹ��
source $VIMRUNTIME/menu.vim "����windows��Gvimʹ��
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <C-F2> :call Toggle_m_t()<CR>
func! Toggle_m_t()
	if &guioptions =~# 'T'
		set guioptions-=T
		set guioptions-=m
	else
		set guioptions+=T
		set guioptions+=m
	endif
endfunc

au GUIEnter * simalt ~x

set number  " 显示行号

set relativenumber  " 显示相对行号

set ruler  " 右下加显示光标的行列信息

filetype on  " 文件类型检测

set encoding=utf-8  " 编码格式

set showmatch  " 高亮显示匹配的括号

set mouse=""

set syntax=on  " 语法高亮

set tabstop=2  " Tab键显示的空格数

set shiftwidth=2 
set expandtab

set autoindent  " 下一行缩进自动保持与上一行一致

set textwidth=80  " 行宽 一行显示多少个字符

" 代码折叠
set foldenable
set foldmethod=manual

set history=1000  " 历史命令条数

" colorscheme murphy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键映射
:imap jj <ESC>

" 禁用方向键
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 新建文件，自动插入文件头
autocmd BufNewFile *.c,*.cpp,*.sh,*.py exec ":call SetTitle()"
function SetTitle()
	if &filetype == 'sh' || &filetype == 'python'
		call setline(1, "##")
		call append(line("."), " # @file: ".expand("%"))
		call append(line(".")+1, " # @author: Tron-Liu (Tron-Liu@foxmail.com)")
		call append(line(".")+2, " # @brief: ")
		call append(line(".")+3, " # @date: ".strftime("%Y-%m-%d"))
		call append(line(".")+4, " #")
		call append(line(".")+5, " # @copyright Copyright (c) ".strftime("%Y"))
		call append(line(".")+6, " #")
		call append(line(".")+7, "##")
		call append(line(".")+8, "")
	else
		call setline(1, "/**")
		call append(line("."), " * @file: ".expand("%"))
		call append(line(".")+1, " * @author: Tron-Liu (Tron-Liu@foxmail.com)")
		call append(line(".")+2, " * @brief: ")
		call append(line(".")+3, " * @date: ".strftime("%Y-%m-%d"))
		call append(line(".")+4, " *")
		call append(line(".")+5, " * @copyright Copyright (c) ".strftime("%Y"))
		call append(line(".")+6, " *")
		call append(line(".")+7, " */")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+9, "#include <stdio.h>")
		call append(line(".")+10, "")
		call append(line(".")+11, "int main(int argc, char* argv[])")
		call append(line(".")+12, "{")
		call append(line(".")+13, "  return 0;")
		call append(line(".")+14, "}")
	endif
	if &filetype == 'cpp'
		call append(line(".")+9, "#include <iostream>")
		call append(line(".")+10, "")
		call append(line(".")+11, "int main(int argc, char* argv[])")
		call append(line(".")+12, "{")
		call append(line(".")+13, "  return 0;")
		call append(line(".")+14, "}")
	endif
endfunction

" press F5 to run program 
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc

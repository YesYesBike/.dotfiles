au BufRead,BufNewFile *.h	        set filetype=c
au BufRead,BufNewFile *.asm	        set filetype=nasm
au BufRead,BufNewFile *.lisp,*.scm	setlocal equalprg=scmindent
au FileType html					set softtabstop=2 shiftwidth=2 tabstop=2
au FileType lua						set cms=--%s
au FileType c						set cms=//%s

au BufRead,BufNewFile *.h	        set filetype=c
au BufRead,BufNewFile *.asm	        set filetype=nasm cms=\;\ %s
au BufRead,BufNewFile *.s	        set cms=//%s

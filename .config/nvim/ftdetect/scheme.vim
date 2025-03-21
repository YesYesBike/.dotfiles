au FileType scheme call SchemeSetup()
au FileType lisp call SchemeSetup()

function SchemeSetup()
	set expandtab
	inoremap <buffer> (				()<Left>
	inoremap <buffer> <C-j><C-h>	<C-[>ca(
	"inoremap <buffer> <C-l>			<Right>

	nnoremap <buffer> <leader>la	ci(()<esc>P
	xnoremap <buffer> <leader>la	"zc()<esc>"zP

	nnoremap <buffer> dj			"jda(
	nnoremap <buffer> cj			"jca(
	nnoremap <buffer> yj			"jya(
	inoremap <buffer> <C-j><C-j>	<C-r>j<esc>mzgg=G`za

	"augroup SchemeTerm
	"	autocmd!
	"	autocmd TermOpen * call SchemeTermSetup()
	"augroup END

	"xmap <buffer> <leader>lf		<Plug>SlimeRegionSend
	"nmap <buffer> <leader>lf		<Plug>SlimeParagraphSend
	"nmap <buffer> <leader>lF		:%SlimeSend<cr>
endfunction

"function SchemeTermSetup()
"	let l:job_id = &channel
"	wincmd k
"	let b:slime_config = {}
"	let b:slime_config["jobid"] = job_id
"	wincmd j
"endfunction
"

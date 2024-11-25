dnl BOILERPLATE
divert(-1)
	#changequote([,])
	define(`d', `define'($@))
	d(`tr', `translit'($@))
	d(`traA', `tr'($1, `a-z', `A-Z'))
	d(`heder', `changecom([,])dnl
#ifndef traA($1)_H
#define traA($1)_H

ASDF

#endif /* traA($1)_H */
changecom(#)dnl')
	d(`rev', `ifelse($#, 0, , $#, 1, $1, `rev(shift($@)), `$1'')')
undivert
divert(0)dnl
dnl SAVE
heder(`var')

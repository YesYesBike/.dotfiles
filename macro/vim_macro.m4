divert(-1)
	#changequote([,])
	define(`__d', `define'($@))
	__d(`__tr', `translit'($@))
	__d(`__rev', `ifelse($#, 0, , $#, 1, $1, `rev(shift($@)), `$1'')')
	__d(`im', `int main(int argc, char *argv[])
{
	ASDF
}')
	#__d(`inc', `__d(
undivert
divert(0)dnl
val(arg)

default:
	flex mylexer.l
	g++ lex.yy.c -lfl -o lexer.ex
	./lexer.ex < testInput

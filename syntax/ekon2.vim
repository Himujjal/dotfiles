" Vim syntax file Language: EKON
" Maintainer: Himujjal
" Latest Revision: 29 December, 2020


" if !exists("main_syntax")
"     let main_syntax='ekon'
" endif

let b:current_syntax = ''
unlet b:current_syntax
syntax include @TypeScript 'syntax/typescript.vim'

" ====== Keywords ======
syn keyword ekonNull null
syn keyword ekonBoolean true false
syn keyword ekonCommentTodo contained  TODO FIXME XXX TBD NOTE

" ====== Matches =======
" EkonNoise
syn match ekonNoise /[:,]/

" EkonNumber - all numbers covered
syn match ekonNumber /[+-]\=\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\x\+\)\>/
syn match ekonFloat /[+-]\=\<\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%(e[+-]\=\d\+\)\=\>/
" syn match ekonNumber "-\=\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>\ze[[:blank:]\r\n]*[,}\]]"

" Ekon Escape
syn match ekonEscape "\\["\\/bfnrt]" contained
syn match ekonEscape "\(\\u\x\{4}\|\\x\x\{2}\|\\U\x\{8}\)" contained

" Ekon Identifier
syn match ekonIdentifier /\<\K\k*/ skipwhite skipempty contained

" ====== Regions =======
" Syntax: comments
syn region ekonComment start="//" end="$" contains=ekonCommentTodo

" Syntax: String Regions
syn match  ekonStringMatch /"\([^'"]\|\\\"\)\+"\ze[[:blank:]\r\n]*[:,{}\[\]]/ contains=ekonString
if has('conceal')
	syn region ekonString oneline matchgroup=ekonQuote start=/"/  skip=/\\\\\|\\"/  end=/"/ concealends contains=ekonEscape contained
	syn region ekonStringQ  matchgroup=ekonQuote start=/'/  skip=/\\\\\|\\'/  end=/'/ concealends contains=ekonEscape contained
else
	syn region ekonString oneline matchgroup=ekonQuote start=/"/  skip=/\\\\\|\\"/  end=/"/ contains=ekonEscape contained
	syn region ekonStringQ  matchgroup=ekonQuote start=/'/  skip=/\\\\\|\\'/  end=/'/ contains=ekonEscape contained
endif

" Syntax: Objects Keys
syn match ekonKeywordMatch /"\([^"]\|\\\"\)\+"[[:blank:]\r\n]*\:/ contains=ekonKeyword
if has('conceal')
   syn region ekonKey matchgroup=ekonQuote start=/"/  end=/"\ze[[:blank:]\r\n]*\:/ concealends contains=ekonEscape contained
else
   syn region ekonKey matchgroup=ekonQuote start=/"/  end=/"\ze[[:blank:]\r\n]*\:/ contains=ekonEscape contained
endif

" Syntax: Braces
syn region ekonFold matchgroup=ekonBraces start="{" end=/}/ transparent fold
syn region ekonFold matchgroup=ekonBraces start=/\[/ end=/\]/ transparent fold

" Syntax: Schema
syn region ekonSchema start=/\%^`/ skip=+\\`+ end=+`+ contains=@TypeScript




" ====== Set up highlighting ======
let b:current_syntax="ekon"

hi def link ekonQuote		Quote
hi def link ekonBoolean		Boolean
hi def link ekonIdentifier	String
hi def link ekonNull		Type
hi def link ekonNumber		Number
hi def link ekonFloat		Float
hi def link ekonComment		Comment
hi def link ekonString		String
hi def link ekonStringQ		String
hi def link ekonEscape		Special
hi def link ekonBraces		Delimiter
hi def link ekonNoise		Noise
hi def link ekonSchema		SpecialComment


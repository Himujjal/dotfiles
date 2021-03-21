" Vim syntax file Language: EKON
" Maintainer: Himujjal
" Latest Revision: 29 December, 2020

if !exists("main_syntax")
  let main_syntax='ekon'
endif

""" ======== Keywords ==========
syn keyword ekonKeywords null true false
syn keyword ekonCommentTodo contained  TODO FIXME XXX TBD NOTE

""" ======== Matches and regions ========

syn match ekonNoise     /[:,]/
syn match ekonColon     /:/


" Strings
syn region ekonString start=+\z(["']\)+ skip=+\\z1+ end="\z1" contains=ekonSpecial extend

syn match ekonIdentifier      contained /\<\K\k*/ skipwhite skipempty

syn match ekonSpecial contained "\\["\\/bfnrt]"
syn match ekonSpecial contained "\(\\u\x\{4}\|\\x\x\{2}\|\\U\x\{8}\)"

" Schema
syn include @TypeScript syntax/typescript.vim
syn region ekonSchema matchgroup=ekonDTS start=/\%^\(`\)/ skip=+\\`+ end=+`+ contains=@TypeScript 

" numbers
syn match ekonNumber /[+-]\=\<\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%(e[+-]\=\d\+\)\=\>/
syn match ekonNumber /[+-]\=\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\x\+\)\>/


syn region ekonComment start="//" end="$" contains=ekonCommentTodo

" ====== Set up highlighting ======
unlet b:current_syntax
let b:current_syntax="ekon"

hi def link ekonKeywords      Keyword
hi def link ekonBoolean		  Boolean
hi def link ekonIdentifier	  Label
hi def link ekonNumber		  Number
hi def link ekonFloat		  Float
hi def link ekonComment		  Comment
"hi def link ekonObjKey        Label 
"hi def link ekonObjKeyString  Label
hi def link ekonString		  String
hi def link ekonSpecial		  Special
hi def link ekonBraces		  Delimiter
hi def link ekonNoise		  Noise
hi def link ekonDTS        SpecialComment


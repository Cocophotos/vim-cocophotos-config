" Vim syntax file
" Language: Type Description Language (.tdl)
" Maintainer: Corentin Ribeyre 
" Lastest Revision: 20 February 2013

if exists("b:current_syntax")
  finish
endif

syn match attributeMatrice /\<\u[A-Z0-9-_]\+\>/

syn match specialLanguageKeywords "*list\*\|*top\*\|*ne-list\*\|diff-list\|*null\*"
syn keyword basicLanguageKeywords string 

syn keyword tdlTodo contained TODO FIXME XXX NOTE
syn match tdlComment ";.*$" contains=tdlTodo

syn region  tdlString start=+"+  skip=+\\\\\|\\"\|\\$+  end=+"\|$+

syn match tdlOperator ":=\|<!\|!>\|<\|>\|&\|\[\|\]"

let b:current_syntax = "tdl"

hi def link tdlTodo Todo
hi def link tdlComment Comment
hi def link basicLanguageKeywords Statement
hi def link specialLanguageKeywords Statement
hi def link attributeMatrice Constant
hi def link tdlString String
hi def link tdlOperator Operator

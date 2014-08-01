" Vim syntax file
" Language:	GRQL
" Maintainer:	Corentin Ribeyre <corentin.ribeyre@gmail.com>
" Last Change:	2013 July 3

" Based on qml syntax

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'grr'
endif

syn case ignore


syn keyword qmlCommentTodo      TODO FIXME XXX TBD WARNING NOTA contained
syn match   qmlLineComment      "#.*" contains=@Spell,qmlCommentTodo
syn match   qmlCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn match   qmlSpecial	       "\\\d\d\d\|\\."
syn region  qmlStringD	       start=+"+  skip=+\\\\\|\\"\|\\$+  end=+"\|$+  contains=qmlSpecial,@htmlPreproc
syn region  qmlStringS	       start=+'+  skip=+\\\\\|\\'\|\\$+  end=+'\|$+  contains=qmlSpecial,@htmlPreproc

syn match   qmlCharacter        "'\\.'"
syn match   qmlNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  qmlRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
syn match   qmlObjectLiteralType "[A-Za-z][_A-Za-z0-9]*\s*\({\)\@="
syn match   qmlNonBindingColon "?[^;]*:"
syn match   qmlBindingProperty "\<[A-Za-z][_A-Za-z.0-9]*\s*:"

syn keyword qmlReserved		match constraints commands rule negative precedence

syn keyword	qmlFunction      remove_feature add_feature share_down share_up redirect_down move_down move_share_down add_edge add_status remove_edge append_feature edge_status move_edge clone_edge modify_feature remove_node
syn match	qmlBraces	   "[{}\[\]]"
syn match	qmlParens	   "[()]"

syn sync fromstart
syn sync maxlines=100

if main_syntax == "grr"
  syn sync ccomment qmlComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_qml_syn_inits")
  if version < 508
    let did_qml_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink qmlLineComment		Comment
  HiLink qmlCommentTodo		Todo
  HiLink qmlSpecial		Special
  HiLink qmlStringS		String
  HiLink qmlStringD		String
  HiLink qmlCharacter		Character
  HiLink qmlNumber		Number
  HiLink qmlObjectLiteralType	Type
  HiLink qmlStatement		Statement
  HiLink qmlFunction		Function
  HiLink qmlBraces		Function
  HiLink qmlRegexpString	String

  HiLink qmlLabel		Label
  HiLink qmlReserved		Keyword
  HiLink qmlConstant		Label
  HiLink qmlNonBindingColon	NONE
  HiLink qmlBindingProperty	Label
  HiLink qmlIdProperty		Identifier

  delcommand HiLink
endif

let b:current_syntax = "grr"
if main_syntax == 'grr'
  unlet main_syntax
endif

" vim: ts=8

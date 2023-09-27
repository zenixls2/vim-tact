" Vim syntax file
" Language: Tact
" Maintainer: zenix (zenixls2@gmail.com)
" URL:	https://github.com/zenixls2/vim-tact

if exists("b:current_syntax")
  finish
endif

syn keyword tactKeyword get native extends mutates virtual override inline abstract
syn keyword tactKeyword const import
syn keyword tactKeyword if else while do until repeat return let fun self is initOf map bounced as
syn keyword tactBoolean false true
syn keyword tactKeywordReturn return
syn keyword tactBuiltinType Int Address Cell Slice uint64 coins remaining
syn keyword tactConditional if
syn match tactNumber /\<-\=\d\+L\=\>\|\<0[xX]\x\(\x\|_\)*\>/
syn region tactString start=+"+ skip=+\\\\\|\\$+ end=+"+

hi def link tactBoolean Boolean
hi def link tactConditional Conditional
hi def link tactKeyword Keyword
hi def link tactConstant Constant
hi def link tactBuiltinType Type
hi def link tactNumber Number
hi def link tactString String

hi def link tactKeywordReturn Return

syn match tactFunction /\<fun\|$\>/ nextgroup=tactFuncName,tactFuncArgs skipwhite
syn match tactFuncName contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=tactFuncArgs skipwhite
syn region tactFuncArgs contained matchgroup=tactFuncParens start='(' end=')' contains=tactFuncArgCommas,tactFuncTypeDelimter,tactBuiltinType keepend skipwhite skipempty
syn match tactModifierName contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=tactModifierArgs,tactModifierName skipwhite
syn region tactModifierArgs contained matchgroup=tactFuncParens start='(' end=')' contains=tactFuncArgCommas,tactFuncTypeDelimiter nextgroup=tactModifierName,tactFuncReturns skipwhite
syn region tactFuncReturns contained matchgroup=tactFuncParens start='(' end=')' contains=tactFuncArgCommas,tactFuncTypeDelimiter,tactBuiltinType
syn match tactFuncArgCommas contained ','
syn match tactFuncTypeDelimter contained ':'

hi def link tactFunction Type
hi def link tactModifierName Function
hi def link tactFuncName Function

syn keyword tactClass message trait contract
hi def link tactClass Label

syn match tactDecorator /\(@interface\)/
hi def link tactDecorator Special

syn match tactOperator  /\(!\||\|&\|+=\|+\|-\|!=\|<=\|>=\|=\)/

hi def link tactOperator Operator

syn match tactDelimiter /\(,\|;\|:\)/
hi def link tactDelimiter Special

syn keyword tactCommentTodo TODO FIXME XXX TBD contained
syn match tactCommentDoc / @[a-zA-Z_][a-zA-Z0-9_]*/
syn region tactLineComment start=+\/\/+ end=+$+ contains=tactCommentTodo,tactCommentDoc,@Spell
syn region tactLineComment start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ contains=tactCommentTodo,tactCommentDoc,@Spell fold
syn region tactComment start="/\*" end="\*/" contains=tactCommentTodo,tactCommentDoc,@Spell fold

hi def link tactCommentDoc Identifier
hi def link tactCommentTodo Todo
hi def link tactLineComment Comment
hi def link tactComment Comment

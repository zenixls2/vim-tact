" Vim syntax file
" Language: Tact
" Maintainer: zenix (zenixls2@gmail.com)
" URL:	https://github.com/zenixls2/vim-tact

if exists("b:current_syntax")
  finish
endif

syn region tactParen start=+(+ end=+)+ contains=tactStructInit,tactDelType,tactNumber,tactString,tactBoolean,tactOperator,tactKeyword,tactDelimiter skipwhite skipempty
syn region tactStructInit contained start=/[A-Z][a-zA-Z0-9_]*[ ]*{/ end=/}/ contains=tactBoolean,tactNumber,tactString,tactOperator,tactGlobalFunc,tactKeyword,tactDelimiter,tactInitItem,tactOperator skipwhite skipempty
syn match tactInitItem contained /:/ nextgroup=tactBoolean,tactString,tactNumber,tactGlobalFunc,tactStructInit skipwhite
syn match tactDelType contained /:/ nextgroup=tactKeyword,tactBoolean,tactFuncName,tactBuiltinType,tactCustomType skipwhite
syn match tactCustomType contained /[A-Z][a-zA-Z0-9_]*/

hi def link tactDelType Special
hi def link tactInitItem Special
hi def link tactCustomType Identifier

syn keyword tactGlobalFunc toCell myAddress send require context
hi def link tactGlobalFunc Special

syn keyword tactKeyword get native extends mutates virtual override inline abstract
syn keyword tactKeyword const import with return
syn keyword tactKeyword if else while do until repeat return let fun self is initOf map bounced as
syn keyword tactBoolean false true
syn keyword tactBuiltinType Int Address Cell Slice uint64 coins remaining Context Bool StateInit
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

"syn match tactFunction /\<fun\>/ nextgroup=tactFuncName,tactFuncArgs skipwhite
"syn match tactFuncName contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=tactFuncArgs skipwhite
"syn region tactFuncArgs contained matchgroup=tactFuncParens start='(' end=')' contains=tactFuncArgCommas,tactFuncTypeDelimter,tactBuiltinType keepend skipwhite skipempty
"syn match tactModifierName contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=tactModifierArgs,tactModifierName skipwhite
"syn region tactModifierArgs contained matchgroup=tactFuncParens start='(' end=')' contains=tactFuncArgCommas,tactFuncTypeDelimiter nextgroup=tactModifierName,tactFuncReturns skipwhite
"syn region tactFuncReturns contained matchgroup=tactFuncParens start='(' end=')' contains=tactFuncArgCommas,tactFuncTypeDelimiter,tactBuiltinType
"syn match tactFuncArgCommas contained ','
"syn match tactFuncTypeDelimter contained ':'

"hi def link tactFunction Type
"hi def link tactModifierName Function
"hi def link tactFuncName Function

syn keyword tactClass message trait contract
hi def link tactClass Label

syn match tactDecorator /\(@interface\)/
hi def link tactDecorator Special

syn match tactOperator  /\(!\||\|&\|+=\|+\|-\|!=\|<=\|>=\|=\|\*\|?\)/

hi def link tactOperator Operator

syn match tactDelimiter /\(,\|;\)/
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

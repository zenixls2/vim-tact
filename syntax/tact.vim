" Vim syntax file
" Language: Tact
" Maintainer: zenix (zenixls2@gmail.com)
" URL:	https://github.com/zenixls2/vim-tact

if exists("b:current_syntax")
  finish
endif

syn keyword tactKeyword get native extends mutates virtual override inline abstract
syn keyword tactKeyword const
syn keyword tactKeyword if else while do until repeat return let fun self is initOf map bounced as
syn keyword tactKeyword false true
syn keyword tactKeywordReturn return
syn keyword tactBuiltinType Int Address Cell Slice uint64 coins remaining
syn keyword tactConditional if

hi def link tactConditional Conditional
hi def link tactKeyword Keyword
hi def link tactConstant Constant
hi def link tactBuiltinType Type

hi def link tactKeywordReturn Return

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

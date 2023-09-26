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

hi def link tactKeyword Keyword
hi def link tactConstant Constant
hi def link tactBuiltinType Type

syn match tactOperator /\(?<=\\s\)\(<=>|>=|<=|!=|==|\\^>>|\\~>>|>>|<<|\\/%|\\^%|\\~%|\\^\\/|\\~\\/|\\+=|-=|\\*=|\\/=|~\\/=|\\^\\/=|%=|\\^%=|<<=|>>=|~>>=|\\^>>=|&=|\\|=|\\^=|\\^|=|~|\\/|%|-|\\*|\\+|>|<|&|\\||:|\\?\)\(?=\\s\)/

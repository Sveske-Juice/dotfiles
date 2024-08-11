" Vim syntax file
" Language: OpenBirch
" Maintainer: OpenBirch devs @ gitlab/Sveske-Juice/openbirch
" Latest Revision: 10 August 2024

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword openBirchStatement proc local end return for true false using

" Conditional Keywords
syn keyword openBirchConditional if elif else contained

" Operators
" syn match openBirchOperator '\V\+\|\-\|\*\|/\|\%\|\^\|:=\|\=\|\<\|\>'
syn match openBirchOperator '\V=\|-\|+\|*\|/\|%\|^\|:='


" Native procedures
" TODO: contains is a vim reserved keyword, find a way to include it
syn keyword openBirchFunction sin cos tan asin acos atan ln log sqrt cbrt nroot print diff lhs rhs type index

" Types
syn keyword openBirchType NUMBER STRING IDENTIFIER BOOLEAN NIL VECTOR FUNCTION PLUS MINUS MULTIPLICATION DIVISION MODOLUS EXPONENT NEGATE

" Comments
syn match openBirchComment "#.*$"

" Terminators (Semicolon)
syn match openBirchTerminator ';' contained

" Special Characters
syn keyword openBirchSpecial and or not

" Strings
syn region openBirchString start=+"+ skip=+\\\\\|\\$+ end=+"+ contains=openBirchSpecial

" Link to highlight groups
hi link openBirchStatement Statement
hi link openBirchConditional Conditional
hi link openBirchOperator Operator
hi link openBirchType Type
hi link openBirchFunction Function
hi link openBirchComment Comment
hi link openBirchString String
hi link openBirchSpecial Special
hi link openBirchTerminator Delimiter

let b:current_syntax = "obd"

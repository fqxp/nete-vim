" Vim syntax file
" Language: nete
" Maintainer: Frank Ploss <frank@fqxp.de>
" Latest Revision: 28 February 2018

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Header
syn match HeaderValueMutable contained '.*$'
syn match HeaderValueImmutable contained '.*$'
syn match HeaderKeyMutable contained '^\(Title\):' nextgroup=HeaderValueMutable
syn match HeaderKeyImmutable contained '^\(Id\|Created-At\|Updated-At\):' nextgroup=HeaderValueImmutable

syn region Header start="\%^" end="\ze\n" transparent contains=HeaderKeyMutable,HeaderKeyImmutable

" Markdown body
unlet! b:current_syntax
syn include @MARKDOWN syntax/markdown.vim
let b:current_syntax = "nete"

syn region MarkdownBody start="\n" end="\%$" contains=@MARKDOWN

" Styles
hi def link HeaderKeyMutable Type
hi def link HeaderKeyImmutable Type
hi def link HeaderValueMutable Normal
hi def link HeaderValueImmutable Comment

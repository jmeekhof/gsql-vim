" Vim syntax file
" Language: GSQL
" Maintainer: Josh Meekhof

if exists("b:current_syntax")
    finish
endif

syn case ignore

syn  cluster    gsqlALL          contains=TOP
"    Errors
syn  match      gsqlError        ")"       " Lonely paren
syn  match      gsqlError        "]"
syn  match      gsqlError        "}"
syn  match      gsqlError        ",\(\_\s*[;)]\)\@="                            "             Comma before a closing paren
"    Special    words
syn  keyword    gsqlSpecial      false null true

" Keywords
syn  keyword    gsqlKeyword      bag compress define directed distributed drop
syn  keyword    gsqlKeyword      edge for from from graph install job list
syn  keyword    gsqlKeyword      loading map primary_id print query return
syn  keyword    gsqlKeyword      returns reverse_edge run select set stats to
syn  keyword    gsqlKeyword      tuple typedef undirected use using where with
syn  keyword    gsqlKeyword      vertex
"    Operators
"syn  match      gsqlOperator     "\v\*"
"syn  match      gsqlOperator     "\v/"
"syn  match      gsqlOperator     "\v\+"
"syn  match      gsqlOperator     "\v-"
"syn  match      gsqlOperator     "\v\%"
"syn  match      gsqlOperator     "\v\<\<"
"syn  match      gsqlOperator     "\v>>"
"syn  match      gsqlOperator     "\v\&"
"syn  match      gsqlOperator     "\v|"
"syn  keyword    gsqlOperator     != < <= == > >=
syn  match      gsqlOperator "\v\!\="
syn  match      gsqlOperator "\v\=\="
syn  match      gsqlOperator "\v\<\="
syn  match      gsqlOperator "\v\>\="
syn  match      gsqlOperator "\v\<"
syn  match      gsqlOperator "\v\>"
syn  keyword    gsqlOperator     and between in is like not or
"    Types
syn  keyword    gsqlType         contained bool double datetime fixed_binary float int jsonarray jsonobject string uint
"    ToDo       style
syn  keyword    gsqlTodo         contained FIXME TODO
"    Comments
syn  region     gsqlComment      start="/\*" end="\*/" contains=gsqlTodo
syn  match      gsqlComment      "//.*$" contains=gsqlTodo
syn  match      gsqlComment      "#.*$" contains=gsqlTodo

" Variables
syn  match      gsqlVariable     "\v\$\w+"
syn  match      gsqlVariable     -\v\$"\w+"-

"    Strings
syn  region     gsqlString       start=/\v"/ skip=/\v\\./ end=/\v"/ contains=gsqlVariable
"TODO Check if gsql does variable interpolation
syn  region     gsqlString       start=/\v'/ skip=/\v\\./ end=/\v'/

syn  match      gsqlNumber       "\v<\d+>"
syn  match      gsqlNumber       "\v<\d+\.\d+>"
syn  match      gsqlNumber       "\v<\d\d+e[+-]\d+>"
syn  match      gsqlNumber       "\v<\d+\.\d+e[+-]\d+>"
syn  match      gsqlNumber       "\v<0x[abcdef0-9]+>"


" Correct paren, bracket and brace usage
syn  region     gsqlParens       transparent matchgroup=gsqlParen start="(" end=")"
syn  region     gsqlParens       transparent matchgroup=gsqlParen start="{" end="}"
syn  region     gsqlParens       transparent matchgroup=gsqlParen start="\[" end="\]"
syn  match      gsqlParensEmpty  "()"
syn  region     gsqlParens       transparent matchgroup=gsqlParenFunc start="\(\<\w\+\>\)\@<=(" end=")"

syn  region     gsqlTypeParens   contained matchgroup=gsqlType start="(" end=")" contains=@gsqlALL
syn  match      gsqlTypeMatch    contained "\(\(^\|[,(]\)\s*\S\+\s\+\)\@<=\w\+\(\s*([^)]\+)\)\?" contains=gsqlType,gsqlTypeParens
syn  region     gsqlTypeRegion   matchgroup=gsqlParen start="\(create\s\+vertex\s\+[^(]\+\s\+\)\@<=(" end=")" contains=@gsqlALL,gsqlTypeMatch
syn  region     gsqlTypeRegion   matchgroup=gsqlParen start="\(create\s\+edge\s\+[^(]\+\s\+\)\@<=(" end=")" contains=@gsqlALL,gsqlTypeMatch
"    Functions
syn  match      gsqlFunction     "\<\(abs\|acos\|asin\|atan2\|atan\|ceil\)(\@="
syn  match      gsqlFunction     "\<\(containsKey\|cos\|cosh\|datetime_add\)(\@="
syn  match      gsqlFunction     "\<\(datetime_diff\|datetime_format\|datetime_sub\)(\@="
syn  match      gsqlFunction     "\<\(datetime_to_epoch\|day\|epoch_to_datetime\)(\@="
syn  match      gsqlFunction     "\<\(exp\|float_to_int\|floor\|fmod\|getBool\)(\@="
syn  match      gsqlFunction     "\<\(getDouble\|getInt\|getJsonArray\|getJsonObject\)(\@="
syn  match      gsqlFunction     "\<\(getString\|hour\|ldexp\|log10\|log\|lower\)(\@="
syn  match      gsqlFunction     "\<\(minute\|month\|now\|parse_json_array\)(\@="
syn  match      gsqlFunction     "\<\(parse_json_object\|pow\|second\|sin\|sinh\)(\@="
syn  match      gsqlFunction     "\<\(size\|sqrt\|str_to_int\|tan\|tanh\)(\@="
syn  match      gsqlFunction     "\<\(to_datetime\|to_string\|trim\|upper\|year\)(\@="

" Statement
syn  keyword    gsqlStatement    alter delete drop grant select
syn  match      gsqlStatement    "\<\(replace\|create\)\>"

"contained matchgroup=gsqlType


highlight    link  gsqlComment        Comment
highlight    link  gsqlError          Error
highlight    link  gsqlFunction       Function
highlight    link  gsqlKeyword        Keyword
highlight    link  gsqlNumber         Number
highlight    link  gsqlOperator       Operator
highlight    link  gsqlParen          Comment
highlight    link  gsqlParenEmpty     Operator
highlight    link  gsqlParenFunction  Function
highlight    link  gsqlSpecial        Special
highlight    link  gsqlStatement      Statement
highlight    link  gsqlString         String
highlight    link  gsqlTodo           Todo
highlight    link  gsqlType           Type
highlight link gsqlVariable Identifier


let b:current_syntax = "gsql"

" Vim syntax file
" Language: GSQL
" Maintainer: Josh Meekhof

if exists("b:current_syntax")
    finish
endif

syntax case ignore

syntax  cluster    gsqlALL          contains=TOP
" Errors
syntax  match      gsqlError        "\v\)"       " Lonely paren
syntax  match      gsqlError        "\v\]"
syntax  match      gsqlError        "\v\}"
syntax  match      gsqlError        "\v,(\_\s*[;\)])@=" "Comma before a closing paren
" Special    words
syntax  keyword    gsqlSpecial      false null true

" Keywords
syntax  keyword    gsqlKeyword      accum bag compress define directed distributed drop edge filename for foreach
syntax  keyword    gsqlKeyword      from gen-data graph header install job list loading map post\-accum primary_id
syntax  keyword    gsqlKeyword      print query quote return returns reverse_edge run schema_change select
syntax  keyword    gsqlKeyword      separator set stats temp_table to total_instance tuple typedef undirected use
syntax  keyword    gsqlKeyword      user_defined_header using values vertex where with

" Operators
syntax  match      gsqlOperator     "\v/"
syntax  match      gsqlOperator     "\v\+"
syntax  match      gsqlOperator     "\v\+\="
syntax  match      gsqlOperator     "\v\="
syntax  match      gsqlOperator     "\v-"
syntax  match      gsqlOperator     "\v\%"
syntax  match      gsqlOperator     "\v\&"
syntax  match      gsqlOperator     "\v\|"
syntax  match      gsqlOperator     "\v\*"
syntax  match      gsqlOperator     "\v\<"
syntax  match      gsqlOperator     "\v\>"
syntax  match      gsqlOperator     "\v\!\="
syntax  match      gsqlOperator     "\v\=\="
syntax  match      gsqlOperator     "\v\<\="
syntax  match      gsqlOperator     "\v\>\="
syntax  keyword    gsqlOperator     and between in is like not or
" Types
syntax  keyword    gsqlType         bool double datetime fixed_binary
syntax  keyword    gsqlType         float int jsonarray jsonobject string uint vertex edge
" Accumulator Types
syntax  keyword    gsqlType         andaccum arrayaccum avgaccum bagaccum bitwiseandaccum
syntax  keyword    gsqlType         bitwiseoraccum groupbyaccum heapaccum listaccum
syntax  keyword    gsqlType         mapaccum maxaccum minaccum oraccum setaccum sumaccum
" ToDo       style
syntax  keyword    gsqlTodo         contained FIXME TODO
" Comments
syntax  region     gsqlComment      start="\v/\*" end="\v\*/" contains=gsqlTodo
syntax  match      gsqlComment      "\v//.*$" contains=gsqlTodo
syntax  match      gsqlComment      "\v#.*$" contains=gsqlTodo

" Variables
syntax  match      gsqlVariable     "\v\$\w+"
syntax  match      gsqlVariable     -\v\$"\w+"-
syntax  match      gsqlVariable     "\v\@{1,2}\w+"

"    Strings
syntax  region     gsqlString       start=/\v"/ skip=/\v\\./ end=/\v"/ contains=gsqlVariable
"TODO Check if gsql does variable interpolation
syntax  region     gsqlString       start=/\v'/ skip=/\v\\./ end=/\v'/

syntax  match      gsqlNumber       "\v<\d+>"
syntax  match      gsqlNumber       "\v<\d+\.\d+>"
syntax  match      gsqlNumber       "\v<\d\d+e[+-]\d+>"
syntax  match      gsqlNumber       "\v<\d+\.\d+e[+-]\d+>"
syntax  match      gsqlNumber       "\v<0x[abcdef0-9]+>"


" Correct paren, bracket and brace usage
syntax  region     gsqlParens       transparent matchgroup=gsqlParen start="\v\(" end="\v\)"
syntax  region     gsqlParens       transparent matchgroup=gsqlParen start="\v\{" end="\v\}"
syntax  region     gsqlParens       transparent matchgroup=gsqlParen start="\v\[" end="\v\]"
syntax  match      gsqlParensEmpty  "\v\(\)"
syntax  region     gsqlParens       transparent matchgroup=gsqlParenFunc start="\v(<\w+>)@<=\(" end="\v\)"

syntax  region     gsqlTypeParens   contained matchgroup=gsqlType start="\v\(" end="\v\)" contains=@gsqlALL
syntax  match      gsqlTypeMatch    contained "\v((^|[,(]\)\s*\S+\s+)@<=\w+\(\s*([^)]+))?" contains=gsqlType,gsqlTypeParens
syntax  region     gsqlTypeRegion   matchgroup=gsqlParen start="\v(create\s+vertex\s+[^(]+\s+)@<=\(" end="\v\)" contains=@gsqlALL,gsqlTypeMatch
syntax  region     gsqlTypeRegion   matchgroup=gsqlParen start="\v(create\s+(directed)?\s*edge\s+[^(]+\s+)@<=\(" end="\v\)" contains=@gsqlALL,gsqlTypeMatch
"    Functions
syntax  match      gsqlFunction     "\v<(abs|acos|asin|atan2|atan|ceil)\(@="
syntax  match      gsqlFunction     "\v<(containsKey|cos|cosh|datetime_add)\(@="
syntax  match      gsqlFunction     "\v<(datetime_diff|datetime_format|datetime_sub)\(@="
syntax  match      gsqlFunction     "\v<(datetime_to_epoch|day|epoch_to_datetime)\(@="
syntax  match      gsqlFunction     "\v<(exp|float_to_int|floor|fmod|getBool)\(@="
syntax  match      gsqlFunction     "\v<(getDouble|getInt|getJsonArray|getJsonObject)\(@="
syntax  match      gsqlFunction     "\v<(getString|hour|ldexp|log10|log|lower)\(@="
syntax  match      gsqlFunction     "\v<(minute|month|now|parse_json_array)\(@="
syntax  match      gsqlFunction     "\v<(parse_json_object|pow|second|sin|sinh)\(@="
syntax  match      gsqlFunction     "\v<(size|sqrt|str_to_int|tan|tanh)\(@="
syntax  match      gsqlFunction     "\v<(to_datetime|to_string|trim|upper|year)\(@="
" Vertex Functions
syntax  match      gsqlFunction     "\v(outdegree|neighbors|neighborattribute|edgeAttribute|filter)\@="
" Tokenizer Function
syntax  match      gsqlFunction     "\v<(gsql_reverse|gsql_concat|gsql_split_by_space|gsql_to_bool|gsql_to_uint|gsql_to_int|gsql_ts_to_epoch_seconds|gsql_current_time_epoch|flatten|flatten_json_array|split)\(@="
" Edge Functions
syntax  match      gsqlFunction     "\v(isdirected)\(@="

" Statement
syntax  keyword    gsqlStatement    alter delete drop grant select
syntax  match      gsqlStatement    "\v<(replace|create)>"
syntax  keyword    gsqlStatement    union intersect minus add max min
" Control flow statements
syntax  keyword    gsqlStatement    case do else end if then when while

highlight  link  gsqlComment        Comment
highlight  link  gsqlError          Error
highlight  link  gsqlFunction       Function
highlight  link  gsqlKeyword        Keyword
highlight  link  gsqlNumber         Number
highlight  link  gsqlOperator       Operator
highlight  link  gsqlParen          Comment
highlight  link  gsqlParenEmpty     Operator
highlight  link  gsqlParenFunction  Function
highlight  link  gsqlSpecial        Special
highlight  link  gsqlStatement      Statement
highlight  link  gsqlString         String
highlight  link  gsqlTodo           Todo
highlight  link  gsqlType           Type
highlight  link  gsqlVariable       Identifier

let b:current_syntax = "gsql"

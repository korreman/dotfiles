# Detection
# ---------

hook global BufCreate .*\.(erl|hrl) %{
    set-option buffer filetype erlang
}

# Highlighters
# ------------

add-highlighter shared/erlang regions
add-highlighter shared/erlang/code default-region group
add-highlighter shared/erlang/double-string region '"' (?<!\\)(\\\\)*" fill string
add-highlighter shared/erlang/single-string region "'" (?<!\\)(\\\\)*' fill value
add-highlighter shared/erlang/comment       region '%' $               fill comment
add-highlighter shared/erlang/type-declaration region '^-type' '\.'    fill type

evaluate-commands %sh{
    keywords="after|and|andalso|band|begin|bnot|bor|bsl|bsr"
    keywords="${keywords}|bxor|case|catch|cond|div|end|fun"
    keywords="${keywords}|if|let|not|of|or|orelse|query|receive"
    keywords="${keywords}|rem|try|when|xor"
    types="none|pid|port|reference|float|atom|integer|list"
    types="${types}|maybe_improper_list|nonempty_improper_list"
    types="${types}|nonempty_list|map|tuple"
    types="${types}|term|binary|bitstring|boolean|byte|char"
    types="${types}|nil|number|string|nonempty_string|iodata"
    types="${types}|iolist|fun|function|module|mfa|arity|identifier"
    types="${types}|node|timeout|no_return|non_neg_integer"
    types="${types}|pos_integer|neg_integer"
    values="false|true"
    guard_functions="is_alive|is_boolean|is_builtin|is_constant"
    guard_functions="${guard_functions}|is_float|is_float|is_integer"
    guard_functions="${guard_functions}|is_list|is_number|is_pid|is_port"
    guard_functions="${guard_functions}|is_record|is_reference|is_tuple"
    guard_functions="${guard_functions}|tuple_size|is_binary|is_bitstring"
    guard_functions="${guard_functions}|is_function|bit_size|byte_size"
    guard_functions="${guard_functions}|length|map_size"
    operators="=:=|=/=|/=|==|=<|<-|<|>=|->|=|>|\|\||\|"

    printf %s\\n "hook global WinSetOption filetype=erlang %{
        set-option window static_words '${keywords}:${types}:${values}:${guard_functions}'
    }" | tr '|' ':'

    printf %s "
        add-highlighter shared/erlang/code/ regex \b[A-Z][A-Za-z0-9]*\b 0:variable
        add-highlighter shared/erlang/code/ regex \b(${keywords})\b 0:keyword
        add-highlighter shared/erlang/code/ regex \b(${values})\b 0:value
        add-highlighter shared/erlang/code/ regex \b\d+\b 0:value
        add-highlighter shared/erlang/code/ regex \b(${guard_functions})\b 0:builtin
        add-highlighter shared/erlang/code/ regex (${operators}) 0:operator
    "
}
# Commands
# --------

define-command -hidden erlang-indent-on-new-line %~
    evaluate-commands -draft -itersel %=
        # preserve previous line indent
        try %{ execute-keys -draft \;K<a-&> }
        # indent after lines ending with ->, (, [, {
        try %& execute-keys -draft k<a-x> <a-k> (->|\(|\{|\[)\h*$ <ret> j<a-gt> &
        # cleanup trailing white spaces on the previous line
        try %{ execute-keys -draft k<a-x> s \h+$ <ret>d }
        # align to opening paren of previous line
        try %{ execute-keys -draft [( <a-k> \A\([^\n]+\n[^\n]*\n?\z <ret> s \A\(\h*.|.\z <ret> '<a-;>' & }
    =
~

# Initialization
# --------------

hook -group erlang-highlight global WinSetOption filetype=erlang %{
    add-highlighter window/ ref erlang
}

hook global WinSetOption filetype=erlang %{
 hook window InsertChar \n -group erlang-indent erlang-indent-on-new-line
}

hook -group erlang-highlight global WinSetOption filetype=(?!erlang).* %{
    remove-highlighter window/erlang
}

# http://www.verilog.com/

# Detection

hook global BufCreate .*[.](v|vh) %{
    set-option buffer filetype verilog
}

# Highlighters
#
add-highlighter shared/verilog regions
add-highlighter shared/verilog/code default-region group
# Strings need to exclude escaped string characters as end patterns
add-highlighter shared/verilog/string       region '"' '"'         fill string
add-highlighter shared/verilog/comment      region '/\*' '\*/'     fill comment
add-highlighter shared/verilog/line_comment region '//' '$'        fill comment

# Values
add-highlighter shared/verilog/code/ regex \b([+-]?[0-9_]+(\.[0-9_]+)?((e|E)[+-]?[0-9_]+)?)\b 0:value
add-highlighter shared/verilog/code/ regex ([+-]?[1-9_]*'[sS]?[bB][01_xXzZ?]+)\b 0:value
add-highlighter shared/verilog/code/ regex ([+-]?[1-9_]*'[sS]?[oO][0-7_xXzZ?]+)\b 0:value
add-highlighter shared/verilog/code/ regex ([+-]?[1-9_]*'[sS]?[dD][0-9_xXzZ?]+)\b 0:value
add-highlighter shared/verilog/code/ regex ([+-]?[1-9_]*'[sS]?[hH][0-9_a-fA-FxXzZ?]+)\b 0:value

add-highlighter shared/verilog/code/ regex ([-/%=<>!~&@]|\*|\||\^|\+) 0:operator

add-highlighter shared/verilog/code/ regex \b(supply0|supply1|tri|triand|trior|tri0|tri1|uwire|wire|wand|wor|trireg|wire|integer|real|realtime|reg|time|module)\b 0:type
add-highlighter shared/verilog/code/ regex \b(signed|unsigned|input|output|vectored|scalared|highz0|highz1|strong0|strong1|pull0|pull1|weak0|weak1|\(small\)|\(medium\)|\(large\))\b 0:attribute
add-highlighter shared/verilog/code/ regex \b(module|macromodule|endmodule)\b 0:module
add-highlighter shared/verilog/code/ regex \b(parameter|localparam|defparam|specparam)\b 0:meta

# System tasks and functions: $identifier

# TODO: Expand directives
#add-highlighter shared/verilog/code/ regex (`define [a-zA-Z_][a-zA-Z0-9_]*) 0:meta
add-highlighter shared/verilog/code/ regex (`[a-zA-Z_][a-zA-Z0-9_]*) 0:meta

evaluate-commands %sh{
    # Grammar
    keywords="always|and|assign|automatic|begin|buf|bufif0|bufif1|case|casex|casez|cell|cmos|config"
    keywords="${keywords}|deassign|default|design|disable|edge|else|end|endcase|endconfig"
    keywords="${keywords}|endfunction|endgenerate|endprimitive|endspecify"
    keywords="${keywords}|endtable|endtask|event|for|force|forever|fork|function|generate|genvar"
    keywords="${keywords}|if|ifnone|incdir|include|initial|inout"
    keywords="${keywords}|instance|integer|join|large|liblist|library|localparam"
    keywords="${keywords}|nand|negedge|nmos|nor"
    keywords="${keywords}|noshowcancelled|not|notif0|notif1|or"
    keywords="${keywords}|pmos|posedge|primitive|pulldown|pullup"
    keywords="${keywords}|pulsestyle_onevent|pulsestyle_ondetect|rcmos|real"
    keywords="${keywords}|release|repeat|rnmos|rpmos|rtran|rtranif0|rtranif1"
    keywords="${keywords}|showcancelled|specify"
    keywords="${keywords}|table|task|tran"
    keywords="${keywords}|tranif0|tranif1|"
    keywords="${keywords}|use|wait|while|wor|xnor"
    keywords="${keywords}|xor"
    printf %s "add-highlighter shared/verilog/code/ regex '\b(${keywords})\b' 0:keyword"
}

# Initialization
hook -group verilog-highlight global WinSetOption filetype=verilog %{
    add-highlighter window/verilog ref verilog
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/verilog }
}


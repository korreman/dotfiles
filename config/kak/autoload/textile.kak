# Detection
# ---------

hook global BufCreate .+\.textile %{
    set-option buffer filetype textile
}


# Initialization
# --------------

hook -group textile-highlight global WinSetOption filetype=textile %{
    require-module textile

    add-highlighter window/textile ref textile
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/textile }
}

provide-module textile %{

# Highlighters
# ------------

add-highlighter shared/textile regions
add-highlighter shared/textile/text default-region group

add-highlighter shared/textile/comment region "^###\." "^$\n" fill comment

add-highlighter shared/textile/text/paragraph regex "^(p((<?>?)|=)?\(*\. )" 0:comment
add-highlighter shared/textile/text/preformatted regex "^(pre\.\.? )" 0:comment

add-highlighter shared/textile/text/heading1 regex \
"^(?<prefix>h1((<?>?)|=)?\.) (?S)(?<title>.+)$\n$" prefix:conceal title:default+bu
add-highlighter shared/textile/text/heading2 regex \
    "^(?<prefix>h2((<?>?)|=)?\.) (?S)(?<title>.+)$\n$" prefix:conceal title:default+b
add-highlighter shared/textile/text/heading3 regex \
    "^(?<prefix>h3((<?>?)|=)?\.) (?S)(?<title>.+)$\n$" prefix:conceal title:default+bi
add-highlighter shared/textile/text/heading4 regex \
    "^(?<prefix>h4((<?>?)|=)?\.) (?S)(?<title>.+)$\n$" prefix:conceal title:default+u
add-highlighter shared/textile/text/heading5 regex \
    "^(?<prefix>h5((<?>?)|=)?\.) (?S)(?<title>.+)$\n$" prefix:conceal title:default+ui
add-highlighter shared/textile/text/heading6 regex \
    "^(?<prefix>h6((<?>?)|=)?\.) (?S)(?<title>.+)$\n$" prefix:conceal title:default+i

# Commands
# --------


}

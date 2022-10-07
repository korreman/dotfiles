# WhyML
# ‾‾‾‾‾
# Adapted from ocaml highlighter.

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*\.mlw %{
    set-option buffer filetype WhyML
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=WhyML %{
    require-module WhyML
    set-option window static_words %opt{WhyML_static_words}
}

hook -group WhyML-highlight global WinSetOption filetype=WhyML %{
    add-highlighter window/WhyML ref WhyML
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/WhyML }
}

provide-module WhyML %{

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/WhyML regions
add-highlighter shared/WhyML/code default-region group
add-highlighter shared/WhyML/string region (?<!')" (?<!\\)(\\\\)*" fill string
add-highlighter shared/WhyML/quotedstring region -match-capture %"\{(\w*)\|" %"\|(\w*)\}" fill string
add-highlighter shared/WhyML/comment region -recurse \Q(* \Q(* \Q*) fill comment

add-highlighter shared/WhyML/code/char regex %{\B'([^'\\]|(\\[\\"'nrtb])|(\\\d{3})|(\\x[a-fA-F0-9]{2})|(\\o[0-7]{3}))'\B} 0:value

# integer literals
add-highlighter shared/WhyML/code/ regex \b[0-9][0-9_]*([lLn]?)\b                          0:value
add-highlighter shared/WhyML/code/ regex \b0[xX][A-Fa-f0-9][A-Fa-f0-9_]*([lLn]?)\b         0:value
add-highlighter shared/WhyML/code/ regex \b0[oO][0-7][0-7_]*([lLn]?)\b                     0:value
add-highlighter shared/WhyML/code/ regex \b0[bB][01][01_]*([lLn]?)\b                       0:value
# float literals
add-highlighter shared/WhyML/code/ regex \b[0-9][0-9_]*(\.[0-9_]*)?([eE][+-]?[0-9][0-9_]*)?                       0:value
add-highlighter shared/WhyML/code/ regex \b0[xX][A-Fa-f0-9][A-Fa-f0-9]*(\.[a-fA-F0-9_]*)?([pP][+-]?[0-9][0-9_]*)? 0:value
# constructors. must be put before any module name highlighter, as a fallback for capitalized identifiers
add-highlighter shared/WhyML/code/ regex \b[A-Z][a-zA-Z0-9_]*\b                            0:value
# the module name in a module path, e.g. 'M' in 'M.x'
add-highlighter shared/WhyML/code/ regex (\b[A-Z][a-zA-Z0-9_]*[\h\n]*)(?=\.)               0:module
# (simple) module declarations
add-highlighter shared/WhyML/code/ regex (?<=module)([\h\n]+[A-Z][a-zA-Z0-9_]*)            0:module
# (simple) signature declarations. 'type' is also highlighted, due to the lack of quantifiers in lookarounds.
# Hence we must put keyword highlighters after this to recover proper highlight for 'type'
add-highlighter shared/WhyML/code/ regex (?<=module)([\h\n]+type[\h\n]+[A-Z][a-zA-Z0-9_]*) 0:module
# (simple) open statements
add-highlighter shared/WhyML/code/ regex (?<=open)([\h\n]+[A-Z][a-zA-Z0-9_]*)              0:module
# operators
add-highlighter shared/WhyML/code/ regex [@!$%%^&*\-+=|<>/?\\]+                            0:operator
# types
add-highlighter shared/WhyML/code/ regex (?<=:)(\h*[\w']+)+                                   0:type


# Macro
# ‾‾‾‾‾

evaluate-commands %sh{
  keywords="and|as|asr|assert|begin|class|constraint|do|done|downto|else|end|exception|external|false"
  keywords="${keywords}|for|fun|function|functor|if|in|include|inherit|initializer|land|lazy|let|lor"
  keywords="${keywords}|lsl|lsr|lxor|match|method|mod|module|mutable|new|nonrec|object|of|open"
  keywords="${keywords}|private|rec|sig|struct|then|to|true|try|type|val|virtual|when|while|with|use"

  # WhyML-specific keywords:
  proof_keywords="predicate|lemma|theory|invariant|requires|returns|ensures|variant|raises|by"

  builtins="length|forall|exists|raise|old"

printf %s\\n "declare-option str-list WhyML_static_words ${keywords}|${proof_keywords}|${builtins}" | tr '|' ' '

# must be put at last, since we have highlighted some keywords ('type' in 'module type') to other things
  printf %s "
    add-highlighter shared/WhyML/code/ regex \b(${keywords})\b 0:keyword
    add-highlighter shared/WhyML/code/ regex \b(${proof_keywords})\b 0:keyword
    add-highlighter shared/WhyML/code/ regex \b(${builtins})\b 0:function
  "
}

}

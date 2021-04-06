# Kalm colorscheme
# Let's put down some guiding principles:

evaluate-commands %sh{
    ### Color Definitions ###

    # Use pure black and white for foreground and background, based on the theory that contrast can be reduced just as well using the monitor brightness controls.
    black="rgb:000000"
    white="rgb:ffffff"

    # Greys
    grey1="rgb:a2a1a0"
    grey2="rgb:c2c1c0"
    grey3="rgb:ededed"

    # Dark foreground colors
    # The primary highlight colors should be dark, saturated, and muted.
    # While also standing in decent contrast to each other
    purple="rgb:7540b8"
    purple2="rgb:94038a"
    red="rgb:a50021"
    blue="rgb:286eb5"
    green="rgb:228b22"
    olive="rgb:6b873c"
    orange="rgb:c46210"
    yellow="rgb:ad9600"
    greyblue="rgb:6a7cf7"
    teal="rgb:00a396"

    # Light background colors
    purple_bg="rgb:dfdeff" # periwinkle/lavender
    blue_bg="rgb:b1e2fc"
    pink_bg="rgb:ffd9e5"
    champagne_bg="rgb:f1ddcf"
    greyblue_bg="rgb:dfe7f5"
    green_bg="rgb:a1e6ba"
    orange_bg="rgb:fed8b1"


    ### End Color Definitions ###
    cat <<- EOF

    ### Syntax higlighting ###
    # Bolden keywords and operators
    face global attribute ${black}+bf
    face global keyword ${black}+bf
    face global operator ${black}+bf
    face global builtin ${black}+bf

    # Reduce contrast for comments and documentation
    face global comment ${grey1}
    face global documentation ${grey1}+i

    # High-level syntax
    face global meta ${purple2}+f
    face global module ${purple}
    face global type ${blue}

    # Low level syntax
    face global function ${red}
    face global variable ${green}

    face global value ${yellow}+ufg
    face global string ${orange}


    ### UI faces ###
    face global Default ${black},${white}
    face global Whitespace ${grey1},${white}
    face global Prompt ${black}

    face global PrimaryCursor ${white},${blue}+fg
    face global PrimaryCursorEol ${white},${blue}+fg
    face global PrimarySelection ${black},${blue_bg}+fg

    face global SecondaryCursor ${white},${purple}+fg
    face global SecondaryCursorEol ${white},${purple}+fg
    face global SecondarySelection ${black},${purple_bg}+fg

    face global MatchingChar ${black},${grey2}+fg
    face global WrapMarker comment

    face global LineNumbers ${blue},${greyblue_bg}
    face global LineNumbersWrapped ${greyblue_bg},${greyblue_bg}
    face global LineNumberCursor ${white},${greyblue}
    face global BufferPadding ${white},${white}

    face global MenuForeground ${white},${greyblue}
    face global MenuBackground ${black},${greyblue_bg}
    face global MenuInfo ${blue},${greyblue_bg}
    face global Information ${black},${orange_bg}
    face global Error default,${pink_bg}

    face global StatusLine ${black},${greyblue_bg}
    face global StatusLineMode ${black},${green_bg}
    face global StatusLineInfo ${white},${greyblue}
    face global StatusLineValue ${black}
    face global StatusCursor ${white},${greyblue}


    ### Markup ###
    face global title ${black}+bu
    face global header ${black}+b
    face global mono ${green}
    face global block ${green}
    face global link ${blue}+u
    face global bullet ${red}
    face global list ${orange}

    face global bold ${black}+b
    face global italic ${black}+i
    face global underline ${black}+u

    ### Language Server Protocol ###
    face global Reference default,${grey3}
    face global DiagnosticError Error
    face global DiagnosticWarning default,${grey3}
    face global LineFlagErrors ${red}
    face global InlayHint comment
    face global SnippetsNextPlaceholders ${white},${greyblue}
    face global SnippetsOtherPlaceholders ${black},${greyblue_bg}

EOF
}

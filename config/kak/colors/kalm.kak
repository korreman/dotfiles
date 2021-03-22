# Kalm colorscheme
# Let's put down some guiding principles:

evaluate-commands %sh{
    ### Color Definitions ###

    # Use pure black and white for foreground and background, based on the theory that contrast can be reduced just as well using the monitor brightness controls.
    black="rgb:000000"
    white="rgb:ffffff"

    # Greys
    grey0="rgb:727170"
    grey1="rgb:a2a1a0"
    grey2="rgb:b2b1b0"
    grey3="rgb:c2c1c0"
    grey4="rgb:d2d1d0"
    grey5="rgb:ededed"

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
    greyblue="rgb:6a7cf7"

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

    ### Code ###
    # Bolden keywords and operators
    face global attribute default+bf
    face global keyword default+bf
    face global operator default+bf

    # Reduce contrast for comments and documentation
    face global comment ${grey1}
    face global documentation ${grey1}+i

    # High-level syntax
    face global builtin ${olive}
    face global meta ${purple2}
    face global module ${purple}
    face global type ${blue}

    # Low level syntax
    face global function ${red}
    face global variable ${green}

    face global value ${orange}+u
    face global string ${orange}


    ### UI faces ###
    face global Default ${black},${white}
    face global Whitespace default
    face global Prompt default

    face global PrimaryCursor ${white},${blue}+fg
    face global PrimaryCursorEol ${white},${blue}+fg
    face global PrimarySelection ${black},${blue_bg}+fg

    face global SecondaryCursor ${white},${purple}+fg
    face global SecondaryCursorEol ${white},${purple}+fg
    face global SecondarySelection ${black},${purple_bg}+fg

    face global MatchingChar ${black},${grey3}+fg
    face global WrapMarker comment

    face global LineNumbers ${black},${greyblue_bg}
    face global LineNumbersWrapped ${greyblue_bg},${greyblue_bg}
    face global LineNumberCursor ${white},${greyblue}
    face global BufferPadding ${white},${white}

    face global MenuForeground ${white},${greyblue}
    face global MenuBackground ${black},${greyblue_bg}
    face global MenuInfo ${blue}
    face global Information ${black},${orange_bg}
    face global Error default,${pink_bg}

    face global StatusLine default,${greyblue_bg}
    face global StatusLineMode ${black},${green_bg}
    face global StatusLineInfo ${white},${greyblue}
    face global StatusLineValue default
    face global StatusCursor ${white},${greyblue}


    ### Markup ###
    face global title default+bu
    face global header default+b
    face global mono ${green}
    face global block ${green}
    face global link ${blue}+u
    face global bullet ${red}
    face global list ${orange}

    face global bold default+b
    face global italic default+i
    face global underline default+u

    ### Language Server Protocol ###
    face global Reference default,${grey5}
    face global DiagnosticError Error
    face global DiagnosticWarning default,${grey5}
    face global LineFlagErrors ${red}
    face global InlayHint comment
    face global SnippetsNextPlaceholders ${white},${greyblue}
    face global SnippetsOtherPlaceholders ${black},${greyblue_bg}

EOF
}

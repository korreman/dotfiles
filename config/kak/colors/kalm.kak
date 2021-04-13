# Kalm colorscheme

evaluate-commands %sh{
    ### Color Definitions ###

    black="rgb:383838"
    white="rgb:f9fdff"

    # Greys
    black_br="rgb:484848" #for bolded fonts
    grey1="rgb:909192"
    grey2="rgb:c0c1c2"
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
    purplish_blue="rgb:6a7cf7"
    greyblue="rgb:8292b3"
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
    face global attribute $black_br+bf
    face global keyword $black_br+bf
    face global operator $black_br+bf
    face global builtin $black_br+bf

    # Reduce contrast for comments and documentation
    face global comment $grey1
    face global documentation $grey1+i

    # High-level syntax
    face global meta $purple2+f
    face global module $purple
    face global type $blue

    # Low level syntax
    face global function $red
    face global variable $green

    face global value $yellow+ufg
    face global string $orange


    ### UI faces ###
    face global Default $black,$white
    face global Whitespace $grey1,$white
    face global Prompt $black

    face global PrimaryCursor $white,$blue+fg
    face global PrimaryCursorEol $white,$blue+fg
    face global PrimarySelection $black,$blue_bg+fg

    face global SecondaryCursor $white,$purple+fg
    face global SecondaryCursorEol $white,$purple+fg
    face global SecondarySelection $black,$purple_bg+fg

    face global MatchingChar $black,$grey2+fg
    face global WrapMarker comment

    face global LineNumbers $greyblue,$white
    face global LineNumbersWrapped $white,$white
    face global LineNumberCursor $purplish_blue,$greyblue_bg

    face global BufferPadding $white,$white

    face global MenuForeground $white,$purplish_blue
    face global MenuBackground $black,$greyblue_bg
    face global MenuInfo $blue,$greyblue_bg
    face global Information $black,$orange_bg
    face global Error default,$pink_bg

    face global StatusLine $black,$white
    face global StatusLineMode $black,$green_bg
    face global StatusLineInfo $white,$purplish_blue
    face global StatusLineValue $black
    face global StatusCursor $white,$purplish_blue


    ### Markup ###
    face global title $black+bu
    face global header $black+b
    face global mono $green
    face global block $green
    face global link $blue+u
    face global bullet $red
    face global list $orange

    face global bold $black+b
    face global italic $black+i
    face global underline $black+u

    ### Language Server Protocol ###
    face global Reference default,$grey3
    face global DiagnosticError Error
    face global DiagnosticWarning default,$grey3
    face global LineFlagErrors $red
    face global InlayHint comment
    face global SnippetsNextPlaceholders $white,$purplish_blue
    face global SnippetsOtherPlaceholders $black,$greyblue_bg

EOF
}

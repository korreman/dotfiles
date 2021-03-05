# Minimalist light theme

# Uses terminal ANSI normal and bright colors, as well as various
# Assumptions:
# 1. The background is the exact same color as bright white
# 2. Normal colors stand in contrast to bright white
# 3. Bright colors stand in contrast to black
# 4. Bright colors do not have to contrast with bright-white

# Code
face global value blue
face global string yellow

face global module bright-black
face global keyword default+b
face global builtin default+b

face global type green
face global attribute default+b

face global comment bright-black
face global documentation bright-black

face global variable default
face global function default
face global operator default
face global meta default

# Markup
face global title default+bu
face global header default+bu
face global mono green,default
face global block green,default
face global link blue+u
face global bullet default+b
face global list default+b

# Language Server Protocol (kak-lsp)
face global Reference default,white
face global DiagnosticError default,bright-red
face global DiagnosticWarning default
face global LineFlagErrors red
face global InlayHint default+fg
face global SnippetsNextPlaceholders default+fg
face global SnippetsOtherPlaceholders default+fg

# UI faces
face global Default default,default

face global PrimaryCursor bright-white,blue+fg
face global PrimaryCursorEol bright-white,blue+fg
face global PrimarySelection default,bright-blue+fg

face global SecondaryCursor bright-white,magenta+fg
face global SecondaryCursorEol bright-white,magenta+fg
face global SecondarySelection default,bright-magenta+fg

face global MatchingChar default,white+fg
face global WrapMarker bright-black,default
face global Whitespace default,default

face global LineNumbers bright-black,default
face global LineNumberCursor bright-black,default+r
face global LineNumbersWrapped bright-white,bright-white+F
face global BufferPadding bright-white,default

face global MenuForeground bright-white,blue
face global MenuBackground default,white
face global MenuInfo default,white
face global Information default,bright-yellow
face global Error default,bright-red

face global StatusLine default
face global StatusLineMode default,bright-green
face global StatusLineInfo default,bright-blue
face global StatusLineValue cyan
face global StatusCursor bright-white,blue

face global Prompt default

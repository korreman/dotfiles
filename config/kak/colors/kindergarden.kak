# A minimalist light theme, using built-in terminal colors

# Uses terminal ANSI normal, bright, and dim colors, as well as various attributes
# Assumptions:
# 1. The background is the exact same color as bright white
# 2. Normal colors stand in contrast to bright white
# 3. Bright colors stand in contrast to black
# 4. Bright colors do not have to contrast with bright-white

### Code ###

# Bolden keywords and operators
face global attribute default+bF
face global keyword default+bF
face global builtin default+bF
face global operator default+bF

# Reduce contrast for comments and documentation
face global comment bright-black+F
face global documentation bright-black+iF

# High-level syntax
face global meta magenta+F
face global module green+F
face global type red+F

# Low level syntax
face global function yellow+F
face global variable green+F

face global value blue+udF
face global string default,bright-green+F


### Markup ###
face global title default+bu
face global header default+bu
face global mono green,default
face global block green,default
face global link blue+u
face global bullet default+b
face global list default+b

face global bold default+b
face global italic default+i
face global underline default+u

face global conceal bright-white,default

### Language Server Protocol ###
face global Reference default,white
face global DiagnosticError default,bright-red+g
face global DiagnosticWarning default
face global LineFlagErrors red
face global InlayHint default+fg
face global SnippetsNextPlaceholders default+fg
face global SnippetsOtherPlaceholders default+fg

### UI faces ###
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
face global MenuInfo default,white+F
face global Information default,bright-yellow
face global Error default,bright-red+g

face global StatusLine default
face global StatusLineMode default,bright-green
face global StatusLineInfo default,bright-blue
face global StatusLineValue cyan
face global StatusCursor bright-white,blue

face global Prompt default

# A minimalist light theme, using built-in terminal colors

# Uses terminal ANSI normal, bright, and dim colors, as well as various attributes
# Assumptions:
# 1. The background is the exact same color as bright white
# 2. Normal colors stand in contrast to bright white
# 3. Bright colors stand in contrast to black
# 4. Bright colors do not have to contrast with bright-white

##### Color Definitions #####
face global White rgb:ffffff
face global Black rgb:000000

# Greys
face global FgWhite   rgb:dedfe0
face global BgBlack   rgb:a0a0a0

# Foregrounds
face global FgRed     rgb:a10008
face global FgGreen   rgb:008c24
face global FgBlue    rgb:5294e2
face global FgYellow  rgb:c26f00
face global FgCyan    rgb:1c888c
face global FgMagenta rgb:bb10c2

# Backgrounds
face global BgRed     rgb:fcc7c7
face global BgGreen   rgb:9fedc6
face global BgBlue    rgb:b5d7ff
face global BgYellow  rgb:ffe5a6
face global BgCyan    rgb:b5f1f7
face global BgMagenta rgb:f5c4ea

# Move somewhere else
face global DimBlue   rgb:467fc2


##### Assignments #####

### Code ###

# Bolden keywords and operators
face global attribute default+bf
face global keyword default+bf
face global builtin default+bf
face global operator default+bf

# Reduce contrast for comments and documentation
face global comment bright-black+f
face global documentation bright-black+if

# High-level syntax
face global meta magenta+f
face global module green+f
face global type red+f

# Low level syntax
face global function yellow+f
face global variable green+f

face global value blue+udf
face global string rgb:0f4f00,rgb:cbf2df+f


### Markup ###
face global title default+bu
face global header default+bu
face global mono green
face global block green
face global link blue+u
face global bullet default+b
face global list default+b

face global bold default+b
face global italic default+i
face global underline default+u

### Language Server Protocol ###
face global Reference default,white
face global DiagnosticError default,bright-red+g
face global DiagnosticWarning default,rgb:eeeff0
face global LineFlagErrors red
face global InlayHint bright-blue+i
face global SnippetsNextPlaceholders default+fg
face global SnippetsOtherPlaceholders default+fg

### UI faces ###
face global Default default

face global PrimaryCursor bright-white,blue+fg
face global PrimaryCursorEol bright-white,blue+fg
face global PrimarySelection default,bright-blue+fg

face global SecondaryCursor bright-white,magenta+fg
face global SecondaryCursorEol bright-white,magenta+fg
face global SecondarySelection default,bright-magenta+fg

face global MatchingChar default,white+fg
face global WrapMarker bright-black
face global Whitespace default

face global LineNumbers bright-black
face global LineNumberCursor bright-black+r
face global LineNumbersWrapped bright-white,bright-white+F
face global BufferPadding bright-white

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

@echo off

SET color= '^
    // { } ^
    /(.ERROR)/        {print "\033[5;31m" $0 "\033[0m"} ^
    /(.WARNING)/      {print "\033[1;33m" $0 "\033[0m"} ^
    /(.INFO)/         {print "\033[0;96m" $0 "\033[0m"} ^
    /(.DEBUG)/        {print "\033[7;32m" $0 "\033[0m"} ^
    /(.VERBOSE)/      {print "\033[0;95m" $0 "\033[0m"} '

awk %color%

REM  Formatting

REM  0 - reset
REM  1 - bold
REM  2 - dim (opaque)
REM  4 - underline
REM  5 - blink
REM  7 - inverter (background)
REM  8 - hidden (for passwords)
REM
REM  Colors
REM  30 - black   34 - blue
REM  31 - red     35 - magenta
REM  32 - green   36 - cyan
REM  33 - yellow  39 - default fg
REM
REM  90 - dark gray     94 - light blue
REM  91 - light red     95 - light magenta
REM  92 - light green   96 - light cyan
REM  93 - light yellow  97 - white

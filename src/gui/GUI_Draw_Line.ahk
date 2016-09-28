; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines -1

global SS_BLACKRECT   := 0x4       ; displays a frame around the control and fills the control with a solid color that is the same color as the Window Frame (COLOR_WINDOWFRAME).
global SS_GRAYRECT    := 0x5       ; displays a frame around the control and fills the control with a solid color that is the same color as the Desktop (COLOR_BACKGROUND).
global SS_WHITERECT   := 0x6       ; displays a frame around the control and fills the control with a solid color that is the same color as the Window (COLOR_WINDOW).
global SS_BLACKFRAME  := 0x7       ; displays a frame around the control that is the same color as the Window Frame (COLOR_WINDOWFRAME).
global SS_GRAYFRAME   := 0x8       ; displays a frame around the control that is the same color as the Desktop, the screen background (COLOR_BACKGROUND).
global SS_WHITEFRAME  := 0x9       ; displays a frame around the control that is the same color as the Window (COLOR_WINDOW).
global SS_ETCHEDHORZ  := 0x10      ; Draws the top and bottom edges of the static control using the EDGE_ETCHED edge style.
global SS_ETCHEDVERT  := 0x11      ; Draws the left and right edges of the static control using the EDGE_ETCHED edge style.
global SS_ETCHEDFRAME := 0x12      ; Draws the frame of the static control using the EDGE_ETCHED edge style.
global SS_SUNKEN      := 0x1000    ; Draws a half-sunken border around a static control.

; GUI ===========================================================================================================================

Gui, Add, Text, x10  y10    w50                   , % "SS_BLACKRECT"
Gui, Add, Text, x10  y30    w50   h1    0x4       ; Horizontal Line (small)   >   SS_BLACKRECT
Gui, Add, Text, x10  y33    w50   h4    0x4       ; Horizontal Line (big)     >   SS_BLACKRECT
Gui, Add, Text, x10  y40    w1    h50   0x4       ; Vertical   Line (small)   >   SS_BLACKRECT
Gui, Add, Text, x13  y40    w4    h50   0x4       ; Vertical   Line (big)     >   SS_BLACKRECT

Gui, Add, Text, x150 y10    w50                   , % "SS_BLACKFRAME"
Gui, Add, Text, x150 y30    w50   h7    0x7       ; Horizontal Frame          >   SS_BLACKFRAME
Gui, Add, Text, x150 y40    w7    h50   0x7       ; Vertical   Frame          >   SS_BLACKFRAME


Gui, Add, Text, x10  y110   w50                   , % "SS_GRAYRECT"
Gui, Add, Text, x10  y130   w50   h1    0x5       ; Horizontal Line (small)   >   SS_GRAYRECT
Gui, Add, Text, x10  y133   w50   h4    0x5       ; Horizontal Line (big)     >   SS_GRAYRECT
Gui, Add, Text, x10  y140   w1    h50   0x5       ; Vertical   Line (small)   >   SS_GRAYRECT
Gui, Add, Text, x13  y140   w4    h50   0x5       ; Vertical   Line (big)     >   SS_GRAYRECT

Gui, Add, Text, x150 y110   w50                   , % "SS_GRAYFRAME"
Gui, Add, Text, x150 y130   w50   h7    0x8       ; Horizontal Frame          >   SS_GRAYFRAME
Gui, Add, Text, x150 y140   w7    h50   0x8       ; Vertical   Frame          >   SS_GRAYFRAME


Gui, Add, Text, x10  y210   w50                   , % "SS_WHITERECT"
Gui, Add, Text, x10  y230   w50   h1    0x6       ; Horizontal Line (small)   >   SS_WHITERECT
Gui, Add, Text, x10  y233   w50   h4    0x6       ; Horizontal Line (big)     >   SS_WHITERECT
Gui, Add, Text, x10  y240   w1    h50   0x6       ; Vertical   Line (small)   >   SS_WHITERECT
Gui, Add, Text, x13  y240   w4    h50   0x6       ; Vertical   Line (big)     >   SS_WHITERECT

Gui, Add, Text, x150 y210   w50                   , % "SS_WHITEFRAME"
Gui, Add, Text, x150 y230   w50   h7    0x9       ; Horizontal Frame          >   SS_WHITEFRAME
Gui, Add, Text, x150 y240   w7    h50   0x9       ; Vertical   Frame          >   SS_WHITEFRAME


Gui, Add, Text, x10  y310                         , % "SS_ETCHEDHORZ / -VERT / -FRAME"
Gui, Add, Text, x10  y330   w50   h1    0x10      ; Horizontal Line (small)   >   SS_ETCHEDHORZ
Gui, Add, Text, x10  y340   w1    h50   0x11      ; Vertical   Line (small)   >   SS_ETCHEDVERT

Gui, Add, Text, x150 y330   w50   h7    0x12      ; Horizontal Frame          >   SS_ETCHEDFRAME
Gui, Add, Text, x150 y340   w7    h50   0x12      ; Vertical   Frame          >   SS_ETCHEDFRAME


Gui, Add, Text, x10  y410                         , % "SS_SUNKEN"
Gui, Add, Text, x10  y430   w50   h1    0x1000    ; Horizontal Line (small)   >   SS_SUNKEN
Gui, Add, Text, x10  y440   w1    h50   0x1000    ; Vertical   Line (small)   >   SS_SUNKEN

Gui, Add, Text, x150 y430   w50   h7    0x1000    ; Horizontal Frame          >   SS_SUNKEN
Gui, Add, Text, x150 y440   w7    h50   0x1000    ; Vertical   Frame          >   SS_SUNKEN


Gui, Show, AutoSize
return

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp
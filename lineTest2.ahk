; https://autohotkey.com/board/topic/80586-how-to-draw-lines-in-a-gui-guidrawline/#entry56447
; how to draw lines on a GUI

Gui,1:+ToolWindow
Gui,1:Margin,0,0
Gui, 1:Font, s36 Bold , Verdana
Gui, 1:Add, Text, x10 y10 w400, Text Written Before Line Drawing
LineSize=1
y=1

Loop, 65 {
 GuiDrawLine(0,Y,LineSize,1,1)
 LineSize+=5
 y+=6
}

Gui, 1:Font, s36 Bold
Gui, 1:Add, Text, x10 y200 w400 BackgroundTrans, Transparent Text Written After Drawing
Gui,1:Show, ,GUI:1
Return

; Copy and Paste GuiDrawLine() belowComments / Suggestions are welcome.

GuiDrawLine(X,Y,Size,VH="",Guin="") {
If (Guin="" OR Guin<1 OR Guin>99)
    Guin=1

If VH=
   VH=1

Size+=4

Gui, %Guin%:Font, S1

if VH
   Gui, %Guin%:Add, Text, x%X% y%Y% w%Size% 0x10
Else
   Gui, %Guin%:Add, Text, x%X% y%Y% h%Size% 0x11

Gui, %Guin%:Font, S
Return errorlevel
}
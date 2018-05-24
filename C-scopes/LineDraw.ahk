Gui, 1:+ToolWindow
Gui,1:Margin,0,0
GuiDrawLine(20,20,80)
GuiDrawLine(20,20,80,0)
GuiDrawLine(80, 0,80,0)
GuiDrawLine(0, 80,80)
Gui,1:Show,x10 y10 w100 h100,GUI:1

Gui, 2:+ToolWindow
GuiDrawLine(0,10,100,1,2)
GuiDrawLine(0,90,100,1,2)
GuiDrawLine(10,0,100,0,2)
GuiDrawLine(90,0,100,0,2)
Gui,2:Show,x125 y10 w100 h100,GUI:2

Gui, 3:+ToolWindow
GuiDrawLine(0,33,100,1,3)
GuiDrawLine(0,66,100,1,3)
GuiDrawLine(33,0,100,0,3)
GuiDrawLine(66,0,100,0,3)
Gui,3:Show,x240 y10 w100 h100,GUI:3
Return

; Copy and Paste GuiDrawLine() below

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
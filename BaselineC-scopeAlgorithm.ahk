; GI referral Algorithm 
; CARS; Dr. D. Frank / Nick Fees 
; Walker Jackson, MD 5/22/18 
; 
; writen to run in the FaskKeys environment 

; associated files, Table Baseline C-scope timing 
; ? Data RAPS Recap / Optum Quality Tips ? if available 
; preferred provider referral list

; referral pt. must be asymptomatic else directly to GI 
; pt. target age 50 - 75
; pt. must not have active cancer or be on Hemodialysis (? FIT test)
; If previous C-scope EBM Surveillance interval (see dialog/MsgBox) 

Gui, Add, Picture, w650 h450, D:\Documents\AutoHotkey\EBM\EBM-Protocols\GuiPic.png
; symptoms?
Gui, Add, Button, x50 y110 vCSxY gCSxY, Yes
Gui, Add, Button, x90 y110 vCSxN gCSxN, No
; other Yes / No buttons added as user makes selections 

; chart button
Gui, Add, Button, x595 y392 gC_chart, Chart
; Specialist Selection
Gui, Add, Button, x60 y345, Specialist`nSelection

Gui, Show, w670 h470, Colonscope Interval Referral Algorithm 
return

CSxY:
; to age
GuiDrawLine(143, 81, 60, 1, 0)
GuiControl, Disable, CSxN
Gui, Add, Button, x245 y110 gCAgeY, Yes
Gui, Add, Button, x285 y110 gCAgeN, No
return

CSxN:
; to Pass Through
GuiControl, Disable, CSxY
GuiDrawLine(84, 135, 23, 0, 0)
GuiDrawLine(84, 260, 45, 0, 0)
return

CAgeY:
; to Can / Dialysis
Gui, Add, Button, x385 y110 gCaHemY, Yes
Gui, Add, Button, x425 y110 gCaHemN, No
GuiDrawLine(335, 81, 25, 1, 0)
;
return

CAgeN:
; to FMH
GuiDrawLine(273, 135, 23, 0, 0)
Gui, Add, Button, x228 y230 gFMH_CaY, Yes
Gui, Add, Button, x294 y230 gFMH_CaN, No

return 

CaHemY:
; to No C-scope recommended
GuiDrawLine(468, 81, 40, 1, 0)
return

CaHemN:
; to Previous C-scope
Gui, Add, Button, x395 y230 gPCscopeY, Yes
Gui, Add, Button, x435 y230 gPCscopeN, No 
GuiDrawLine(420 ,132, 23, 0, 0)
return

FMH_CaY:
; to Previous C-scop2
Gui, Add, Button, x395 y230 gPCscopeY, Yes
Gui, Add, Button, x435 y230 gPCscopeN, No 
GuiDrawline(318, 208, 50, 1, 0)
return

FMH_CaN:
; to no C-scope or IFOBT
GuiDrawLine(273, 255, 42, 0, 0)
return 

PCscopeY:
GuiDrawLine(476, 208, 53, 1, 0)
GuiDrawLine(530, 208, 90, 0, 0)
return 

PCscopeN:
;MsgBox, Yes
GuiDrawLine(426, 255, 42, 0, 0)
return

C_chart:
run, TimingDialog.ahk
return 


; * * * * * * * * * * * * * * * * * * * *
; Line drawing routing 
; https://autohotkey.com/board/topic/80586-how-to-draw-lines-in-a-gui-guidrawline/#entry56447
; GuiDrawLine(X,Y,LineLength,Horizontal,Gui_Instance_Number)
; Note: All the 5 parameters are expected as numbers.
; The X Coordinate on the GUI
; The Y Coordinate on the GUI
; The Length of the line
; 0 for Vertical Line and 1 for Horizontal Line.
; GUI Instance Number 1-99

GuiDrawLine(X,Y,Size,VH="",Guin="") {
If (Guin="" OR Guin<1 OR Guin>99)
    Guin=1

If VH=
   VH=1

Size+=4

Gui, %Guin%:Font, S1
; Gui, Font,s20

if VH
   Gui, %Guin%:Add, Text, x%X% y%Y% w%Size% 0x10
Else
   Gui, %Guin%:Add, Text, x%X% y%Y% h%Size% 0x11

Gui, %Guin%:Font, S
Return errorlevel
}



GuiClose:
ExitApp
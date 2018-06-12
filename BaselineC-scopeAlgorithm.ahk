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

GuiRestart: 
;report string 

C_RptStr := ""
; Gui, Add, Picture, w650 h450, D:\Documents\AutoHotkey\EBM\EBM-Protocols\GuiPic.png
; Gui Offset x +10 / Y +4

Gui, Add, Picture, w866 h495, GuiPic.png
; symptoms?
Gui, Add, Button, x75 y115 vCSxY gCSxY, Yes
Gui, Add, Button, x115 y115 vCSxN gCSxN, No
; other Yes / No buttons added as user makes selections 

; chart button
Gui, Add, Button, x810 y430 gC_chart, Chart
; Specialist Selection
Gui, Add, Button, x85 y380, Specialist`nSelection
; reset - clear GUI and restart
Gui, Add, Button, x775 y190 gReset-Start, Reset or`nRestart

;Gui, Show, w670 h470, Colonscope Interval Referral Algorithm 
Gui, Show, w890 h505, Colonscope Interval Referral Algorithm 
return


; * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; the basic GUI interface routines

; allow user to restart / reset the protocol to start over
Reset-start:
Gui, Destroy
goto GuiRestart
return 


CSxY:
; to age
GuiDrawLine(194, 87, 84, 1, 0)
GuiControl, Disable, CSxN
Gui, Add, Button, x330 y115 vCAgeY gCAgeY, Yes
Gui, Add, Button, x375 y115 vCAgeN gCAgeN, No
C_RptStr := "The Patient is currently asymptomatic`n"
return

CSxN:
; to Pass Through
GuiControl, Disable, CSxY
GuiDrawLine(111, 150, 25, 0, 0)
GuiDrawLine(110, 287, 50, 0, 0)
C_RptStr := "The Patient currently has Symptoms`nSelect a GI specialist to evaluate your patient"
goto C_RptOut
return

CAgeY:
; to Can / Dialysis
GuiControl, Disable, CAgeN
Gui, Add, Button, x525 y115 vCaHemY gCaHemY, Yes
Gui, Add, Button, x575 y115 vCaHemN gCaHemN, No
GuiDrawLine(450, 87, 42, 1, 0)
C_RptStr := C_RptStr "They are in the 50-75 year old age range`n"
;
return

CAgeN:
; to FMH
GuiControl, Disable, CAgeY
GuiDrawLine(368, 150, 18, 0, 0)
Gui, Add, Button, x309 y248 vFMH_CaY gFMH_CaY, Yes
Gui, Add, Button, x400 y248 vFMH_CaN gFMH_CaN, No
C_RptStr := C_RptStr  "They are not in the 50-75 year old age range`n"
return 

CaHemY:
GuiControl, Disable, CaHemN
; to No C-scope recommended
GuiDrawLine(633, 88, 55, 1, 0)
C_RptStr := C_RptStr  "They have either and active cancer or on Hemodialysis and`n screening Colonoscopy is not recommended"
goto C_RptOut
return

CaHemN:
; to Previous C-scope
GuiControl, Disable, CaHemY
Gui, Add, Button, x535 y248 vPCscopeY gPCscopeY, Yes
Gui, Add, Button, x585 y248 vPCscopeN gPCscopeN, No 
GuiDrawLine(568 ,144, 23, 0, 0)
C_RptStr := C_RptStr  "There is no reported active cancer or hemodialysis status`n"
return

FMH_CaY:
; to Previous C-scop2
GuiControl, Disable, FMH_CaN
Gui, Add, Button, x535 y248 vPCscopeY gPCscopeY, Yes
Gui, Add, Button, x585 y248 vPCscopeN gPCscopeN, No 
C_RptStr := C_RptStr  "They have a FMH of Colon cancer or advanced Adenoma > 10mm`n"
GuiDrawline(436, 228, 63, 1, 0)
return

FMH_CaN:
; to no C-scope or IFOBT
GuiControl, Disable, FMH_CaY
GuiDrawLine(368, 280, 48, 0, 0)
C_RptStr := C_RptStr  "There is no FMH of Colon cancer or advanced Adenoma`nA screening Colonscopy is not indicated.`nIf the patient if 75 y/o or older a final FIT test is recommended"
goto C_RptOut
return 

PCscopeY:
GuiControl, Disable, PCScopeN
GuiDrawLine(641, 228, 74, 1, 0)
GuiDrawLine(717, 228, 97, 0, 0)
MsgBox, "Please select the findings of previous C-scope and date"
;run, TimingDialog.ahk
gosub, PathGui
MsgBox, "Please select a specialist to perform the procedure`n"%C_RptStr%
return 

PCscopeN:
GuiControl, Disable, PCScopeY
GuiDrawLine(577, 279, 46, 0, 0)
GuiDrawline(578, 436, 39, 0, 0)
GuiDrawLine(110, 476, 465, 1, 0)
GuiDrawLine(110, 457, 17, 0, 0)
C_RptStr := C_RptStr  "Screening C-scope indicated.`nPlease select a specialist to perform the procedure"
goto C_RptOut
return

C_chart:
;run, TimingDialog.ahk
gosub PathGui
MsgBox, "clicked on Chart Button  " %PolypType% "`n" %PathDate%
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

; final report to the user of the referral algorithm 
C_RptOut:
MsgBox, %C_RptStr% "`n" %PolypStr%
return

GuiClose:
ExitApp

; * * * * * * * * * * * * * * * * * * * *
;
; Here is a dialog display w/user choice recorded 
PathGui:
PolypType := ""
PolypStr := ""
Gui, 2:Add, Text, x5 y0, Polyp Number and Pathology                                                  Screening Interval 
Gui, 2:Add, Radio, x6 y17 w300 h20 vcRBPolyp gcPolyp, No Polyps
Gui, 2:Add, Radio, x6 y47 w300 h20 gcPolyp, Small (<10mm) hyperplastic polyps in rectum or sigmoid
Gui, 2:Add, Radio, x6 y77 w300 h20 gcPolyp, 1 - 2 small (<10mm) tubular adenomas
Gui, 2:Add, Radio, x6 y107 w300 h20 gcPolyp, 3 - 10 tubular adenomas
Gui, 2:Add, Radio, x6 y137 w300 h20 gcPolyp, > 10 adenomas
Gui, 2:Add, Radio, x6 y167 w300 h20 gcPolyp, 1 or more tubular adenomas >= 10mm
Gui, 2:Add, Radio, x6 y197 w300 h20 gcPolyp, 1 or more villous adenomas
Gui, 2:Add, Radio, x6 y227 w300 h20 gcPolyp, Adenomas with HGD
Gui, 2:Add, Radio, x16 y287 w290 h20 gcPolyp, Sessile serrated polyps <10mm w/o dsyplasia
Gui, 2:Add, Radio, x16 y317 w290 h20 gcPolyp, Sesslile serrated polyps >= 10mm
Gui, 2:Add, Radio, x16 y347 w290 h20 gcPolyp, Sessile serrated polyps w/dysplasia
Gui, 2:Add, Radio, x16 y377 w290 h20 gcPolyp, Traditional Serrated adenoma
Gui, 2:Add, Radio, x6 y407 w300 h20 gcPolyp, Serrated Polyposis Syndrome
Gui, 2:Add, Radio, x6 y437 w300 h30 gcPolyp, FMH of colon cancer or high risk adenomas`; beginning 10 years younger than the age of the index relative
Gui, 2:Add, Text, x316 y17 w60 h20 , 10 years
Gui, 2:Add, Text, x316 y47 w60 h20 , 10 years
Gui, 2:Add, Text, x316 y77 w60 h20 , 7 - 10 years
Gui, 2:Add, Text, x316 y107 w60 h20 , 3- 5 years
Gui, 2:Add, Text, x316 y137 w60 h20 , < 3 years
Gui, 2:Add, Text, x316 y167 w60 h20 , 3 years
Gui, 2:Add, Text, x316 y197 w-120 h30 , 3 years
Gui, 2:Add, Text, x316 y197 w60 h20 , 3 years
Gui, 2:Add, Text, x316 y227 w60 h20 , 3 years
Gui, 2:Add, Text, x6 y257 w370 h20 , Serrated Lesions:
Gui, 2:Add, Text, x316 y287 w60 h20 , 5 years
Gui, 2:Add, Text, x316 y317 w60 h20 , 3 years
Gui, 2:Add, Text, x316 y347 w60 h20 , 3 years
Gui, 2:Add, Text, x316 y377 w60 h20 , 3 years
Gui, 2:Add, Text, x316 y407 w60 h20 , 1 year
Gui, 2:Add, Text, x316 y437 w60 h30 , 5 years
Gui, 2:Add, Text, x6 y477, Chose the date for the MOST RECENT PATHOLOGY 
Gui, 2:Add, DateTime, x30 y495 vPathDate gPathDate, M/d/yy
Gui, 2:Add, Button, x300 y492, Done
; Generated using SmartGUI Creator for SciTE
Gui, 2:Show, w391 h532, Asymptomaitc Patients Only 
PathDate := "too soon"
return

; user response 
PathDate:
Gui, 2:Submit, NoHide
pickedDate := true
if (PolypType >= 1) and (PolypType <= 14) {
   goto doneGui2
   }
return 


cPolyp:
Gui, 2:Submit, NoHide
PolypType := cRBPolyp
if (PolypType = 1) {
   PolypStr := "No polyps"
   screenTime := 10
   }
else if (PolypType = 2) {
   PolypStr := "Small (<10mm) hyperplastic polyps in rectum or sigmoid"
   screenTime := 10
   }
else if (PolypType = 3) {
   PolypStr := "1 - 2 small (<10mm) tubular adenomas"
   screenTime := 7
   }
else if (PolypType = 4) {
   PolypStr := "3 - 10 tubular adenomas"
   screenTime := 3
   }
else if (PolypType = 5) {
   PolypStr := "> 10 adenomas"
   screenTime := 3
   }
else if (PolypType = 6) {
   PolypStr := " 1 or more tubular adenomas >= 10mm"
   screenTime := 3
   }
else if (PolypType = 7) {
   PolypStr := "1 or more villous adenomas"
   screenTime := 3
   }
else if (PolypType = 8) {
   PolypStr := "Adenomas with HGD"
   screenTime := 3
   }
else if (PolypType = 9) {
   PolypStr := " Sessile serrated polyps <10mm w/o dsyplasia"
   screenTime := 3
   }
else if (PolypType = 10) {
   PolypStr := "Sesslile serrated polyps >= 10mm"
   screenTime := 5
   }
else if (PolypType = 11) {
   PolypStr := "Sessile serrated polyps w/dysplasia"
   screenTime := 3
   }
else if (PolypType = 12) {
   PolypStr := "Traditional Serrated adenoma"
   screenTime := 3
   }
else if (PolypType = 13) {
   PolypStr := "Serrated Polyposis Syndrome"
   screenTime := 1
   }
else if (PolypType = 14) {
   PolypStr := "FMH of colon cancer or high risk adenomas`; beginning 10 years younger than the age of the index relative"
   screenTime := 5
}
; check PathDate set above
if (pickedDate) {
   goto doneGui2
   }
return

; done with this GUI
doneGui2:
Gui, 2:Destroy

return 

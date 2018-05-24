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

Gui, Add, DateTime, x96 y7 w100 h30 , 
Gui, Add, Text, x6 y7 w80 h30 , Date of last Colonoscope
Gui, Add, Button, x176 y47 w100 h50 , Patient Age 50- 75 years?
Gui, Add, Button, x136 y157 w110 h60 , FMH of Colon cancer or advanced Adenoma >= 10mm?
Gui, Add, Button, x6 y47 w100 h50 , Is patient Asymptomatic?
Gui, Add, Button, x106 y67 w70 h20 , Yes>>----->
Gui, Add, Button, x276 y67 w70 h20 , Yes>>----->
Gui, Add, Button, x36 y97 w30 h70 , NO`n|`n|`n|`n\/
Gui, Add, Button, x26 y277 w170 h60 +Center, Specialist Selection
Gui, Add, Button, x206 y97 w30 h60 , No`n|`n|`n\/
Gui, Add, Button, x346 y47 w100 h50 , Advance cancer or Hemodialysis?
Gui, Add, Button, x426 y277 w30 h70 , NO`n|`n|`n|`n\/
Gui, Add, Button, x296 y157 w70 h60 , Previous C-scope
Gui, Add, Button, x246 y177 w50 h20 , No>>--->
Gui, Add, Button, x106 y177 w30 h70 , Yes`n|`n|`n|`n\/
Gui, Add, Button, x226 y267 w110 h40 , EBM interval appropriate?
; Generated using SmartGUI Creator for SciTE
Gui, Show, w477 h377, Untitled GUI
return

GuiClose:
ExitApp
; table for Baseline Colonoscopy
; CARS; GI referral for follow-up C-scopes
; Walker Jackson, MD 5/22/18; 

MsgBox, 262144, Baseline Colon Follow Up Timing:                                        Interval,No Polyps						| 10 years`nSmall (<10mm) hyperplastic polyps in rectum or sigmoid	| 10 years`n1 to 2 small (<10mm) tubular adenomas			| 7-10 years`n3-10 tubular adenomas				| 3-5 years`n>10 adenomas					| <3 years`n>=1 tubular adenomas >=10mm			| 3 years`n>=1 villous adenomas				| 3 years`nAdenomas with HGD				| 3 years`nSerrated Lesions: `n    Sessile serrated polyps < 10mm w/o dysplasia		| 5 years`n    Sessile serrated polyps >= 10mm			| 3 years`n    Sessile serrated polyps w/dysplasia			| 3 years`n    Traditional serrated adenoma			| 3 years`nSerrated Polyposis Syndrome				| 1 year`nFMH of colon cancer or high risk adenomas		|  Every 5 years beginning 10 years younger than the age of the index relative

Gui, Add, Text, x5 y0, Polyp Number and Pathology                                                  Screening Interval 
Gui, Add, Radio, x6 y17 w300 h20 , No Polyps
Gui, Add, Radio, x6 y47 w300 h20 , Small (<10mm) hyperplastic polyps in rectum or sigmoid
Gui, Add, Radio, x6 y77 w300 h20 , 1 - 2 small (<10mm) tubular adenomas
Gui, Add, Radio, x6 y107 w300 h20 , 3 - 10 tubular adenomas
Gui, Add, Radio, x6 y137 w300 h20 , > 10 adenomas
Gui, Add, Radio, x6 y167 w300 h20 , 1 or more tubular adenomas >= 10mm
Gui, Add, Radio, x66 y227 w0 h10 , Radio
Gui, Add, Radio, x6 y227 w300 h20 , Adenomas with HGD
Gui, Add, Radio, x16 y287 w290 h20 , Sessile serrated polyps <10mm w/o dsyplasia
Gui, Add, Radio, x16 y317 w290 h20 , Sesslile serrated polyps >= 10mm
Gui, Add, Radio, x16 y347 w290 h20 , Sessile serrated polyps w/dysplasia
Gui, Add, Radio, x16 y377 w290 h20 , Traditional Serrated adenoma
Gui, Add, Radio, x6 y407 w300 h20 , Serrated Polyposis Syndrome
Gui, Add, Radio, x6 y437 w300 h30 , FMH of colon cancer or high risk adenomas`; beginning 10 years younger than the age of the index relative
Gui, Add, Text, x316 y17 w60 h20 , 10 years
Gui, Add, Text, x316 y47 w60 h20 , 10 years
Gui, Add, Text, x316 y77 w60 h20 , 7 - 10 years
Gui, Add, Text, x316 y107 w60 h20 , 3- 5 years
Gui, Add, Text, x316 y137 w60 h20 , < 3 years
Gui, Add, Text, x316 y167 w60 h20 , 3 years
Gui, Add, Radio, x6 y197 w300 h20 , 1 or more villous adenomas
Gui, Add, Text, x316 y197 w-120 h30 , 3 years
Gui, Add, Text, x316 y197 w60 h20 , 3 years
Gui, Add, Text, x316 y227 w60 h20 , 3 years
Gui, Add, Text, x6 y257 w370 h20 , Serrated Lesions:
Gui, Add, Text, x316 y287 w60 h20 , 5 years
Gui, Add, Text, x316 y317 w60 h20 , 3 years
Gui, Add, Text, x316 y347 w60 h20 , 3 years
Gui, Add, Text, x316 y377 w60 h20 , 3 years
Gui, Add, Text, x316 y407 w60 h20 , 1 year
Gui, Add, Text, x316 y437 w60 h30 , 5 years
; Generated using SmartGUI Creator for SciTE
Gui, Show, w391 h482, Asymptomaitc Patients Only 
return

GuiClose:
ExitApp
; Multi's weapon swap is able to be held down to continue swapping
; With railgun, most of the cooldown is at the end of the firing
; animation, so it can be skipped by swapping.
; 
; Pressing 't' continually holds down the 'r' button
; 'r' is the default key for multi's weapon swap,
; 
; post-1.0, it appears as though you reach maximum fire rate
; after obtaining one attack speed item
; TODO - investigate if delays could result in the same behavior
t::
KeyDown := !KeyDown
If KeyDown
	SendInput {r down}
Else
	SendInput {r up}
Return

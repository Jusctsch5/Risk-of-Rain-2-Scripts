; When going in and out of the Orbital Supply Beacon (OSB),
; Captain can refresh his m1 cooldown.
; This ONLY works if the M1 OSB has not yet been used.
; When using this script, make sure to not aim at the ground,
; so to not expend his OSB :)

t::
RepeatKey := !RepeatKey

If (RepeatKey)
	SetTimer, ExecuteM1Spam, 40
Else
	SetTimer, ExecuteM1Spam, Off
Return

ExecuteM1Spam()
{
	MouseClick, left
	Sleep, 200

	SendInput {w down}
	Sleep, 20
	SendInput {w  up}
	Sleep, 20
	SendInput {Control down}
	Sleep, 20
	SendInput {Control up}
}

Return

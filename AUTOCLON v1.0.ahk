#MaxThreadsBuffer On    ; makes overtap more useful with having buffers, however at high amounts it creates long buffers that are obvious.
#NoEnv
Process, Priority, , H  ; to make sure its using proper amount of resources
SetBatchLines -1        ; speed related commands for this and other two lines
SetKeyDelay, -1, -1, Play
SetWinDelay, -1

DllCall("Winmm\timeBeginPeriod", "UInt", TimePeriod) ; - calls the dll to use for shoter delay between inputs.

SleepDuration := 4 ; - delay between inputs
TimePeriod := 1 ; - setting for the type of speed it needs for delay between inputs.
Iterations := 0 ; - amount of times it inputs
Global CPS := 0
CPSActivate := 0

Gui EC: New, -Resize
Gui Font,, FixedSys
Gui Add, Text, vAutoclon x67 y0 w66 h20, AUTOCLON
Gui Font,, FixedSys
Gui Add, Button, x176 y25 w25 h25 gaddone, +1
Gui Add, Button, x-1 y25 w25 h25 gsubone, -1
Gui Add, Text, vOvertap x60 y28 w100 h19 +0x200, OVERTAP - %Iterations%

Gui Font, s8, FixedSys
Gui Add, Text, x20 y62 w152 h23 +0x200, EXTRARAKE
Gui Add, CheckBox, gToggleRakeCheck1 vToggleRakeCheck2 x3 y66 w15 h15
Gui Add, Text, x-344 y110 w561 h2 +0x10
Gui Add, Text, x1 y0 w497 h0, Text
Gui Font,, FixedSys
Gui Add, Text, vExtrarakeText x5 y85 w200 h11 +0x200, %CPSActivate% - NPS NEEDED THRESHOLD
Gui Add, Button, x170 y60 w25 h25 gEaddone, +1
Gui Add, Button, x100 y60 w25 h25 gEsubone, -1
Gui Add, Text, x0 y56 w229 h4 +0x10
Gui Add, Button, gHelp x147 y111 w52 h18, HELP
Gui Show, w200 h130, /// AC ///
Return

ToggleRakeCheck1:
Gui, Submit, NoHide
Return


~*Joy6::
if (ToggleRakeCheck2 == 1 And CPS > CPSActivate)
{
    SendInput, t
}
++CPS
Minus := Func("Minus").Bind()
SetTimer,% Minus, -500
Return

~*Joy9::
if (ToggleRakeCheck2 == 1 And CPS > CPSActivate)
{
    SendInput, t
}
++CPS
Minus := Func("Minus").Bind()
SetTimer,% Minus, -500
Return

Minus()
{
	--CPS
}


Eaddone:
    ++CPSActivate
    GuiControl,, ExtrarakeText, %CPSActivate% - NPS NEEDED THRESHOLD
    Return
Esubone:
    --CPSActivate
    GuiControl,, ExtrarakeText, %CPSActivate% - NPS NEEDED THRESHOLD
    Return
addone:
    ++Iterations
    GuiControl,, Overtap, OVERTAP - %Iterations%
    Return
subone:
    --Iterations
    GuiControl,, Overtap, OVERTAP - %Iterations%
    Return
Help:
    MsgBox,, Help, ASJKL are the binds the overtap uses, T is the key Extrarake uses. `nIf nothing works make sure to set your preferred usb game device as the controller you're using, then reopen as admin.
    Return
ECGuiEscape:
ECGuiClose:
    ExitApp

*Joy1::
    Loop, %Iterations%
        {
        DllCall("Sleep", "UInt", SleepDuration)
        SendInput, a
        }
    Return

*Joy2::
    Loop, %Iterations%
        {
        DllCall("Sleep", "UInt", SleepDuration)
        SendInput, s
        }
    Return

*Joy3::
    Loop, %Iterations%
        {
        DllCall("Sleep", "UInt", SleepDuration)
        SendInput, j
        }
    Return

*Joy4::
    Loop, %Iterations%
        {
        DllCall("Sleep", "UInt", SleepDuration)
        SendInput, k
        }
    Return
    
*Joy5::
    Loop, %Iterations%
        {
        DllCall("Sleep", "UInt", SleepDuration)
        SendInput, l
        }
    Return


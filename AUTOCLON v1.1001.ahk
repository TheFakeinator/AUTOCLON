#MaxThreadsBuffer On    ; makes overtap more useful with having buffers, however at high amounts it creates long buffers that are obvious.
#NoEnv
Process, Priority, , H  ; to make sure its using proper amount of resources
SetBatchLines -1        ; speed related commands for this and other three lines
SetKeyDelay, -1, -1, Play
SetWinDelay, -1
#HotkeyInterval 20

DllCall("Winmm\timeBeginPeriod", "UInt", TimePeriod) ; - calls the dll to use for shoter delay between inputs.

SleepDuration := 4 ; - delay between inputs
TimePeriod := 1 ; - setting for the type of speed it needs for delay between inputs.
Iterations := 0 ; - amount of times it inputs
Global CPS := 0
CPSActivate := 0
ShitFuck := 0

Gui EC: New, -Resize
Gui Font, s9, Consolas
Gui Color, 0xE4E4E4
Gui Add, Text, vAutoclon x67 y0 w66 h20, AUTOCLON
Gui Add, Button, gaddone x176 y25 w25 h25, +1
Gui Add, Button, gsubone x-1 y25 w25 h25, -1
Gui Font, s8, Consolas
Gui Add, CheckBox, vLegitOvertapCheck2 gLegitOvertap x26 y28 w48 h20, LEGIT
Gui Font, s9, Consolas
Gui Add, Text, vOvertap x80 y28.5 w85 h19 +0x200, OVERTAP - %Iterations%
Gui Add, Text, x20 y62 w152 h23 +0x200 , EXTRARAKE
Gui Add, CheckBox, vToggleRakeCheck2 gToggleRakeCheck1 x3 y66 w15 h15
Gui Add, Text, x-344 y110 w559 h2 +0x10 
Gui Add, Text, x1 y0 w497 h0, Text
Gui Add, Text, vExtrarakeText x5 y88 w200 h11 +0x200 , %CPSActivate% - NPS NEEDED THRESHOLD
Gui Add, Button, gEaddone x170 y60 w25 h25, +1
Gui Add, Button, gEsubone x100 y60 w25 h25, -1
Gui Add, Text, x0 y56 w227 h2 +0x10 
Gui Add, Button, gHelp x147 y111 w52 h18, HELP
Gui, Submit, NoHide
Gui Font
Gui Font

Gui Show, w200 h130, /AC/
Return

LegitOvertap:
Gui, Submit, NoHide
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
SetTimer,% Minus, -1000
Return

~*Joy9::
if (ToggleRakeCheck2 == 1 And CPS > CPSActivate)
{
    SendInput, t
}
++CPS
Minus := Func("Minus").Bind()
SetTimer,% Minus, -1000
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
rnd := rand(1, 5)
    if(LegitOvertapCheck2 == 1 AND rnd == 1)
        {
            Loop, %Iterations%
            {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, a
            }
        }
    if(LegitOvertapCheck2 == 0)
        {
            Loop, %Iterations%
            {
                DllCall("Sleep", "UInt", SleepDuration)
                SendInput, a
            }
        Return
        }
    Return
*Joy2::
rnd := rand(1, 5)
    if(LegitOvertapCheck2 == 1 AND rnd == 1)
        {
            Loop, %Iterations%
            {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, s
            }
        }
    if(LegitOvertapCheck2 == 0)
        {
            {
                Loop, %Iterations%
                {
                DllCall("Sleep", "UInt", SleepDuration)
                SendInput, s
                }
            }
        Return
        }
    Return
*Joy3::
rnd := rand(1, 5)
    if(LegitOvertapCheck2 == 1 AND rnd == 1)
        {
            Loop, %Iterations%
            {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, j
            }
        }
    if(LegitOvertapCheck2 == 0)
        {
            Loop, %Iterations%
            {
                DllCall("Sleep", "UInt", SleepDuration)
                SendInput, j
            }
        Return
        }
    Return
*Joy4::
rnd := rand(1, 5)
    if(LegitOvertapCheck2 == 1 AND rnd == 1)
        {
            Loop, %Iterations%
            {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, k
            }
        }
    if(LegitOvertapCheck2 == 0)
        {
            Loop, %Iterations%
            {
                DllCall("Sleep", "UInt", SleepDuration)
                SendInput, k
            }
        Return
        }
    Return
*Joy5::
rnd := rand(1, 6)
    if(LegitOvertapCheck2 == 1 AND rnd == 1)
        {
            Loop, %Iterations%
            {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, l
            }
        }
    if(LegitOvertapCheck2 == 0)
        {
            Loop, %Iterations%
            {
                DllCall("Sleep", "UInt", SleepDuration)
                SendInput, l
            }
        Return
        }
    Return

rand(min, max) {
    Random, i, %min%, %max%
    return i
}

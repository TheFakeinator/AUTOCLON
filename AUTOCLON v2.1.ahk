; - autoclon v2.1 (gui redesign and more helpers added)
; - by djcybercum228

; - shout out to drow to figuring it out

; - optimize section
#MaxThreads 20
#HotkeyInterval 20
#MaxThreadsBuffer On
#NoEnv
SetKeyDelay, -1, -1
SetWinDelay, -1
SetBatchLines -1
Process, Priority, , H

; - Key list for rebinding inputs.
keys := "1Joy1,1Joy2,1Joy3,1Joy4,1Joy5,1Joy6,1Joy7,1Joy8,1Joy9,1Joy10,1Joy11,1Joy12,1Joy13,2Joy1,2Joy2,2Joy3,2Joy4,2Joy5,2Joy6,2Joy7,2Joy8,2Joy9,2Joy10, 2Joy11, 2Joy12, 2Joy13,3Joy1,3Joy2,3Joy3,3Joy4,3Joy5,3Joy6,3Joy7,3Joy8,3Joy9,3Joy10,3Joy11,3Joy12,3Joy13,4Joy1,4Joy2,4Joy3,4Joy4,4Joy5,4Joy6,4Joy7,4Joy8,4Joy9,4Joy10,"

GetKeyPress(keyStr) {
	keys := StrSplit(keyStr, ",")
	loop
		for each, key in keys
			if GetKeyState(key)
				return key
}

; - input method
DllCall("Winmm\timeBeginPeriod", "UInt", TimePeriod)
SleepDuration := 4
TimePeriod := 1
LegitOvertapChance := 6
Iterations := 0
Global CPS := 0
CPSActivate := 0

; - gui section (long)


Gui Color, 0xFFE1D6
Gui Add, Text, x14 y208 w267 h1 +0x10
Gui Add, Text, x1 y104 w300 h2 +0x10

Gui Font, s7, Segoe UI
Gui Add, Text, x110 y213 w100 h15 +0x200, DJCYBERCUM228
Gui Add, Text, x20 y212 w72 h15 +0x200, AUTOCLON (v2.1)

Gui Font, s11, Consolas
Gui Add, Text, x159 y9 w87 h13 +0x200, LEGIT CHECK
Gui Add, Text, vIterationCheck x44 y32 w16 h10 +0x200, %Iterations%
Gui Add, Text, vLegitCheck x155 y32 w96 h10 +0x200, 1 / %LegitOvertapChance% CHANCE
Gui Add, Text, vExtraRakeCheck x88 y141 w18 h14 +0x200, %CPSActivate%
Gui Add, Text, x111 y140 w105 h15 +0x200, NPS THRESHOLD
Gui Add, Text, x20 y9 w56 h14 +0x200, OVERTAP

Gui Font, s9, Segoe UI
Gui Add, CheckBox, vOutputLegitActivate gLegitActivate x23 y55 w45 h12, LEGIT
Gui Add, Button, gRebinder x199 y211 w80 h17, REBIND
Gui Add, CheckBox, vExtraRakeActivate gExtraRakeActivate x106 y117 w78 h12, EXTRARAKE

Gui Font,, FixedSys
Gui Add, Button, gOvertapHelp x80 y9 w12 h12, ?
Gui Add, Button, gLegitHelp x76 y55 w12 h12, ?
Gui Add, Button, gOvertapAddOne x64 y27 w22 h22, +1
Gui Add, Button, gOvertapSubOne x11 y27 w22 h22, -1
Gui Add, Button, gLegitOvertapAddOne x256 y27 w22 h22, +1
Gui Add, Button, gLegitOvertapSubOne x131 y27 w22 h22, -1
Gui Add, Button, gExtraRakeSubOne x58 y137 w22 h22, -1
Gui Add, Button, gExtraRakeAddOne x223 y137 w22 h22, +1


Gui Font, s8, Segoe UI
Gui Font, Italic, Calibri
Gui Add, Text, x34 y163 w239 h13 +0x200, Every strum input you do over the desired threshold
Gui Add, Text, x78 y178 w141 h13 +0x200, will add an extra strum input.
Gui Add, Text, x153 y57 w97 h13 +0x200, Changes the chance
Gui Add, Text, x136 y72 w137 h13 +0x200, legit overtap would activate.
Gui Font
Gui, Submit, NoHide
Gui Show, w300 h230, AUTOCLON
Return

!i::
    ++SleepDuration
    MsgBox, %SleepDuration%ms delay.
    Return
!o::
    --SleepDuration
    MsgBox, %SleepDuration%ms delay.
    Return

LegitActivate:
    Gui, Submit, NoHide
    Return
ExtraRakeActivate:
    Gui, Submit, NoHide
    Return
ExtraRakeAddOne:
    ++CPSActivate
    GuiControl,, ExtraRakeCheck, %CPSActivate%
    Return
ExtraRakeSubOne:
    --CPSActivate
    GuiControl,, ExtraRakeCheck, %CPSActivate%
    Return
LegitHelp:
    MsgBox, Makes ahk-generated overtap randomized. Change the chance of which it activates to the right of the overtap controls.
    Return

OvertapHelp:
    MsgBox, Overtaps, what else do you need to know. Press alt + i to increase the amount of time inbetween inputs. alt + o to decrease.
    Return
Rebinder:
    MsgBox, Press the named fret after each message box.
    Sleep, 200
    MsgBox, Press your green fret.
    Input := GetKeyPress(Keys)
    MsgBox, You pressed %Input%
    Hotkey, %Input%, green, On

    MsgBox, Press your red fret
    Input := GetKeyPress(Keys)
    MsgBox, You pressed %Input%
    Hotkey, %Input%, red, On

    MsgBox, Press your yellow fret.
    Input := GetKeyPress(Keys)
    MsgBox, You pressed %Input%
    Hotkey, %Input%, yellow, On

    MsgBox, Press your blue fret.
    Input := GetKeyPress(Keys)
    MsgBox, You pressed %Input%
    Hotkey, %Input%, blue, On

    MsgBox, Press your orange fret.
    Input := GetKeyPress(Keys)
    MsgBox, You pressed %Input%
    Hotkey, %Input%, orange, On

    Msgbox, Strum up.
    Input := GetKeyPress(Keys)
    MsgBox, You pressed %Input%
    Hotkey, %Input%, strumup, On
    
    Msgbox, Strum down.
    Input := GetKeyPress(Keys)
    MsgBox, You pressed %Input%
    Hotkey, %Input%, strumdown, On
    return
OvertapAddOne:
    ++Iterations
    GuiControl,, IterationCheck, %Iterations%
    Return
OvertapSubOne:
    --Iterations
    GuiControl,, IterationCheck, %Iterations%
    Return

LegitOvertapAddOne:
    ++LegitOvertapChance
    GuiControl,, LegitCheck, 1 / %LegitOvertapChance% CHANCE
    Return
LegitOvertapSubOne:
    --LegitOvertapChance
    GuiControl,, LegitCheck, 1 / %LegitOvertapChance% CHANCE
    Return
GuiEscape:
GuiClose:
    ExitApp

green:
    rnd := rand(1, LegitOvertapChance)
    if(OutputLegitActivate== 1)
    {
    if(rnd == 1)
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, a
        }
    Return
    }
    }
    else
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, a
        }
    }
    Return
red:
    rnd := rand(1, LegitOvertapChance)
    if(OutputLegitActivate == 1)
    {
    if(rnd == 1)
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, s
        }
    Return
    }
    }
    else
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, s
        }
    }
    Return
yellow:
    rnd := rand(1, LegitOvertapChance)
    if(OutputLegitActivate == 1)
    {
    if(rnd == 1)
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, j
        }
    Return
    }
    }

    else
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, j
        }
    }
    Return
blue:
    rnd := rand(1, LegitOvertapChance)
    if(OutputLegitActivate == 1)
    {
    if(rnd == 1)
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, k
        }
    Return
    }
    }
    else
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, k
        }
    }
    Return
orange:
    rnd := rand(1, LegitOvertapChance)
    if(OutputLegitActivate == 1)
    {
    if(rnd == 1)
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, l
        }
    Return
    }
    }
    else
    {
    Loop, %Iterations%
        {
            DllCall("Sleep", "UInt", SleepDuration)
            SendInput, l
        }
    }
    Return





; - extrarake

strumup:
if(ExtraRakeActivate == 1)
{
if (CPS > CPSActivate)
{
    SendInput, z
}
++CPS
Minus := Func("Minus").Bind()
SetTimer,% Minus, -1000
Return
}


strumdown:
if(ExtraRakeActivate == 1)
{
if (CPS > CPSActivate)
{
    SendInput, x
}
++CPS
Minus := Func("Minus").Bind()
SetTimer,% Minus, -1000
Return
}



Minus()
{
	--CPS
}

rand(min, LegitOvertapChance) {
    Random, i, %min%, %LegitOvertapChance%
    return i
}

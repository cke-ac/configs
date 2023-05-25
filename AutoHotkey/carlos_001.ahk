
#NoEnv
#SingleInstance Force
#NoTrayIcon

#Include desktop_nav.ahk
#Include indicator.ahk

; Global variables
Global layer1 := false

UpdateIndicator(layer1)

; Toggle layer1 state with RShift key
RAlt::
    WinGetActiveTitle, PreviousActiveWindow
    layer1 := !layer1
    UpdateIndicator(layer1)
	WinActivate, %PreviousActiveWindow%
return


GetMonitorCount() {
    SysGet, MonitorCount, MonitorCount
    return MonitorCount
}

#If layer1
    ; Arrow keys
    i::SendInput, {Up}
    j::SendInput, {Left}
    k::SendInput, {Down}
    l::SendInput, {Right}

	; Larger Movement
    e::SendInput, ^{Up}
    d::SendInput, ^{Down}
    s::SendInput,  ^{Left}
    f::SendInput, ^{Right}
	
    ; PageUp, PageDown, Home, End
    ^i::SendInput, {PgUp}
    ^k::SendInput, {PgDn}
    ^j::SendInput, {Home}
    ^l::SendInput, {End}

	; Text Selection
    +i::SendInput, +{Up}
    +j::SendInput, +{Left}
    +k::SendInput, +{Down}
    +l::SendInput, +{Right}

    ; Larger Text Selection
    +e::SendInput, ^+{Up}
    +d::SendInput, ^+{Down}
    +s::SendInput, ^+{Left}
    +f::SendInput, ^+{Right}
	
	
	; Text Manipulation
	u::SendInput, ^{z}
	/::
		layer1 := !layer1
		UpdateIndicator(layer1)
		SendInput, ^{f}
	return
	
	; Open Windows Terminal with Ctrl+Alt+T
	t::
		; If no instance is found, run Windows Terminal with the default profile
		Run, wt.exe -d "D:\Projects"
	return
	
	; Alt Tab
	Tab::SendInput, ^!{Tab}
	
	; Close the application
	x::SendInput, !{F4}
#If

; remap a few keys which I really use a lot
CapsLock::Backspace

; Exit all auto-hot-key scripts when Ctrl+Alt+X is pressed
^!x::
    Loop, % GetMonitorCount() {
        Gui, %A_Index%:Destroy
    }
    ExitApp
    return

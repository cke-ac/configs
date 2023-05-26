
; this code creates a floating indicator to show in which layer I am working

; Floating Indicator
UpdateIndicator(p) {
    if (p) {
		; the current desktop string
		desktopNumber := GetCurrentDesktopNumber()
		desktopName := GetDesktopName(desktopNumber)
		prefixedDesktopName := "(" . desktopNumber + 1 . ") " . desktopName
		
		; generate the list of all monitors
		secondString := ""
		desktopCount := GetDesktopCount()
		Loop, %desktopCount% {		
		    desktopIndex := A_Index - 1
			secondString = % secondString . "(" . (desktopIndex + 1) . ")" . " " . GetDesktopName(desktopIndex) . " - "
		}
	
        Monitors := GetMonitorCount()
        Loop, %Monitors% {
            MonitorNumber := A_Index
            SysGet, Monitor, Monitor, %MonitorNumber%
            Gui, %MonitorNumber%:New
            Gui, %MonitorNumber%:-Caption +AlwaysOnTop +ToolWindow +Owner +E0x20
            Gui, %MonitorNumber%:Color, Green
			Gui, %MonitorNumber%:Font, s12 bold, Arial
			Gui, %MonitorNumber%:Add, Text, x10 y5 w%A_ScreenWidth% h20 Left, % prefixedDesktopName
            Gui, %MonitorNumber%:Show, x%MonitorLeft% y%MonitorTop% w%A_ScreenWidth% h50, Layer1Indicator%MonitorNumber%
			Gui, %MonitorNumber%:Font, s8 normal, Arial
			Gui, %MonitorNumber%:Add, Text, x10 y30 w%A_ScreenWidth% h50 Left, % secondString
        }
		
		
		
    } else {
        Loop, % GetMonitorCount() {
            Gui, %A_Index%:Destroy
        }
    }
}

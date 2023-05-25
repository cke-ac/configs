
; this code creates a floating indicator to show in which layer I am working

; Floating Indicator
UpdateIndicator(p) {
    if (p) {
        Monitors := GetMonitorCount()
        Loop, %Monitors% {
            MonitorNumber := A_Index
            SysGet, Monitor, Monitor, %MonitorNumber%
            Gui, %MonitorNumber%:New
            Gui, %MonitorNumber%:-Caption +AlwaysOnTop +ToolWindow +Owner +E0x20
            Gui, %MonitorNumber%:Color, Green
			Gui, %MonitorNumber%:Font, s12 bold, Arial
			Gui, %MonitorNumber%:Add, Text, x10 y5 w%A_ScreenWidth% h20 Left, % GetDesktopName(GetCurrentDesktopNumber())
            Gui, %MonitorNumber%:Show, x%MonitorLeft% y%MonitorTop% w%A_ScreenWidth% h30, Layer1Indicator%MonitorNumber%
        }
    } else {
        Loop, % GetMonitorCount() {
            Gui, %A_Index%:Destroy
        }
    }
}

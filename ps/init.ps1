echo "Welcome to Carlos's PowerShell setup"

# terminal configurations

oh-my-posh init pwsh | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/honukai.omp.json" | Invoke-Expression

function Set-TabHeader {
    param(
        [string]$Header
    )
    $Host.UI.RawUI.WindowTitle = $Header 
}

# Navigation functions

function Projects {
    Set-Location -Path "D:\Projects" -ErrorAction Stop
}
function Local {
  Set-Location -Path "$HOME\AppData\Local" -ErrorAction Stop
}
function Ts {
    Set-Location -Path "D:\Projects\Training\game_server" -ErrorAction Stop
    Set-TabHeader -Header "game_server"
    Invoke-Expression "nvim"
}
function Tb {
    Set-Location -Path "D:\Projects\Training\bot_server" -ErrorAction Stop
    Set-TabHeader -Header "bot_server"
    Invoke-Expression "nvim"
}
function Tu {
    Set-Location -Path "D:\Projects\Training\GameArchitecture" -ErrorAction Stop
    Set-TabHeader -Header "Unity"
    Invoke-Expression "nvim"
}
function Tc {
    $te = "wt.exe"  # Replace with the path to your Windows Terminal executable if necessary

    $g = "D:\Projects\Training\game_server"
    $b = "D:\Projects\Training\bot_server"

    # Start the first terminal with the game server path
    Start-Process -FilePath $te -ArgumentList "-w 0 -p `"Windows PowerShell`" -d `"$g`"; split-pane --vertical -p `"Windows PowerShell`" -d `"$b`" "
}
function T {
    $t = "wt.exe"  # Replace with the path to your Windows Terminal executable if necessary

    $g = "D:\Projects\Training\game_server"
    $b = "D:\Projects\Training\bot_server"

    Start-Process -FilePath $t -ArgumentList "-w 0 -p `"Windows PowerShell`" powershell -noExit `"Tb`" "
    Invoke-Expression "Tc"
    Invoke-Expression "Ts"
}

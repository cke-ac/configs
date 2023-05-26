echo "Welcome to Carlos's PowerShell setup"

# terminal configurations

oh-my-posh init pwsh | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/honukai.omp.json" | Invoke-Expression

# Navigation functions

function Projects {
    Set-Location -Path "D:\Projects" -ErrorAction Stop
}
function Local {
  Set-Location -Path "$HOME\AppData\Local" -ErrorAction Stop
}
function Ts {
    Set-Location -Path "D:\Projects\Training\game_server" -ErrorAction Stop
    Invoke-Expression "neovide"
}

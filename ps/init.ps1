echo "Welcome to Carlo's PowerShell setup"

# Navigation functions

function Projects {
    Set-Location -Path "D:\Projects" -ErrorAction Stop
}
function Local {
  Set-Location -Path "$HOME\AppData\Local" -ErrorAction Stop
}

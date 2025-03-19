# setup path
$env:PATH="$env:PATH;C:\tools\neovim\nvim-win64\bin\;C:\tools\git\bin\"
$PSStyle.FileInfo.Directory=$PSStyle.Foreground.Blue

set-psreadlineoption -editmode emacs

# alias
new-alias "e" -Value "nvim.exe"
new-alias "s" -Value "Get-ChildItem"
new-alias "unzip" -Value "Expand-Archive"


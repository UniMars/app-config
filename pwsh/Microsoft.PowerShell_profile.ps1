#oh-my-posh --init --shell pwsh --config "C:\Users\Lenovo\AppData\Local\Programs\oh-my-posh\themes\powerlevel10k_classic.omp.json" | Invoke-Expression
oh-my-posh --init --shell pwsh --config "C:\Users\Lenovo\AppData\Local\Programs\oh-my-posh\themes\iterm3.omp.json" | Invoke-Expression
function Set-EnvVar {
    $env:POSH=$(Get-Date).ToString('H:mm:ss')
}

Import-Module posh-git

New-Alias -Name 'Set-PoshContext' -Value 'Set-EnvVar' -Scope Global -Force
Set-PSReadLineOption -PredictionSource HistoryAndPlugin # 设置预测文本来源为历史记录
Set-PsReadLineOption -PredictionViewStyle InlineView
Set-PsReadLineOption -BellStyle Visual
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete # 设置 Tab 键补全
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function Complete # 设置 Ctrl+d 为菜单补全和 Intellisense
#Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function SearchChar # 设置 Ctrl+f 为搜索
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function RevertLine # 设置 Ctrl+d 为
New-Alias -Name "sublime" -Value "C:/Program Files/Sublime Text/sublime_text.exe"
New-Alias -Name 'vim' -Value '~/AppData/Local/Programs/Neovim/bin/nvim.exe'
New-Alias -Name 'nvim' -Value '~/AppData/Local/Programs/Neovim/bin/nvim.exe'
$VIMRC="$HOME/_vimrc"
$NVIMCONFIG="$HOME/AppData/Local/nvim/init.vim"

Function gptcli(){
    python "D:/Programs/Code/python/projects/gptcli/gptcli.py"
}

Function vvim(){
   & 'C:\Program Files\Vim\vim90\vim.exe' @args
}

Function proxy-on(){
    $env:http_proxy="http://127.0.0.1:7890"
    $env:https_proxy="https://127.0.0.1:7890"
    echo 代理成功
}
Function git-proxy-on(){
    git config --global http.proxy http://127.0.0.1:7890
    git config --global https.proxy https://127.0.0.1:7890
}

Function git-proxy-off(){
    git config --global --unset http.proxy
    git config --global --unset https.proxy

}


Function lvim(){
$ErrorActionPreference = "Stop" # exit when command fails

$env:XDG_DATA_HOME = $env:XDG_DATA_HOME ?? $env:APPDATA
$env:XDG_CONFIG_HOME = $env:XDG_CONFIG_HOME ?? $env:LOCALAPPDATA
$env:XDG_CACHE_HOME = $env:XDG_CACHE_HOME ?? $env:TEMP

$env:LUNARVIM_RUNTIME_DIR = $env:LUNARVIM_RUNTIME_DIR ?? "$env:XDG_DATA_HOME\lunarvim"
$env:LUNARVIM_CONFIG_DIR = $env:LUNARVIM_CONFIG_DIR ?? "$env:XDG_CONFIG_HOME\lvim"
$env:LUNARVIM_CACHE_DIR = $env:LUNARVIM_CACHE_DIR ?? "$env:XDG_CACHE_HOME\lvim"
$env:LUNARVIM_BASE_DIR = $env:LUNARVIM_BASE_DIR ?? "$env:LUNARVIM_RUNTIME_DIR\lvim"

nvim -u "$env:LUNARVIM_BASE_DIR\init.lua" @args
}

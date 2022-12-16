# $Ule4JisPath = "C:\Users\ykenta\ossapps\ULE4JIS\publish\Ule4Jis.exe"
# $altimeahkPath = "C:\Users\ykenta\ossapps\alt-ime-ahk\alt-ime-ahk.exe"
Set-Location -LiteralPath $PSScriptRoot

. ".\env.ps1"

$Ule4JisProcess = Get-Process | Where-Object { $_.ProcessName -like "Ule4Jis" }

if ($Ule4JisProcess.Count -eq 0) {
    Write-Output "Ule4Jisとalt-ime-ahkを起動します..."
    Start-Process -FilePath $Ule4JisPath
    Start-Process -FilePath $altimeahkPath
} else {
    Write-Output "Ule4Jisとalt-ime-ahkを終了します..."
    Stop-Process -Name "Ule4Jis"
    Stop-Process -Name "alt-ime-ahk"
}

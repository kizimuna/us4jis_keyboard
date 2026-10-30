# Ule4Jis（と alt-ime-ahk）の起動・停止を切り替える
#   引数なし : 起動中なら停止、停止中なら起動
#   -Restart : 起動中なら停止してから起動し直す
param([switch]$Restart)

$ErrorActionPreference = 'Stop'

# エラー時はウィンドウがすぐ閉じないように止める
trap {
    Write-Host "エラー: $_" -ForegroundColor Red
    Read-Host "Enterキーで閉じます"
    exit 1
}

$envFile = Join-Path $PSScriptRoot 'env.ps1'
if (-not (Test-Path -LiteralPath $envFile)) { throw "env.ps1 が見つかりません: $envFile" }
. $envFile

# 対象アプリの一覧（alt-ime-ahk は env.ps1 の $UseAltImeAhk で切り替え）
$apps = @(@{ Name = 'Ule4Jis'; Path = $Ule4JisPath })
if ($UseAltImeAhk) { $apps += @{ Name = 'alt-ime-ahk'; Path = $altimeahkPath } }
$appNames = $apps.Name -join ', '

$running = Get-Process -Name 'Ule4Jis' -ErrorAction SilentlyContinue

if ($running) {
    Write-Output "停止します: $appNames"
    foreach ($app in $apps) {
        $procs = Get-Process -Name $app.Name -ErrorAction SilentlyContinue
        if ($procs) {
            $procs | Stop-Process
            # 再起動時に終了前のプロセスと重ならないよう、終了を待つ
            $procs | Wait-Process -Timeout 5 -ErrorAction SilentlyContinue
        }
    }
}

if (-not $running -or $Restart) {
    Write-Output "起動します: $appNames"
    foreach ($app in $apps) {
        if (-not (Test-Path -LiteralPath $app.Path)) { throw "実行ファイルが見つかりません: $($app.Path)" }
        Start-Process -FilePath $app.Path
    }
}

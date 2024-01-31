# us4jis_keyboard

日本語環境のWindowsでUS配列のキーボードを（個人的に）快適に使うためのスクリプトです。  
US配列のキーボードをOSの設定を変更せず、そのまま使うために[Ule4Jis](https://github.com/dezz/ULE4JIS) 、IMEのON/OFFを左右のAltキーで行うために[alt-ime-ahk](https://github.com/karakaram/alt-ime-ahk)を使っています。

## 動作環境

本スクリプトは下記環境、ツールで動作確認しています。

- Windows10
- PowerToys Run
  - <https://learn.microsoft.com/ja-jp/windows/powertoys/run>
- Powershell7
  - <https://learn.microsoft.com/ja-jp/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3>
- Ule4Jis
  - <https://github.com/dezz/ULE4JIS>
    - (起動時のダイアログ非表示版を kimi-soft さんが fork してます)
    - <https://github.com/kimi-soft/forked-ule4jis>
- alt-ime-ahk
  - <https://github.com/karakaram/alt-ime-ahk>

## Usage

1. us4jis.ps1を配置するフォルダに下記ファイルを用意

    - env.ps1
        - PSスクリプト内で呼び出す ule4jis.exe と alt-ime-ahk.exe の絶対パスを設定するdotenvもどき。

        例

        ``` powershell
        $Ule4JisPath = "C:\ULE4JIS\publish\Ule4Jis.exe"
        $altimeahkPath = "C:\alt-ime-ahk\alt-ime-ahk.exe"
        ```

    - us4jis.lnk
        - PSスクリプトを実行するためのショートカット

        例

        ``` powershell
        C:\Program Files\PowerShell\7\pwsh.exe -ExecutionPolicy RemoteSigned -File "C:\scripts\us4jis.ps1"
        ```

2. PowerToys RUNからus4jis.lnkを実行

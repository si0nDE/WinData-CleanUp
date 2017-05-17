    ###    Simon Fieber IT-Services    ###
    ###     Coded by: Simon Fieber     ###
    ###     Visit:  simonfieber.it     ###

cls

### Einstellungen ###

    # Welcher Ordner soll überwacht werden?
    $folder    = ""

    # Wie soll der temporäre Papierkorb heißen?
    $junkname  = ""

    # Wie alt dürfen die Daten im oben angegebenen Ordner werden, bevor sie verschoben werden?
    $moveage   = ""

    # Wie alt dürfen die Daten im temporären Papierkorb werden, bevor sie endgültig gelöscht werden?
    $deleteage = ""
    # Möchten Sie einen Report nach jedem verschieben?
    # 0 = aus; 1 = ein
    $movereport = 0

    # Möchten Sie einen Report nach jedem löschvorgang?
    # 0 = aus; 1 = ein
    $deletereport = 0

### Startbildschirm ###
function Startbildschirm {
        Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "║ Windows Data Clean Up                                                         ║"
        Write-Host "║                                                                        v0.1.1 ║"
        Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
}

function Get-Report{
    if($movereport -eq "1"){
        Startbildschirm
        Write-Host ""
        Start-Transcript "$reportname" | Out-Null
        Write-Host ""
        Write-Host ""
        Write-Host "  ${notice}: $movereportmessage1"
        Write-Host ""
    }
    else{
        Startbildschirm
        Write-Host ""
        Write-Host "  ${notice}: $movereportmessage2"
        Write-Host ""
    }
}

### Temporärer Papierkorb anlegen ###
function Create-Junkfolder{
    $Test_Junkfolder = Test-Path -PathType Container -Path "$folder\$junkname"
    if(Test-Junkfolder -eq "False"){
        Write-Host "o $junkexists" 
    }
    else{
        New-Item -ItemType Directory -Force -Path "$folder\$junkname" | Out-Null
        Write-Host "+ $junkcreated"
    }
}


### Spracheinstellungen ###
### Language settings ###

$junkexists  = "Temporärer Papierkorb bereits angelegt."
$junkcreated = "Temporärer Papierkorb angelegt."
$notice        = "Hinweis"
$reportname    = "$folder to $junkname $(Get-Date -Format yy.MM.dd-HHmmss).txt"
$movereportmessage1 = "Die Aufzeichnung über verschobene Elemente wird durchgeführt."
$movereportmessage2 = "Es wird keine Aufzeichnung über verschobene Elemente durchgeführt."
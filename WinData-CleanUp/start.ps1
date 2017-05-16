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

### Startbildschirm ###
function Startbildschirm {
        Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "║ Windows Data Clean Up                                                         ║"
        Write-Host "║                                                                        v0.1.0 ║"
        Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
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

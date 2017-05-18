    ###    Simon Fieber IT-Services    ###
    ###     Coded by: Simon Fieber     ###
    ###     Visit:  simonfieber.it     ###

cls

### Einstellungen | Settings ###

    # Welcher Ordner soll überwacht werden?
    # Which folder should be monitored?
    $folder    = ""

    # Wie soll der temporäre Papierkorb heißen?
    # What is the name of the temporary junk folder?
    $junkname  = "Papierkorb" # "Junk"

    # Wie alt dürfen die Daten im oben angegebenen Ordner werden, bevor sie verschoben werden?
    # Beispiel: 90 = 90 Tage
    #
    # How old may the files in the folder be before they are moved?
    # Example: 90 = 90 days
    $moveage   = "90"

    # Wie alt dürfen die Daten im temporären Papierkorb werden, bevor sie endgültig gelöscht werden?
    # Beispiel: 120 = 120 Tage
    #
    # How old may the files in the temporary junk folder be before they are finally deleted?
    # Example: 120 = 120 days
    $deleteage = "180"

    # Möchten Sie einen Report erstellen?
    # Do you want to create a report?
    #
    # 0 = aus/off; 1 = ein/on
    $report = 0

    # In welcher Sprache soll das Programm ausgeführt werden?
    # 
    #
    # de = Deutsch/German; en = Englisch/English
    $language = "de"

### Spracheinstellungen | Language settings ###

$notice          = "Hinweis" # "Notice"
$junkexists      = "Temporärer $junkname bereits angelegt." # "Temporary $junkname folder already created."
$junkcreated     = "Temporärer $junkname angelegt." # "Temporary $junkname folder created."
$reportname      = "$folder to $junkname $(Get-Date -Format yy.MM.dd-HHmmss).txt"
$movingfiles     = "$moveage Tage alte Dateien werden verschoben..." # ""
$reportmessage1  = "Es wird eine Aufzeichnung aller nachfolgenden Vorgänge durchgeführt." # ""
$reportmessage2  = "Es wird keine Aufzeichnung über die nachfolgenden Vorgänge durchgeführt." # ""
$movecompleted   = "Dateien wurden in den $junkname verschoben." # ""




##################################################  ##################################################
##################################################  ##################################################
##################################################  ##################################################
##### Ab hier, keine Änderungen durchführen! #####  ############ Do not make any changes! ############
##################################################  ##################################################
##################################################  ##################################################
##################################################  ##################################################




### Startbildschirm | Start screen ###
function Startbildschirm {
        Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "║ Windows Data Clean Up                                                         ║"
        Write-Host "║                                                                        v0.2.0 ║"
        Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
}

### Report erstellen | Create report ###
function Get-Report{
    if($report -eq "1"){
        Startbildschirm
        Start-Transcript "$reportname" | Out-Null
        Write-Host ""
        Write-Host " ${notice}: $reportmessage1"
    }
    else{
        Startbildschirm
        Write-Host ""
        Write-Host " ${notice}: $reportmessage2"
    }
}

### Report beenden | Stop report ###
function Stop-Report{
    if($report -eq "1"){
        Stop-Transcript | Out-Null
    }
}

### Temporärer Papierkorb anlegen | Create temporary junk folder ###
function Create-Junkfolder{
    $Test_Junkfolder = Test-Path -PathType Container -Path "$folder\$junkname"
    if($Test_Junkfolder -eq "False"){
        Write-Host " o $junkexists" 
    }
    else{
        New-Item -ItemType Directory -Force -Path "$folder\$junkname" | Out-Null
        Write-Host " √ $junkcreated"
    }
}

### Daten in Papierkorb verschieben | Move files to junk ###
function Move-Data{
    $movedate = (Get-Date).AddDays(-$moveage)
    if($report -eq "1"){
        Write-Host " o $movingfiles"
        Write-Host ""
        Start-Sleep -Milliseconds  5000
        Get-ChildItem "$folder" -Recurse | where {$_.LastWriteTime -lt $movedate -and -not $_.psiscontainer} |% { Move-Item $_.FullName -Destination $folder\$junkname\ -Force -Verbose}
        Write-Host ""
        Start-Sleep -Milliseconds  2500
        Write-Host " √ $movecompleted"
    }
    else{
        Write-Host " o $movingfiles"
        Start-Sleep -Milliseconds  5000
        Get-ChildItem "$folder" -Recurse | where {$_.LastWriteTime -lt $movedate -and -not $_.psiscontainer} |% { Move-Item $_.FullName -Destination $folder\$junkname\ -Force}
        Start-Sleep -Milliseconds  2500
        Write-Host " √ $movecompleted"
    }
}


Windows Data Clean Up
==========================

Dieses PowerShell-Script ist für alle System- und Serveradministratoren, deren Nutzer oftmals Dateien "nur kurz" in einen Ordner werfen und im Anschluss vergessen. Dies verursacht ein riesen Datenaufkommen und oftmals werden diese Daten kein 2. Mal benötigt.

Dieses Script soll helfen und schafft Ordnung in 2 Schritten:

Zuerst wird eine Datei nach einer beliebigen Zeit in einen temporären Papierkorb verschoben. Wird die Datei doch noch benötigt, kann sie jederzeit aus diesem rausgeholt werden.

Wird an der Datei nichts geändert und sie liegt weiterhin im temporären Papierkorb, wird diese nach einer beliebigen Zeit unwiderruflich gelöscht.

Für jeden dieser Schritte kann ein Report erstellt werden, sodass Sie als Administrator die Möglichkeit haben festzustellen, wann was passiert ist.

Dieses Script erledigt das alles vollautomatisch für Sie!

Eine Möglichkeit zur direkten Löschung ist geplant und erfolgt in Kürze.

## Systemvoraussetzungen ##
* Betriebssystem ab Windows 7
* Windows PowerShell
* freie ExecutionPolicy

## Installation ##

1. Alle Dateien herunterladen,
2. Execution Policy der PowerShell (als Administrator) auf "Unrestricted" setzen (Set-ExecutionPolicy Unrestricted),
3. "start.ps1" ausführen.

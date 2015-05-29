title: 'Mac: Steam Update Probleme beseitigen'
tags:
  - Apple
  - Steam
id: 546
categories:
  - Tutorials
date: 2010-07-07 11:51:41
---

Da ich selbst knapp 30 Minuten darin investiert habe, mein **Steam** auf OSX wieder zum Updaten zu bekommen, poste ich mal ein kleines **HOWTO** zu dem Problem und der Beseitigung, um den Steam Update wieder lauffähig zu bekommen.<!--more-->

# Das Problem

Woher es kommt, weiß ich auch nicht. Bei mir hat alles wunderbar geklappt, bis das Problem aufgetreten ist. Also verweifelt nicht daran.

Hier nochmal die Fehlermeldung (_Fatal Error_):
> **Steam needs to be online to update. Please confirm your network connection and try again.**

#  Steam Update: Neue Methode

Mittlerweile sind die Downloads leider nicht mehr verfügbar. Eine neue Lösung habe ich zu dem Thema leider nicht parat, außer dass ihr es vielleicht mit dem normalen [Steam App](http://store.steampowered.com/about/ "Steam Download") versuchen solltet. Das würde sozusagen eine Neuinstallation gleichkommen.

Vielleicht können euch aber [englischsprachige](http://excid3.com/blog/osx-error-steam-needs-to-be-online-to-update/#.UW1aMCugMvU) Blogger helfen. Vor allem der [Beitrag](http://lastplaceonthe.net/steam-needs-online-update/) von lastplaceonthe.net scheint interessant zu sein und kann dem ein oder anderen helfen.

Ich übersetze kurz die wichtigste Stelle:

*   Öffne _&lt;user&gt;/Library/Application Support/Steam_ (dies geht über den Terminal "_open ~/Library/Application Support/Steam"_
*   Lösche die Datei _registry.vdf_
*   Öffne Steam, denn jetzt sollte es wieder funktionieren
Wenn der Ordner _~/Library_ nicht sichtbar ist, kannst du den Ordner mit dem Kommando

`chflags nohidden ~/Library`

dauerhaft sichtbar machen. Man braucht diesen Ordner sehr oft eigentlich.

Hier noch ein Bild um die zu löschende Datei zu finden:
[![](http://lastplaceonthe.net/wp-content/uploads/2011/02/Screen-shot-2011-06-24-at-10.32.27.png)](http://lastplaceonthe.net/wp-content/uploads/2011/02/Screen-shot-2011-06-24-at-10.32.27.png)
Quelle: lastplaceonthe.net

# Viele Lösungen, aber nur eine hat geklappt (veraltet)

Ich habe viele Lösungen im [Steam Forum](http://forums.steampowered.com/forums/showthread.php?t=1265379) ausprobiert, aber es hat tatsächlich nur die letzte **Lösung** etwas geholfen. Die ist zwar auch von einem **User**, aber von Steam selbst habe ich auch nichts zu dem Thema gefunden, außer den typischen Antworten: "**Router** einstellen", "**Firewall** einstellen", "**Ports** öffnen", "**Proxy**/**VPN** einstellen".

Letztendlich hat ein User einfach seine funktionsfähige **Steam.app** Datei hochgeladen. Ich habe sie runtergeladen und dann hat das mit dem Steam Update wieder funktioniert. Hier die Links:

*   Datei download (Link geht nicht mehr)
*   [Forums Beitrag](http://forums.steampowered.com/forums/showpost.php?p=15362738&amp;postcount=246)
Ich hoffe meine Beschreibung zum Steam Update Problem beseitigen hat funktioniert und das Programm läuft auch online wieder einwandfrei auf eurem OS X Gerät.
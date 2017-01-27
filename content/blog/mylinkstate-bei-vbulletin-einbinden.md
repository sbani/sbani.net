---
title: MyLinkState bei vBulletin einbinden
tags:
  - vBulletin
id: 237
categories:
  - Tutorials
date: "2009-01-02T14:20:53-05:00"
---

Ich habe euch mal ein kleines **Tutorial** geschrieben, wie man den **MyLinkState Code** bei **vBulletin** einbindet.
<!--more-->

Mit dieser **Anleitung** könnt ihr den MyLinkState Code in jedes von euch gewünschte **Template** einbauen. Das ganze einfach über eine Variable.

Der Plugin

Als erstes erstellen wir einen Plugin. Dazu geht ihr im AdminCP von vBulletin unten auf _Add-Ons und Plugins -&gt; Plugin hinzufügen_.
Als Einstiegspunkt (**Hook**) wählt ihr _global_start_ und als Titel _MyLinkEstate Code_, die Ausführungsreihenfolge lasst ihr einfach auf _5_.
Als nächtes fügt ihr den von MyLinkState gegebenen Code ein. Wichtig dabei sind folgende Dinge:

1.  Den PHP Anfang und das Ende löschen: _&lt;?_, _?&gt;_
2.  Vorne hängt ihr folgendes an: _function getLinkCode() {_
3.  Hinten hängt ihr das an: _} $mylinkstate = getLinkCode();_
4.  _echo $mls_html;_ mit _return $mls_html;_ ersetzen_
_
Das ganze sieht dann ungefähr so aus:
```php
function getLinkCode() {
 // DEIN CODE OHNE <? und ?> und echo $mls_html; mit return $mls_html; ersetzen
} __$mylinkstate = getLinkCode();
```
Jetzt noch den **Plugin** aktivieren und fertig seit ihr.

Nun könnt ihr in jedem Template die Variable _$mylinkstate_ verwenden.

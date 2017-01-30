---
title: Git verschwundenen commit wiederherstellen
tags:
  - Git
id: 879
categories:
  - Tutorials
date: "2013-03-29T10:39:59-05:00"
---

## Git commit verschwunden

Aktuell kenne ich mich noch nicht weitgehend mit **Git** (oder Github) aus und deshalb ist mir etwas blödes passiert:

Als ich einen **commit** gemacht habe, um meine neuen Daten zu "speichern", waren diese commited Daten auf einmal weg. Also es waren genau die Daten **verschwunden**, die ich commited habe. Natürlich war ich erstmal schockiert und habe wild in der [Git GUI](http://eclipse.github.com/) für **Eclipse** /das **Zend Studio** (_Egit_) herum geklickt, ohne meine verlorenen Daten wieder zu finden. Meine **Daten** waren einfach **weg**!

Nun habe ich natürlich umgehend im Internet gesucht und bin auf den [Artikel von abhikp](https://github.com/abhikp/git-test/wiki/Recovering-a-lost-commit) gestoßen, in welchem genau dieses Problem beschrieben wird.

<!--more-->

## Git commit wiederherstellen

<span style="font-size: 13px;">Im Grunde kann man davon ausgehen, dass </span>Git<span style="font-size: 13px;"> jeden commit speichert und ihr diesen auch immer in den Logs finden könnt.</span>

Zuerst versuchen wir es mit
<pre>git reflog</pre>
und durchsuchen so die Updates innerhalb des branches. Das Ergebnis sollte so aussehen und uns die commits und changes anzeigen.
<pre>% git reflog
286641d HEAD@{0}: 283331dc5ef74ba119eb733aa962da2933b686a8: updating HEAD  
1bbdc8f HEAD@{1}: commit: Losing commit ...</pre>
Ich habe unseren verlorenen commit als "Losing commit" benannt. Deshalb ist er relativ leicht zu identifizieren. Wenn ihr euch nicht sicher seit, welcher commit der richtige ist, dann kopiert euch den SHA1 Hash (z.B. 1bbdc8f) und benutzt folgenden Code, um euch mehr infromationen anzeigen zu lassen:
<pre>git show</pre>
Wenn ihr den richtigen Commit gefunden habt, dann benutzt den Code, um eure **verlorenen Daten** wiederherzustellen:
<pre>git cherry-pick</pre>
Danach sind die Dateien wieder im Branch sichtbar.

**Viel Erfolg beim Coding!**

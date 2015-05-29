title: 'Eclipse: Zeilen zählen - in Projekt'
tags:
  - Eclipse
  - PHP
id: 443
categories:
  - Tutorials
  - Web Development
date: 2010-04-30 06:48:13
---

Leider ist **Eclipse** bzw auch **Aptana** immer noch sehr stark Java lastig. Als ich also nach einem Plugin gesucht habe, mit dem man mit **Eclipse Zeilen zählen** kann; Zeilen Code oder auch in mehreren Projekten, stieß ich auf [Metrics](http://metrics.sourceforge.net/) und [CAP](http://cap.xore.de/). Dummerweise sind die beiden **Plugins** nur für **Java-Projekte** geeignet. Ich programmiere jedoch nur in **Python** (Pydev) und **PHP** (PDT). <!--more-->

![](https://www.eclipse.org/eclipse.org-common/themes/Nova/images/eclipse-800x426.png)Also habe ich die Suche fortgesetzt: Dank der guten Suchmaschinen bin ich auf einen [Artikel von BINARYFROST.com](http://www.binaryfrost.com/index.php?/archives/207-Easy-way-to-count-Lines-of-Code-in-Eclipse.html) gestoßen und das ist genau das was ich gesucht habe.

## Ein einfacher Weg die Zeilen an Code zu zählen

> 1) Search -&gt; File
> 
> 2) _File name patterns_: *.php (oder *.java / *.py)
> 
> 3) _Containing Text_: \n
> 
> 4) _Regular Expression_ ankreuzen
> 
> 5) _Enclosing Project_ ankreuzen (wenn ich nur im Projekt suchen wollt)
> 
> 6) _Search_ klicken
> 
> 7) Rechts öffnet sich die Suchmaske mit den Resultaten und ganz oben (bei Aptana) steht sowas wie:
> 
> _'\n' - XXXXX__ matches in _'XXXXXX'_ (*.php)_. Ansonsten steht neben den Dateien immer _(_XX_ matches)_, was angibt wie viele Zeilen die Datei beinhaltet.
Noch einmal danke an BINARYFROST.com für diese im Grunde wirklich sehr simple Lösung in Eclipse Zeilen zählen zu können, die sogar ohne Plugin oder Installation auskommt.
---
title: Warum Sessions in die Datenbank gehören
tags:
  - PHP
id: 407
categories:
  - Web Development
date: "2009-12-08T15:39:59-05:00"
slug: warum-session-in-die-datenbank-gehoeren
---

Endlich finde ich mal wieder die Zeit für einen Artikel! Auch wenn es nur ein Kleiner ist.

Diesmal kläre ich die Frage, warum Sessions für größere Projekte in die **Datenbank** gehören und nicht wie von **PHP** "vorgegeben" ins **Dateisystem**.

Beginnen wir mit der Frage was gegen Sessions in der Datenbank spricht:

*   Na als erstes braucht man überhaupt keine Datenbank! :)
*   Der C-Code in dem PHP geschrieben wurde ist schneller als das Schreiben und Holen der Datenbank.
*   Es ist kein extra Code nötig, um die Funktion sauber zu implementieren, da PHP bereits alles Nötige mitliefert. (**$_SESSION** **Array**)
Nun, es gibt eigentlich nur einen Grund, der für Sessions in Datenbanken spricht, aber dieser ist schwerwiegend:
Die Datenbank, ist im Gegensatz zum Dateisystem auch extern kontaktierbar. Das bedeutet, dass man die Session auf **verschiedenen Servern** fortlaufen lassen kann.
Ein **Beispiel**:
hosting.sbani.net ist auf der IP 127.0.0.1;
videos.sbani.net ist auf der IP: 127.0.0.2;
beide auf verschiedenen Servern.
Um den User jedoch auf beiden Seiten seine Session zu lassen, verbindet man einfach mit einer Datenbank von beiden aus und hat eine Session für beide Seiten. Somit ist der Benutzer nicht gezwungen sich auf beiden Servern mit der gleichen Benutzerkennung anzumelden.

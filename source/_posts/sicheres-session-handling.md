title: Sicheres Session-Handling
tags:
  - PHP
  - Server
id: 408
categories:
  - Tutorials
  - Web Development
date: 2009-12-08 16:00:51
---

Als ich gerade den Beitrag über das **Handling** von Sessions in [**Datenbank oder Dateisystem**](http://www.sbani.net/2009/12/08/warum-sessions-in-die-datenbank-gehoren.html) geschrieben habe und in den verschiedenen **Foren** auf diverse Diskussionen traf, musste ich einfach noch einen Beitrag zur Sicherheit von Sessions schreiben.

Es gibt zwar viele verschiedene Wege und man muss gewiss nicht alle anwenden, doch den ein oder anderen **Tipp** kann man doch umsetzen.

## 1\. Session/Cookies verschlüsseln

Absolut naheliegend ist es, entweder den Inhalt, oder den Cookie in dem die **SessionID** gespeichert ist zu verschlüsseln. Hierfür gibt es zig Methoden und fertigen **Code**, der einfach nur genutzt werden muss. Ich für meinen Teil verschlüssel nur den Cookie, da die komplette Session zu verschlüsseln einen zu großen **Overhead** erzeugt.

## 2\. Sessions ohne Cookies

Wenn ein **Client keine Cookies** akzeptiert kann das zu einem wirklich Problem werden. Die einzige sinnvolle Möglichkeit die Session zu übergeben ist die **URL**. Dies birgt jedoch ein erhebliches **Sicherheitsrisiko**. Man nehme an, der **Client** gäbe einen Link weiter, an den die Session angehängt sei. Jeder **Angreifer** würde mit dem Aufruf des Links automatisch die Session des Opfers übernehmen. Einfachste Lösung: Session aus der URL löschen, bevor man sie weiter gibt. Da man dies aber nicht von den Usern verlangen kann, muss eine andere **Lösung** her: Noch ist es nicht verboten **IP**s zu speichern und deshalb ist es die einfachste Methode, die IP des Clients mit in die Session zu übernehmen und die Session an diese IP zu binden. Sobald der User also die IP ändert, hat er keinen Zugriff mehr auf die Session.

## 3\. session_regenerate_id()

Ein Problem stellen hier jedoch Proxys, "gefälschte IP-Adressen", oder ganz einfach User aus dem gleichen Netzwerk dar: Um diesem Problem entgegen zu wirken, biete PHP eine schon fertige Funktion an: [session_regenerate_id()](http://de2.php.net/manual/de/function.session-regenerate-id.php "PHP Funktion session_regenerate_id()")
Diese Funktion ist sehr simpel: Sie kopiert den kompletten Session-Inhalt in eine neue Session und löscht die Alte. Somit kann verhindert werden, dass selbst bei herausgegebener Session, ein Angreifer sie nutzen kann, denn sie verfällt einfach. Am besten baut man diese Funktion ein, indem man angibt, dass sie alle 5 Minuten die Session neu generieren soll.

## 4\. Do it! Quick and easy

Die angesprochenen Funktionen und Methoden habe natürlich nicht ich entwickelt, geschweige denn erfunden! Das gibt es alles schon und meist schon sehr professionell und in einem Stück/in einer Klasse. Jedes gute Framework bietet diese Funktionen und setzt sie meist sogar standartisiert ein. Nutzt also die vorhanden Möglichkeiten und erfinden das Rad nicht neu :)
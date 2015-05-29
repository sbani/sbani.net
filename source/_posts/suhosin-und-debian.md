title: 'Howto: Suhosin und Debian'
tags:
  - Debian
  - Server
  - Sicherheit
id: 6
categories:
  - Tutorials
  - Web Development
date: 2008-02-28 17:38:45
---

_**Das war mal wieder ein Stress...**_

2 Mal habe ich meinen vServer komplett zerschossen! Dabei wollte ich einfach nur den [Suhosin](http://www.hardened-php.net/suhosin/) installieren...
Vielleicht kann ich dies mit dieser Hilfestellung Anderen ersparen.

**Information:** Suhosin wird keinerlei Auswirkung auf Confixx oder ähnliche Admin-Panels haben.

## Was ist Suhosin?

Suhosin ist ein Patch bzw eine Extension für PHP, mit der man die Sicherheit des PHP Grundkerns verbessert. Praktisch eine Sammlung von Securityfixes. Der Haken? Performance! Ein [Brenchmark-Test](http://www.hardened-php.net/suhosin/benchmark.html) auf der Enticklerseite, zeigt wie groß die Unterschiede sind. Für genaüre Infos, würde ich mich allerdings auf der [Suhosin-Homepage](http://www.hardened-php.net/suhosin/) einlesen.

## Suhosin installieren

Selbst Compilieren? Ja das ist auf jedenfall super, wer aber nicht genau weiß, was er tun muss: Lieber sein lassen.

Hier der Tipp von mir:
```shell
$ apt-get install php5-suhosin
```
Auch zu auf der [Debian-Paket-Seite](http://packages.debian.org/search?searchon=names&amp;keywords=suhosin) zu finden.

Damit installiert ihr den Patch auf ganz leichte Art.

Danach Apache restart und fertig!

Wer es doch alleine versuchen will:

*   [http://www.hardened-php.net/suhosin/how_to_install_or_upgrade.html](http://www.hardened-php.net/suhosin/how_to_install_or_upgrade.html)

## Ist es schon da?

Um zu testen ob Suhosin schon installiert ist, einfach eine neü phpinfo()-Datei erstellen:

Datei-Inhalt:
```php
<?php phpinfo(); ?>
```
Wenn man die Datei nun über den Browser aufruft, müsste man in etwa sowas vorfinden:
> Zend Engine v2.2.0, Copyright (c) 1998-2006 Zend Technologies
> **with Suhosin v0.9.12, (C) Copyright 2006, by Hardened-PHP Project**

Und das war's! Und ich brauch dafür gute 4 Stunden ;-)
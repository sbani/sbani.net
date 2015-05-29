title: 'HowTo: eAccelerator auf Debian'
tags:
  - Apache
  - Debian
id: 7
categories:
  - Tutorials
  - Web Development
date: 2008-02-29 08:38:53
---

Da ich ein richtiger Nimmersatt bin, möchte ich natürlich auch jetzt wieder mein PHP etwas verbessern.

Zürst hat sich mir allerdings folgende Frage gestellt:

## Warum eAccelerator und nicht Zend Optimizer?

Es waren einige Benchmark-Tests, die mich dazu bewogen haben, mich für eAccelerator zu entscheiden:

*   [Masterbootrecord](http://masterbootrecord.de/blog/Benchmark-eAccelerator-0.9.5-beta2-versus-Zend-Optimizer-3.0.0/Benchmark-eAccelerator-0.9.5-beta2-versus-Zend-Optimizer-3.0.0_2006-04-14_419.html)
*   [http://eaccelerator.de/](http://eaccelerator.de/)
Beide kamen ungefähr auf die gleichen Ergebnisse:

StandartPHP: _Time per reqüst:       9.496 [ms] (mean, across all concurrent reqüsts)_
Zend Optimizer: _Time per reqüst:       9.134 [ms] (mean, across all concurrent reqüsts)_
eAccelerator: _Time per reqüst:       5.222 [ms] (mean, across all concurrent reqüsts)_

Also ein deutlicher Sieg für eAccelerator.

## Installation unter Debian

Als erstes bereiten wir PHP vor (bei mir nur PHP5):
```shell
apt-get install build-essential php5-dev
```
Jetzt machen wir folgendes:
```shell
_cd /tmp
wget http://bart.eaccelerator.net/source/0.9.5.2/eaccelerator-0.9.5.2.tar.bz2
tar xvfj eaccelerator-0.9.5.2.tar.bz2
cd eaccelerator-0.9.5.2
phpize
./configure
make
make install_
```
In diesem Schritt haben wir jetzt eAccelerator heruntergeladen und entpackt. Als nächstes haben wir PHP und eAccelerator configuriert. Mit den letzten 2 Kommandos wurde die Extension compiliert und installiert.

Da das Programm nun installiert ist, müssen wir PHP nur noch mitteilen, dass wir davon Gebrauch machen wollen. Dazu nutzen wir die conf.d von php, da dann eaccelerator automatisch in allen Konfigurationen integriert ist. Dies braucht man zum Beispiel für eine Confixx Umgebung mit mehreren php.ini's.

Also erstellen wir mal eine Config-Datei :
```shell
nano /etc/php5/conf.d/eaccelerator.ini
```
Wenn dieser Command nicht funktioniert, versucht es einfach mit _vi_ statt _nano_.

Füllt die Datei mit folgendem Code:
```
extension="eaccelerator.so"
eaccelerator.shm_size="16"
eaccelerator.cache_dir="/var/cache/eaccelerator"
eaccelerator.enable="1"
eaccelerator.optimizer="1"
eaccelerator.check_mtime="1"
eaccelerator.debug="0"
eaccelerator.filter=""
eaccelerator.shm_max="0"
eaccelerator.shm_ttl="0"
eaccelerator.shm_prune_period="0"
eaccelerator.shm_only="0"
eaccelerator.compress="1"
eaccelerator.compress_level="9"
```
Welche Einstellungen ihr genau vornehmen wollt,  sucht ihr euch am besten auf der [Entwickler-Seite](http://www.eaccelerator.net/wiki/Settings) zusammen.

Jetzt müssen wir dem Cache-Dir noch die Nötigen Rechte geben:
```shell
mkdir -p /var/cache/eaccelerator
chmod 0777 /var/cache/eaccelerator
```
Zu guter Letzt nur noch den Apache neustarten:
```
/etc/init.d/apache2 restart</span>_</pre>
Um zu testen, ob alles funktioniert hat, müssen wir jetzt nur noch eine phpinfo() aufrufen. Dazu erstellen wir in einem html-dir noch eine Datei namens _info.php_. Inhalt:
```php
<?php phpinfo(); ?>
```
Wenn wir die Datei über unsere Seite aufrufen und folges darin steht...

   This program makes use of the Zend Scripting Language Engine:
   Zend Engine v2.2.0, Copyright (c) 1998-2006 Zend Technologies
   with eAccelerator v0.9.5.2, Copyright (c) 2004-2006 eAccelerator, by eAccelerator
   with Suhosin v0.9.12, (C) Copyright 2006, by Hardened-PHP Project

...dann wissen wir, dass wir es geschafft haben.

Viel Spaß also mit eurem schnelleren PHP....
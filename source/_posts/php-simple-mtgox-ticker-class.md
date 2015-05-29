title: 'PHP: Simple Mt.Gox Ticker Klasse'
tags:
  - Bitcoin
  - Mt.Gox
  - PHP
id: 891
categories:
  - IT/Web
  - Web Development
date: 2013-03-30 15:34:38
---

![](http://cdn1.iconfinder.com/data/icons/metro-uinvert-dock/128/Github.png)
Ich habe eine sehr simple PHP-Klasse geschrieben, welche die **API** von Mt.Gox benutzt. Mit Hilfe der Klasse kann man im wesentlichen die aktuellen Kurse für **Bitcoins** erhalten.

Praktisch ist diese Klasse, wenn man mit dem aktuellen Kurs (Höchster, aufgewogenes Mittel, Niedrigster, Letzter) von MtGox rechnen möchte.

Die Klasse ist sehr einfach und somit selbsterklärend: [Zu Github](https://github.com/sbani/mtgox-ticker-phpclass "Mt.Gox PHP Class")

Ich gebe trotzdem noch eine kurze Usage mit bei:
```php
<?php
$usd = new mtgox('usd');
echo $usd->getHigh(); // daily high
echo $usd->getLast(); // last price
?>
```

## Update 1

Die Ticker Klasse hat sich aktualisiert zur API **Version 2**. Dabei haben sich die URLs geändert. Ich werde die Klasse in kürze umschreiben. Sollte nicht viel Arbeit sein.
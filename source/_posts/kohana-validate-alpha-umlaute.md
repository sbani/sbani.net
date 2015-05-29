title: 'Kohana: Umlaute mit Validate::alpha zulassen'
tags:
  - Kohana
  - PHP
id: 945
categories:
  - Web Development
date: 2013-05-05 18:59:46
---

Wenn man mit dem Kohana PHP Framework (v3.3) und der Methode [Validate::alpha](http://kohanaframework.org/3.0/guide/api/Validate#alpha) einen String checkt, ob nur Buchstaben vorhanden sind (aus dem Alphabet), dann checkt er nicht auf (deutsche) Umlaute.

Dies kann man verhindern, indem man folgendes macht:
```php
Validate::alpha('München'); //false
Validate::alpha('München', true); // true
```
Das liegt an [ctype_alpha](http://php.net/manual/de/function.ctype-alpha.php) und daran, dass deutsche Umlaute von dieser Funktion nicht standardmäßig erkannt werden.
---
title: 'Kohana: Deutsche Umlaute mit URL::title'
tags:
  - Kohana
  - PHP
id: 936
categories:
  - Web Development
date: "2013-05-05T18:16:14-05:00"
---

Da ich gerade selbst das Problem hatte, mit den deutschen Umlauten bei Kohana, habe ich schnell die [URL::title()](http://kohanaframework.org/3.0/guide/api/URL#title) Methode für das **Kohana PHP Framework** 3.3 angepasst bzw leicht erweitert.

Es gibt im Grunde eine Möglichkeiten wie man die URL::title Methode ohne Änderung verwenden kann:
```php
URL::title('Würde Könnte Hätte'); // würde-könnte-hätte
URL::title('Würde Könnte Hätte', '-', true); // wurde-konnte-hatte
```

Das Ergebnis überzeugt mich persönlich aber nicht, da ich die Umlaute gerne nach deutschem Vorbild verändert haben möchte:

*   ä => ae
*   ö => oe
*   ü => ue
*   ß => ss

Für mich tut es diese Lösung auf jeden Fall:

```php
<!--?php

class URL extends Kohana_URL
{
    /**
     * We build a title and replace the german specific letters
     *
     * @param string $title
     * @param string $separator
     * @param bool $ascii_only
     * @return string
     */
    public static function title($title, $separator = '-', $ascii_only = TRUE)
    {
        $title: str_replace(array('ä', 'ö', 'ü', 'ß', '€'), array('ae', 'oe', 'ue', 'ss', 'eur'), $title);

        return parent::title($title, $separator, $ascii_only);
    }
}
```
So würde das ganze dann funktionieren:
```php
URL::title('Würde Könnte Hätte', '-', true); // wuerde-koennte-haette
```
Ich hoffe, dass auch andere meinen kleinen **Code** gebrauchen können.

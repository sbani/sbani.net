---
title: "cPanel PHP Cronjob funktioniert nicht / doesn't work"
tags:
  - cPanel
  - PHP
id: 844
categories:
  - IT/Web
  - Tutorials
  - Web Development
date: "2012-12-16T15:57:29-05:00"
slug: cpanel-php-cronjob-doesnt-work
---

Um bei **cPanel** einen **Cronjob** zu hinzuzufügen, ist es notwendig den kompletten Pfad anzugeben. Aber nicht nur den kompletten Pfad zum Script sondern auch den kompletten Pfad zur bin, die das PHP Script ausführt.

Hier ein Beispiel:
`/usr/local/bin/php /home/username/public_html/cli.php`

Wenn man folgendes eingibt funktioniert es nicht:
`php /home/username/public_html/cli.php`

* * *

To **add** a **cronjob** to **cPanel**, you have to add the complete path of the bin thats executes your php script.

For example:
`/usr/local/bin/php /home/username/public_html/cli.php`

That does not work:
`php /home/username/public_html/cli.php`

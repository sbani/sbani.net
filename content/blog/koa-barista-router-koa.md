---
title: 'koa-barista: Router for koajs Node Framework'
tags:
  - Node.js
id: 1042
categories:
  - Web Development
date: "2014-04-19T10:52:15-05:00"
---

Kurz und knapp: [koa-barista](https://www.npmjs.org/package/koa-barista "NPM Package ") ist eine middleware für koa. Ein router, mit dem man Controller im MVC Style anlegen kann.

Aktuell spiele ich viel mit NodeJS und den verschiedenen Frameworks, die man so kennt. Die Eindrücke, die einen bei der rasanten Entwicklung ereilen, sind mächtig. Völlig unterschiedliche Frameworks, für die verschiedensten Anwendungen. Und dazu immer die mehr oder weniger kleinen Module im [npm](https://www.npmjs.org "Node Package Manager"), die einen das Entwickler-Leben unglaublich erleichtern.

Da ich mich schon länger in [koa](http://koajs.com/ "koaJS framework") verguckt habe, als (Generator) Alternative für express, wollte ich nun auch endlich Teil dieses Puzzles sein und habe eine kleine middleware geschrieben um besseres routing betreiben zu können.

Dazu habe ich mich entschieden [barista](http://kieran.github.io/barista/ "Barista Router") als routing engine zu nutzen. Denn im Gegensatz zu den meisten Javascript Entwicklern halte ich bereits jetzt den Kurs zu MVC Frameworks. Somit war Barista mit seinem Routing auf die MVC-Art die meiner Meinung nach richtige Wahl.

Ein Beispiel für die gute Nutzbarkeit ala MVC ist das Objekt, welches man bei einem Match zurück erhält:
```json
{
  controller: 'User',
  action: 'show',
  username: 'sbani',
  method: 'GET'
}
```
Das Wording auf controller und action ist quasi genau dafür geschaffen den Einsatz in einem MVC Pattern zu rechtfertigen. Und hat es mir leicht gemacht das "Controller Pattern" für koa umzusetzen.

Man legt mit koa-barista also Routes (oder Controller) an, die letztendlich wieder als Middleware dienen zu koa.

Bevor ich hier noch einmal die gleichen Beispiele wiederhole, empfehle ich einfach dem [Link zu Github](https://github.com/sbani/koa-barista "Github koa-barista Repo") zu folgen.

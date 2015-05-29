title: 'WTF: MacBook Pro konfiguriert Proxy?'
tags:
  - Apple
id: 550
categories:
  - Apple
  - Tutorials
date: 2010-07-08 06:37:10
---

Ich weiß zwar nicht warum, aber nach den [Problemem mit Steam](http://www.sbani.net/2010/07/07/howto-mac-steam-update-probleme-beseitigen.html), haben immer mehr Programme (z.b. Mac Software Update) Probleme mit der Verbindung ins Internet gehabt. Die **Softwareaktualisierung** hat mir einen genauen **Error** ausgeworfen, so dass ich mal nachschauen konnte woran das denn liegt. <!--more-->

Der **Fehler**:
> Verbindung zum [Proxy](http://www.sbani.net/tag/proxy) Server nicht möglich

**Proxy Server**? Ich hatte nie einen eingestellt!
Also ab in die **Systemeinstellungen** -&gt; **Netzwerk** -&gt; **AirPort** -&gt; **Weitere Optionen** -&gt; Reiter: **Proxies**

Und siehe da: Tatsächlich war ein **Web-Proxy (HTTP)** eingestellt auf _localhost:8228_. Keine Ahnung wie der da hingekommen ist, aber ich habe ihn rausgenommen. Und siehe da: Alles funktioniert wieder wie vorher.

Gott sei Dank, können Computer nicht selbstständig handeln?!?!?
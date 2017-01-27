---
title: 'Domain im selben Verzeichnis umleiten (domain.de > www.domain.de)'
tags:
  - Domain
  - htaccess
id: 385
categories:
  - Tutorials
date: "2009-03-28T10:32:28-05:00"
---

Da ich heute versucht habe heraus zu finden, wie man seine **Domain** am schlauesten umleitet und ich wusste, dass dies am besten mit **.htaccess** funktioniert, habe ich mich mal ein wenig schlau gemacht: <!--more-->

Wenn 2 Domains im **selben Verzeichnis** liegen, wie es bei meinem **ispCP** der Fall ist, und man nicht einstellen kann, dass die Domains sich gegenseitig **weiterleiten** sollen, dann macht man das ganze am besten mit einer **htaccess Datei**.

Ein Beispiel: in dem Verzeichnis _verzeichnis_ liegen die Domains domain.de und www.domain.de. Aus Gründen der **Suchmaschinenoptimierung**, will man natürlich, dass alle Domains zu www.domain.de leiten.

Dies erreicht man nun am besten mit dieser .htaccess Datei (die in _verzeichnis_ liegt):
<pre lang="apache"># von domain.de zu www.domain.de
RewriteEngine on
RewriteCond %{HTTP_HOST} !^www.domain\.de$
RewriteRule ^(.*)$ http://www.domain.de/$1 [L,R=301]</pre>
Nun werden alle Aufrufe der Domain domain.de automatisch an www.domain.de weitergeleitet.

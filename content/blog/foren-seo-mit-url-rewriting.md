---
title: Foren SEO mit URL-Rewriting?
tags:
  - SEO
  - vBulletin
id: 361
categories:
  - Allgemein
date: "2009-03-13T19:26:40-05:00"
---

Viele **Forenbetreiber** stellen sich die Frage, ob die **Suchmaschinenoptimierung** bei ihnen nicht zu kurz kommt. Da ich bekanntlich auch ein **Forum** leite und auch ich mich mit diesem Thema beschäftige, kam ich nach langem Überlegen und ausprobieren zu folgendem Schluss: <!--more-->

**Erklärung**:

Um den Unterschied zwischen statischen und dynamischen URLs zu erklären, nenne ich einfach 2 Beispiele:

Statisch www.sbani.net/das-ist-statisch.html (menschlich lesbar)

Dynamisch www.sbani.net/index.php?id=123 (nur die Software versteht)

Man nehme an, dass man bei beiden URLs auf der gleichen Seite rauskommt.

Abkürzungen: SEO = Search Engine Optimization = Suchmaschinenoptimierung

## Die Software

Ich weiß nicht genau, wie es bei anderen Foren ist, da ich nur das **vBulletin** benutze, aber man braucht eigentlich immer eine Erweiterung, einen **Plugin**, **Mod**, oder **Add-On** für seine **Forensoftware**. Dies ist meist etwas komplizierter zu realisieren, da die Anwendung eigentlich nie auf **statische URLs** ausgelegt ist und somit oft sogar in den Kern-Dateien rumgebastelt werden muss. Jeder kann sich denken, dass es dadurch mal schnell zu ausfällen am Forum kommen kann und dass der Schaden potentiell größer ist.

Um es mal auf den Punkt zu bringen: Ich habe etwa 3 Add-Ons für das vBulletin ausprobiert und nur einer hat funktioniert: [YABBSEO Lite](http://www.vbulletin.org/forum/showthread.php?t=205602). Alle anderen Add-Ons gingen irgendwie überhaupt nicht! Den bekanntesten Add-On (**vbSEO**) habe ich jedoch nicht getestet, da mir 150$ einfach zu teuer sind.

**YABBSEO Lite** kam allerdings auch ganz schnell wieder runter, da es nicht mit einem anderen (wichtigeren) Plugin kooperierte.

## Ist URL-Rewriting überhaupt nötig?

Viele denken ja, dass URL-Rewriting absolut notwendig ist und das es einen viel weiter bringt als das ganze andere SEO - bei mir habe ich beispielsweiße die Titel mit &lt;h1&gt; attributen ausgestatten, statt sie nur fett (&lt;b&gt;) zu machen - aber das ist nicht richtig! Aber da man mir als normalen **Blogger** wahrscheinlich nicht glaubt, lasse ich Google sprechen:
> **Myth: "Dynamic URLs cannot be crawled."**
> 
> 
> **Fact:** We can crawl dynamic URLs and interpret the different parameters. We might have problems crawling and ranking your dynamic URLs if you try to make your urls look static and in the process hide parameters which offer the Googlebot valuable information. One recommendation is to _**avoid reformatting a dynamic URL to make it look static**_. It's always advisable to use static content with static URLs as much as possible, but in cases where you decide to use dynamic content, you should give us the possibility to analyze your URL structure and not remove information by hiding parameters and making them look static.
> 
> 
> **Myth: "Dynamic URLs are okay if you use fewer than three parameters."**
> 
> 
> **Fact:** There is no limit on the number of parameters, but a good rule of thumb would be to _**keep your URLs short**_ (this applies to all URLs, whether static or dynamic). You may be able to remove some parameters which aren't essential for Googlebot and offer your users a nice looking dynamic URL. If you are not able to figure out which parameters to remove, we'd advise you to serve us all the parameters in your dynamic URL and our system will figure out which ones do not matter. Hiding your parameters keeps us from analyzing your URLs properly and we won't be able to recognize the parameters as such, which could cause a loss of valuable information.
**Kurz auf Deutsch**:

Es nutzt nichts, die dynamischen URLs (z.b. eines Forums) mit aller Gewalt in statische URLs zu wandeln, denn **Google** erkennt es und ignoriert die "Macht eines statischen Links". Außerdem stimmt es nicht, dass man nicht mehr als 3 Parameter (?id=1&amp;page=1&amp;highlight=bad) nutzen darf. So wenige wie möglich ist natürlich gut, aber es ist einfach nicht wirklich schlimm, wenn man doch mehr hat.

## Fazit

Es nutzt nichts die URLs statisch zu machen und ihr könnt euch auf eure sontigen **Einstellungen** verlassen.

Wenn ihr jedoch auch nicht wisst, was ihr sonst so an (einfachem) **SEO** betreiben könnt, solltet ihr mal folgenden Tipps folgen: [SEO Tipps (Englisch)](http://www.computing-tips.com/2008/06/18/how-to-seo-vbulletin/) **Punkt 1 **solltet ihr natürlich **nicht beachten**.

PS: Ich nutze noch folgende Add-Ons um mein Forum zu unterstützen: [vB Google Search Cloud](http://www.vbulletin.org/forum/showthread.php?t=178714), [Automatic Thread Tagger](http://www.vbulletin.org/forum/misc.php?do=producthelp&amp;pid=autotag38), [vBSEO Google/Yahoo Sitemap Generator](http://www.vbulletin.org/forum/showthread.php?t=184573)

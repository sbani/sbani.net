title: 'Howto: SSH sicherer machen'
tags:
  - Debian
  - Sicherheit
id: 33
categories:
  - Internet
date: 2008-06-04 12:36:46
---

Um sich gegen diverse Attacken gegen [SSH](http://www.openssh.org/ "OpenSSH") zu schützen, sollte man mindestens folgende Schritte vornehmen.

Das ganze mache ich wie immer unter Debian.


Zuerst einmal müssen wir alles auf den neuesten Stand bringen (vor allem natürlich ssh)
```shell
apt-get update &amp;&amp; apt-get dist-upgrade
```
Da wir root verbieten wollen sich ein zu loggen, um uns gegen BruteForce-Attacken zu schützen, müssen wir erst einmal einen neuen User erstellen:
```shell
adduser username
```
Als nächstes verbieten wir root sich ein zu loggen in der Datei **/etc/ssh/sshd_config**
Von
`PermitRootLogin yes` zu `PermitRootLogin no`
Wer will kann den Port noch ändern um noch mehr Sicherheit zu erlangen:
`Port 22` zu `Port 222`
Damit hat man einen wirkungsvollen Schutz gegen BruteForce- oder Scan-Attacken.

Zum Schluss bitte nicht vergessen ssh neu zu starten:
```shell
/etc/init.d/ssh restart
```
Um sich nun ssh nutzen zu können loggt man sich mit dem neuen Benutzernamen ein. Root-Zugriff erhält man dann entweder per "**sudo**" oder "**su root**"
Ich bevorzuge hier **su**, da man bei **sudo** noch etwas einstellen muss.

Einfach als root einloggen:
```shell
su root
```
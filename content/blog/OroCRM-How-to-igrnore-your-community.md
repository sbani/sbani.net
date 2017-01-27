---
title: 'OroCRM and how to ignore your community'
date: "2016-02-17T07:24:19-05:00"
categories:
    - IT/Web
tags:
    - OroCRM
    - OpenSource
---

This is a post created after several incidents occuring in the Oro community. I am very angry and can't hold back myself anymore.
## Introduction Oro
At Banovo (my current employer), we use the [OroPlatform](http://www.orocrm.com/oro-platform) from the OroCRM Team. We build our own CRM on top of the `platform-application`, since the `crm-application` was much too focused on B2B for our purpose (this changed by time).
We are very happy with this decision, because we have a clean [Symfony](https://symfony.com/) stack with well known bundles and a great community. We benefit from the good documentations of Doctrine, Symfony, FriendsOfSymfony, etc.
All in all, the Oro team made some good choices and coded themself a nice product, where you do not need to think about the basics in a backoffice system (e.g. grid management).
## But there is more than code!
Talking about the code quality is important, that is what everybody always understands and that is where the Oro team did a great job. But when it comes to "the other things" it gets controversial. Think about licensing, community and the company structure.
### License
The license structure is kind of ordinary: OpenSource ([MIT](https://github.com/orocrm/platform/blob/master/LICENSE)) for users with a special [license for contributors](http://www.orocrm.com/contributor-license-agreement). The reasons for the second license are  published in a [blog post](http://www.orocrm.com/blog/news/why-oro-implemented-a-new-developer-contribution-process).
### Community
The community is treated like (I'm sorry) shit. The Oro team seems to adapt best practice from the last century. No transparency, no accommodation, no communication. Hey guys, it's an open source software and it's not "sink or swim". The Oro team is the first who profit from contributions.
#### Examples
##### Contributor License Agreement (CLA)
On December 22 2015, all pull request at Github got [commented](https://github.com/orocrm/platform/pull/369#issuecomment-166718262) by a bot which says, you have to sign a new license for your contribution. It was very surprising for me and I bet for many [others](https://github.com/orocrm/platform/pull/233#issuecomment-166770463) too, as there was no sign that this is going to happen.
The [blog post](http://www.orocrm.com/blog/news/why-oro-implemented-a-new-developer-contribution-process) which enlightens us, was published after my [forum post](http://www.orocrm.com/forums/topic/contribution-license-agreement-cla).
The question is: Why not prepare your users for this step? Why not communicate *before*?
##### Late reaction
I started a topic in the [forums](http://www.orocrm.com/forums/topic/bad-community-treatment) again stating that the treatment of the community is very bad. Especially the Oro team's reaction on pull requests or issues are very slow.
Some random examples (there might be worse):
[#348](https://github.com/orocrm/platform/pull/348): Created 16 Nov 2015, commented on 23 Dec 2015 (**37 days**)
[#230](https://github.com/orocrm/platform/pull/230): Created 19 Feb 2015, commented on 18 May 2015 (**88 days**)
[##253](https://github.com/orocrm/platform/issues/253): Created 22 Apr 2015, commented on 5 Jun 2015 (**44 days**)
The question is: Why open channels you don't have time to listen to?
##### The crazy one
This one drives me crazy! Community treatment in a nutshell:
I found an issue in 18.12.2015 which made me crazy. Our continuous integration server hasn't been working for weeks at that time.
And important for the oro team: It was a bug with which you can't install oro anymore when you use a different language to `en`.
Timeline:
Created the [PR](https://github.com/orocrm/platform/pull/369) for the fix: 18 Dec 2015 (**61 days ago**)
21 Dec 2015: Comment by oro team (nice! my declines are of use) (**59 days ago**)
19 Jan 2016: Merge to master (**29 days ago**)
*Hm quite slow, but ok! But why in master? It's for 1.9 release and I need it for the current **stable** 1.8.2*
09 Feb 2016: Created the [PR](https://github.com/orocrm/platform/pull/392) for 1.8 release, because 1.8 still has the bug (**8 days ago**)
09 Feb 2016: Commented by oro team: "Merge" (**8 days ago**)
*no release*
12 Feb 2016: Commented by me: "When is release?" (**5 days ago**)
12 Feb 2016: Commented by oro team: "Monday" (**5 days ago**)
*After 56 days waiting with a bug in stable 1.8 I get my release... Nice hu?*
15 Feb 2016: Release by oro team: 1.9.0 new stable (**2 days ago**)
*No 1.8.3? Why?*
16 Feb 2016: Commented by me: "You still release 1.8.3?" (**1 day ago**)
16 Feb 2016: Commented by oro team (**1  day ago**)
> @sbani, we are not going to release 1.8.3 community version as 1.9.0 already released and includes this bug fix, we do bug fix releases for enterprise edition only.
All bug fix contribution to maintenance brunches could be used by changing version dependency to "version-dev" (1.8.x-dev in this case). We'll update our contribution guide shortly to make this clear

Conclusion:
After 61 days and a valid pull request which fixes a bug in a stable version, the oro team thinks I don't deserve the bug fix. An upgrade to 1.9 means minimum one day of work and refactoring. This also means there has been knowingly a bug in a stable version for more than two month with a ready-to-go fix and the oro team doesn't give a shit.

Thank you oro team for not being user friendly. Thank you oro team for down prioritize my bug although it can hit every non english user.
##### More
Sure, there is even more and there are many more examples.
- What's your "build bot" building?
- Which setup do you use for continuous integration? (You obviously don't take a look at travis)
- ...
## Solutions
Please oro team do not downrate your code by loosing the community. You have to work with the community and you have to invest the time, money and love. Your product is for companies only, so you will see companies working on your product too. This means full time devs trying to improve your (and their) product for free!

**Communication is the key! OpenSource means responsibility**

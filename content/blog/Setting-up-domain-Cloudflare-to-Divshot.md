---
title: Setting up Cloudflare and Divshot
date: "2015-06-05T23:09:13-05:00"
tags:
  - Cloudflare
  - Divshot
categories:
  - Tutorials
---

**Update**:
Divshot is no longer available. I, myself upload my html code to Google Cloud Storage. [Here is the my tutorial about how to setup deployment]({{< relref "/blog/Deploy-to-Google-Cloud-Storage-GCS-with-wercker.md" >}}).

If you want to use Cloudflare's DNS for your [Divshot setup]({{< relref "/blog/divshot-wercker-hexo-deploy.md" >}}) and you want to **point your root Damain to your app**, you need to follow these steps.

In the [Divshot Docs about Domains](http://docs.divshot.com/guides/domains/registrars) they say:
> Just point a CNAME record to `your-app.divshot.io`

## Why Divshot
  - Free static site hosting
  - Free tools (for deploy, for redirects, ...)
  - Multiple environments
  - Your own Domain

## Why Cloudflare
  - For Free
  - Fast DNS
  - Fast CDN
  - Optimization
  - Security

## What to do
  - Pointing `your-domain.example` to `your-app.divshot.io`
  - Pointing `www.your-domain.example` to `your-domain.example`
  - Change to Cloudflare's Nameserver at registrar

### Add Domain to Divshot
You find the Divshot domain settings in the settings of your App.
Here is the [Divshot Guide](http://docs.divshot.com/guides/domains).

### Register at Cloudflare
Go to [Cloudflare](https://www.cloudflare.com) and register.

During registration you will be asked to add a domain and setup DNS.

Here are my settings:
![Cloudflare DNS settings](/images/cloudflare-dns-settings.jpg)

#### CNAME
I added two CNAME entries. One for the root domain sbani.net and one for www.sbani.net.
The root domain points to Divshot as described in the Divshot Docs.
The www. domain is added to use the Redirect to the root domain.

### MX & A
The A record points to the IP of my mail server. It was imported from the DNS record before and is needed to use the mail server.
The MX record has the same purpose and point- to the mail A record.

### Add Redirect
Normally you would do it on the server side. But you have no possibility to redirect from/to (Sub)Domains with Divshot. That's why you need Cloudflare Page Rules to add Domain redirects.

Tipp: You can add URI redirects with Divshot CLI. No need to use Cloudflare. [See Divshot Docs about routing](http://docs.divshot.com/guides/routing).

When you are logged in to Cloudflare, you go to *Page Rules*.
Now you must *Add new rule*.

URL Pattern: `http://www.your-domain.example/*`
Forwarding `On`
Destination URL: `http://your-domain.example/$1`
Click Add rule to save it


### Finished
When you are done with Cloudflare, you can activate the Cloudflare Nameserver at your domain registrar. This can take some time (up to 24 hours!).

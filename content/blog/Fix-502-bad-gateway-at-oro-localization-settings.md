---
title: HowTo fix 502 bad gateway at oro localization settings
date: "2015-09-29T11:56:00-05:00"
categories:
  - Tutorials
tags:
  - OroCRM
---

![502 Bad Gateway](http://3.bp.blogspot.com/-5mnZ7OZIbPM/T0phqY2X2rI/AAAAAAAABSc/wxskyoZzTpI/s400/502-bad-gateway-crop.png)

This a short tutorial for people facing a `502 Bad Gateway` error in **OroCRM** or **Oro Platform** in the localization settings.

## Full error
```
upstream sent too big header while reading response header from upstream
```

### Problem description
This problem (mostly) occures when you are using a translation and activated it, but it can occure everywhere in the appliction,
even without activated translation.

#### Header too big
If you are using nginx (like I do), the headers are limited to a specific size. Even you you raised the size, headers are too big.
That's what nginx says.

##### How to see which headers and why
Debugging the headers on the nginx side is quite difficult. That's why I started the built in **Symfony** server.
```bash
php app/console server:start
```
Now you can access the output without the nginx limits.

When opening the site in browser (this should work now) and opening the network monitor in your browser, you can see the the header `X-ChromePhp-Data:` which has a very big encrypted data.

#### ChromePHP
The **ChromePHP** extension is made for debugging and the PHP extension adds the monolog logs to it. And this causes the problem. At the localization page, translation state is checked and it adds all the missing translations to the header. That's why it's getting so big.

## Solution

### a) Disable ChromePHP
For sure, an easy solution is to disable ChromePHP.
You do this by commenting/removing the following lines in `app/config/config_dev.yml`
```yaml
#        firephp:
#            type:  firephp
#            level: info
#        chromephp:
#            type:  chromephp
#            level: info
```

### b) Raise nginx upstream header size
Nginx is causing the error. But you can allow bigger headers in nginx config.

To do this, edit (or add) the lines in `nginx.conf`
```
fastcgi_buffers 16 16k;
fastcgi_buffer_size 32k;
```
In this case the header size is quite low. You probably need other values. Please try it yourself.

## Further reading
- I added [an issue](https://github.com/orocrm/platform/issues/321) at the OroCRM issue tracker.
- Nginx docs about [ngx_http_fastcgi_module](http://nginx.org/en/docs/http/ngx_http_fastcgi_module.html)

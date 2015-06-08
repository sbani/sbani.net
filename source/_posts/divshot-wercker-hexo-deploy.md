title: Running Divshot, Wercker and Hexo for automatic deployment
date: 2015-06-03 08:57:42
tags: Deploy, Wercker, Hexo
categories:
  - Tutorials
---

This blog is powered by **Hexo**, hosted by **Divshot** and deployed by **Wercker**. I'll give you an overview how to implement the static site generator with a Continuous Delivery setup.

> Wow, that's geek. Why should I do this?

You create a page with Hexo, push it to the repo and see how the tools deploy for you. No more ftp or command-line deployment.

And the best:
**Hosting, and Continuous Delivery for free**
(Except your Domain)

## Hexo
At first, the we need an application to generate our static files. I'm using [Hexo](http://hexo.io/). It looked good to me because I wanted a NodeJS or Go stack and it had collected some Github stars.

> But where is the trick?

No trick! Just use it as is! If you come from Wordpress and need to Migrate, follow the [Hexo Docs](http://hexo.io/docs/migration.html). Choose a theme or create an own and that's it.

I personally added some and removed some plugins. Please see my [_config.yml](https://github.com/sbani/sbani.net/blob/master/_config.yml) and my [packages.json](https://github.com/sbani/sbani.net/blob/master/package.json). But again, there is no need to enable or disable plugins.

Create your app:
```shell
npm install hexo-cli -g
hexo init blog
cd blog
npm install
hexo server
```

### Codio Extra
When running Hexo on Codio via `hexo server` for the first time, with the default settings, my Browser always downloaded the Posts.

That's why I use [this config](https://github.com/sbani/sbani.net/blob/master/_config.yml#L17) for permalinks:
```yaml
permalink: :category/:title.html
```

## Divshot
![Divshot](/images/divshot-staging.jpg)
### About
[Divshot](https://divshot.com/) is a great static site hoster for devs. You have 100MB storage and 1GB traffic for free. You can deploy to several environments and (except Github Pages) you can create redirects vhich is very helpful when it comes to migration.

### In general
 - [Create application](http://docs.divshot.io/guides/getting-started)
 - [Add your domain](http://docs.divshot.io/guides/domains)

### Step by step
First: Stay in your hexo app's root folder (`cd blog`).

You can create an app through cli. You need the cli tool for your auth key. So don't be shy.
```shell
npm install -g divshot-cli
divshot login
divshot init
divshot auth:token
```
Extra: If you use [Codio](https://codio.com/) as your platform `divshot login` [won't work](https://github.com/divshot/divshot-cli/pull/165). 
Save the auth token. You need in later.

> Wait... I'm confused... So many questions from divshot during init

True story, but you can take a look at my config for more info (even if we both know you should read there f* manual).
```json
{
  "name": "sbani-blog",
  "root": "public/",
  "clean_urls": false,
  "error_page": "error.html"
}
```
The name of your app is the subdomain at divshot. For me it's sbani-blog.divshot.io.
Root is our public dir where the generated files are. Hexo default btw.
From divshot:
> The clean urls option lets you decide whether or not to drop the .html extension from the files on your site. 


Quite simple. If you look at the Divshot Docs or in my [divshot.json](https://github.com/sbani/sbani.net/blob/master/divshot.json) you can find more things to config. Eg: My redirects.

## Wercker
Setting up [Wercker](http://wercker.com/) was the tricky part here. Add a [wercker.yml](https://github.com/sbani/sbani.net/blob/master/wercker.yml) to the app root.
![Deploy example](/images/wercker-deploy.jpg)
### wercker.yml
Here is mine:
```yaml
box: wercker/nodejs
build:
  steps:
    - script:
        name: echo nodejs information
        code: |
          echo "node version $(node -v) running"
          echo "npm version $(npm -v) running"
    - npm-install
    - script:
        name: hexo generate
        code: ./node_modules/.bin/hexo generate
deploy:
  steps:
    - script:
        name: deploy to divshot.io
        code: |
          sudo npm install -g divshot-cli
          divshot --version
          divshot push $WERCKER_DEPLOYTARGET_NAME --token $DIVSHOT_TOKEN
```

#### box
```yaml
box: wercker/nodejs
```
You need nodejs. You can also use Docker images from the hub but I've never used it.

#### build
Just debugging: Add this to see the info for the case of failure.
```yaml
    - script:
        name: echo nodejs information
        code: |
          echo "node version $(node -v) running"
          echo "npm version $(npm -v) running"
```
Install all dependencies with npm. Wercker's `npm install` tool.
```yaml
    - npm-install
```
Generate the HTML files with hexo.
```yaml
    - script:
        name: hexo generate
        code: ./node_modules/.bin/hexo generate
```
#### deploy
Now we handle the deploy with Wercker to Divshot. 
```yaml
deploy:
  steps:
    - script:
        name: deploy to divshot.io
        code: |
          sudo npm install -g divshot-cli
          divshot --version
          divshot push $WERCKER_DEPLOYTARGET_NAME --token $DIVSHOT_TOKEN
```
(From [Divshot Docs](http://docs.divshot.com/integrations/wercker))

### Wercker setup

 1. Go to your wercker app.
 2. Go to settings
 3. Scroll to *DEPLOY TARGETS*

#### Add target
There is a [doc from Divshot](http://docs.divshot.com/integrations/wercker) too.

![Choose custom deploy](/images/wercker-custom-deploy.jpg)
Choose *Custom Deploy* and fill the form.

![](/images/wercker-deploy-target.jpg)
Add the config variable `DIVSHOT_TOKEN` with your auth key from above.
Choose the environment. It needs to be `development`, `staging`, or `production`

I personally use staging and production *Auto deploy* because I use two branches in my git repo which represent the Divshot environments.

| Branch  | Divshot Environment |
|---------|---------------------|
| master  | Production          |
| develop | Staging             |

If I change something, I'm working on `develop` and commit/push here. I open staging from divshot panel and see if it looks good. When I'm done, I merge `master` with `develop` (with `--no-ff` flag. See my [favorite Github guide](https://github.com/agis-/git-style-guide))

**My workflow**
```shell
git checkout develop
# Do sth
git add -A
git commit
git push origin HEAD
```
Wercker starts deploying to Divshot staging.
Test staging
```shell
git checkout master
git merge --no-ff develop
git push origin HEAD
```
Wercker starts deploying to Divshot production.

## Done?
Yes, we are done here. You should find your app on Divshot.

## Any questions?
> HERE! Why are you not using (or writing) a hexo plugin? You can deploy with hexo!

Because I wanted to have more possibilities with auto deploy (eg. adding gulp tasks for less css generation).
And: If you use a public repo such as Github, in my case, you can't share private keys or logins.

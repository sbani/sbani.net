+++
date = "2017-01-27T19:12:54+01:00"
title = "Website v3: Migrating from Hexo to Hugo"
slug = "migrateing-hexo-to-hugo-website-v3"
+++

I not only obviously updated my website’s style, but also updated the backend.

# Migrating from hexo to hugo
Migrating the hexo blog to [hugo](http://gohugo.io/) with the help of [ahmed el-helw’s blog post](http://helw.net/2015/07/19/migrating-to-hugo-from-hexo/).
Following the steps in the tutorial, I further needed to add some `slug` meta information to some posts, because of the special chars in the german language.
**But the steps are simple and good to follow!**

The last step was my [wercker](https://wercker.com/) deployment to Google Cloud Storage (gcs). I used a nodejs docker container and one with the google sdk.
You can look into my [wercker.yml](https://github.com/sbani/sbani.net/blob/master/wercker.yml) to see what happens here.

## For the benchmark freaks

### Hexo build

NPM-Install: 10 seconds

hexo generate: 5 seconds

All: 26 seconds

### Hugo build

Hugo build: 2 seconds

All: 10 seconds

### Conclusion

Go rocks! One of the best things about the very nice tool hugo is that it's a simple to use binary file. That's what makes it so fast and easy to use for **Continuous Deployment**.

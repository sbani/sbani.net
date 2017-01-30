---
title: Deploy to Google Cloud Storage (GCS) with wercker
date: "2016-04-28T05:55:03-05:00"
categories:
    - Tutorials
tags:
    - Wercker
    - Continuous Integration
---

## Wercker and the deploy steps

There are several *deploy steps* for the [wercker](http://wercker.com/) CI service, but none of them worked for me, because they seemed to be outdated when dealing with authorization. But due to the flexibility of wercker to choose whatever [docker container](http://devcenter.wercker.com/docs/containers/index.html) you want, I found a simple and straight forward solution.

## tl;dr: The solution

I assume you use a static site generator like hexo or hugo. You can find an example wercker *build* step in my [hexo tutorial]({{< relref "blog/divshot-wercker-hexo-deploy.md#wercker-yml" >}}) (ignore the deploy part).

### Requirements

- A Google Cloud account
- A service account key (json file)
- A Google Cloud Storage Bucket

### Target Environment Variables

**GOOGLE_JSON**: The *Service account key* json file downloaded from google **WITHOUT new lines `\n`**
**GOOGLE_ACCOUNT**: The email you find in the *Service account key* json file
**GOOGLE_BUCKET**: Your bucket's name

### Deploy Step in wercker.yml

```
deploy:
  box:
    id: google/cloud-sdk
    tag: latest
  steps:
    - script:
      name: activate service account
      code: |
        echo $GOOGLE_JSON >> secret.json
        CLOUDSDK_PYTHON_SITEPACKAGES=1 gcloud auth activate-service-account $GOOGLE_ACCOUNT --key-file secret.json
    - script:
      name: upload to gs
      code: |
	    # Sync
        gsutil -m rsync -r -d public gs://$GOOGLE_BUCKET
        # Create gz files
        gsutil -m cp -r -z html,css,js,xml,txt,json,map,svg public/* gs://$GOOGLE_BUCKET
```

## My Way to Find The Solution
### 1. Docker and How to Fix Dependency Problems
At first I wanted to run all `gcloud` or `gsutil` [installation](https://cloud.google.com/storage/docs/gsutil_install#sdk-install) like I do it on my Mac (`gcloud auth`), but I had to deal with some [dependency problems](https://cloud.google.com/sdk/crypto) using the `python:latest` container for the wercker deploy.
But as a heavy user of wercker, I know that I can use whatever container I want, so I searched the docker hub for a good image and found: [google/cloud-sdk](https://hub.docker.com/r/google/cloud-sdk/) created by google itself. The dependency problems are gone!

### 2. Test it locally

I started to test it locally. So I started the docker container
```
# Pull and start
docker run -d --name gcloud-config google/cloud-sdk
# Prepare all keys
docker exec -it gcloud-config bash
# In docker paste the json file data to env
export GOOGLE_JSON='<json_filedata>' # Important here: plain copy paste. no changes!
export GOOGLE_ACCOUNT=<jsons_account>
export GOOGLE_BUCKET=<bucket>
# Run auth
echo $GOOGLE_JSON >> secret.json
CLOUDSDK_PYTHON_SITEPACKAGES=1 gcloud auth activate-service-account $GOOGLE_ACCOUNT --key-file secret.json
# Works fine: Sync now
gsutil -m rsync -r -d public gs://$GOOGLE_BUCKET
gsutil -m cp -r -z html,css,js,xml,txt,json,map,svg public/* gs://$GOOGLE_BUCKET
```
Wow. Works like a charm. Easy and without any dependency problems.

### Fix it in wercker

If you read headlines you already know that you can't copy-paste here. Because I did it, and it failed. I copied the env vars and created a wercker.yml with the steps.
The error is not helpful:

>ERROR: gcloud crashed (Error): []
>
> If you would like to report this issue, please run the following command:
>  gcloud feedback

After several retries, I remembered, that you need to be careful with env vars and newlines. So I removed them from the wercker target vars and a green success button!

## Important Info

- Remove `\n` from env vars (in wercker): `cat secret.json | sed ':a;N;$!ba;s/\n/ /g'`
- Always try to use docker as your *package/dependency manager*

### Useful gsutil stuff

I use the **Google Cloud Storage as my static site hoster** and therefor need to make the bucket content public reabadle:

```
# Make existent files public
gsutil -m acl set -R -a public-read gs://<bucket>
# Make public by default
gsutil setdefacl public-read gs://<bucket>
# Set index and error site
gsutil web set -m index.html -e 404.html gs://<bucket>
```

You take a look in this [websites repo](https://github.com/sbani/sbani.net) for a production example.

Further reading:
- [Google Docs about static website](https://cloud.google.com/storage/docs/static-website)
- [Basic Tutorial by Maarten-Jan Kallen](http://www.maartenjan.org/artikelen/2013-07-02-hosting-static-websites-on-google-cloud-storage.html)

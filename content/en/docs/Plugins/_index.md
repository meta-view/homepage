---
title: "Plugins"
linkTitle: "Plugins"
weight: 3
description: >
  Plugins are the logic of the application.
---

{{% pageinfo %}}
Plugins will be the logic of the application. The things that hold everything together.  
We already have a broad definition of a plugin API. There is also an [example for Twitter](https://github.com/meta-view/data-import/tree/master/plugins/twitter.com), that should work as a proofing ground.
{{% /pageinfo %}}

## What is a Plugin?

A Plugin should run in a sandbox.  
Every Plugin runs in its own JS-VM (based on [Otto](https://github.com/robertkrimen/otto)).
There are some functions injected into the VM Context to help the plugin itself to deal with the surroundings (see _Plugin API_)

For now the plugin has to fulfill three different use-cases:

* `detector.js` - detects if a payload can be handled by that specific plugin. The result is a percentage value (0.0 - 100.00).
* `importer.js` - the importer handles the conversion of the plain payload data into a normalized datastructure for the Database - for now that is (id,crated,update,json).
* `presenter.js` - the presenter will display a specific entry or a list of entries in a given context (list->detail, graph).

As you can also see, the default plugin `detector.js` is able to access and identify files and folder from within the uploaded directory:

```bash
loading 64 files
ContentType of README.txt is text/plain; charset=utf-8
ContentType of account-creation-ip.js is application/octet-stream
…
ContentType of tweet.js is text/plain; charset=utf-8
…
ContentType of tweet_media/368453822730862593-BR0CzLSCAAAfv1l.png is image/png
ContentType of tweet_media/878731487729811457-DBTIKevUQAAURjC.jpg is image/jpeg
ContentType of tweet_media/899359035618623489-DHr-Q58WsAILnJZ.jpg is image/jpeg
ContentType of tweet_media/949981183256989697-DS8CkUzV4AA8fWh.jpg is image/jpeg
ContentType of verified.js is application/octet-stream
```

## Plugin API

At the moment the plugin JS API has two methods on hand:  

* `getFiles()` - a method that lists all files rooted in the payload folder.
* `getContentType(…)` - a method to determine the content type of the given file.

You can see an example uses in the file [detector.js](plugins/twitter.com/detector.js) of the twitter plugin.


---
title: "Roadmap"
linkTitle: "Roadmap"
weight: 1
description: >
  The Roadmap of this project.
---

{{% pageinfo %}}
This project tries to cover a wide area. We have a vision how things should work in the near future, but the how and when is somehow vague.
Hence we decided to go with the following roadmap approach.
{{% /pageinfo %}}

## Development

We are using the Dual-Track product development method to achive the different project goals.
Our long term view looks like this:

![Development-Roadmap](Roadmap1.svg)

We are using the Discovery track to identify the technologies, we can use to implement the spefic details in the devlivery track.   
While the Code in the delivery track will be continously extended and updates, every piece of code in the discovery track will be abandoned after the specific implementation goal is reach.

## Project Setup

<div style="height: 24px; background-color:#ff1313"></div>

* Continous build and distribution for the development binary is up and running
* This Homepage is based on static files, the deployment happens automatically, after a MR is accepted.

Since private data is a topic that should concern everyone, our goal is to enable every human to contribute to this project. Everything will be open-sourced, every discussion will be transparent. 
(e.g. if you want to fix and error or update a specific page, you can just click on the link at the bottom and commit a MR).

Although there are still some formal parts missing:

* We have to setup some guidelines for a communtity.
* We need to have an contrinubors agreement in places, that allows the project itself to work with the contributed code.

## Data Import

<div style="height: 24px; background-color:#18ff46"></div>

We are here right now :-).
The current nightly build is able to import a Twitter Snapshot into its Database and display different data types (e.g. Images, Messages).

Currently we are working on updates via the twitter API.

The last task is to implement the same plugins for a different data provider (e.g. Facebook), to show, that our plugin approach is viable.

We are also looking into a more sophisticated database, since our current implementation based on SQLite and JSON already shows some limitations.

## Data Export

<div style="height: 24px; background-color:#fb1eff"></div>

After we have reached the goal to have at least data of two different providers imported and displayed in our application, we want to publish data to different providers.

At the end, import, export, publishing and unpublishing of your data should be possible via one application.

## Data Exchange

<div style="height: 24px; background-color:#ff1313"></div>

The final goal is, to make the current data providers optional.
We would like to have two instances of our application exchange data directly.

We already did some tests using [libp2p](https://libp2p.io), but to make this finally work, we also have to implement concepts for contacts, users and Access Models.

## Cross-cutting topics

Besides this feature roadmap, there are some other tasks that need to be done during the development:

### Platform

As you might already know, the application itself is only delivered as a docker image.  
The reason for that, is the very easy function to update your location version.  
The final plan is - of course - to create Desktop Grade Applications for the 3 common platforms Windows, Mac and Linux.  

This will be done, if a working update solution was implemented.

In theory, most business code can be also implemented as a Library and then used as a core for Mobile Applications for Android and iOS. The Feature Set might differ on these Platforms, since loading specific code from external sources is not allows on the iOS App-Store.

### Infrastructure

Our Plugins are JavaScript based. At the end, we want to have a vivid ecosystem of different plugin implementations. For that we need to have additional infrastructure in place that is able to:

* search and publish new plugins
* distribute plugin updates
* verify installed plugin (based on checksums and signatures)

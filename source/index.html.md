---
title: Cortex API Documentation
subtitle: Cortex API

<!-- language_tabs: # must be one of https://git.io/vQNgJ
  - json--raw: Raw
  - shell: Shell
  - javascript: Javascript
  - python: Python
  - matlab: Matlab
  - java: Java
  - c: C/C++
  - csharp: C#/Unity
  - swift: Swift -->

<!-- toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a> -->

includes:
  - concepts
  - methods.md.erb
  - datatypes
  - workflow
  - _errors

search: true
---


# Introduction

## Welcome

<div class="fullwidth">

Welcome to the Cortex API documentation!

Cortex is a new and versatile API for interacting with Emotiv products, including the Insight, Epoc and Epoc+. The Cortex API is built on JSON and WebSockets, making it easy to access from a variety of programming languages and platforms. You can use Cortex to create games and apps, record data for experiments and more.

This documentation is split into multiple sections. This introductory section describes how to get set up with Cortex. [Concepts](#concepts) provides an overview of the API and how to use it. The [Methods](#methods) and [Data types](#data-types) sections provide a detailed reference with examples for each part of the API.

If you prefer to start with fully-worked examples, you can also find pre-built starter projects for various languages in our [Cortex example repository](https://github.com/Emotiv/cortex-example).

</div>

## Installing Cortex

<div class="fullwidth">

To install Cortex, get it from the [Cortex download page](https://www.emotiv.com/developer/).

Installer include Cortex UI application and Cortex Service. Cortex Service will automatic start after you finish install.

To check Cortex Service is running you try to open Cortex UI. If you can enter to Cortex UI, Cortex Service working well.

</div>

<!-- ## Using the example code

<blockquote class="lang-specific json--raw">
  <p>
    Examples are currently set to: <b>Raw</b>
  </p>
  <p>
    Raw means the examples won't be specific to any particular programming language. You'll just see the JSON data being used to communicate with Cortex.
  </p>
  <p>
    If you want to try these examples out, it may be easiest to use a browser extension like [Smart Websocket Client](https://chrome.google.com/webstore/detail/smart-websocket-client/omalebghpgejjiaoknljcfmglgbpocdp) for Chrome or [Simple Websocket Client](https://addons.mozilla.org/en-US/firefox/addon/simple-websocket-client/) for Firefox and connect to the address `wss://emotivcortex.com:54321`.
  </p>
</blockquote>

<blockquote class="lang-specific shell">
  <p>
    Examples are currently set to: <b>Shell</b>
  </p>
  <p>
    To access Cortex from the shell, we use the <code>wscat2</code> command-line tool. To use it, install <a href='https://nodejs.org'>NodeJS</a> if you don't already have it.
  </p>
  <p>
    Then run: <code>npm install -g wscat2</code>
  </p>
</blockquote>

<blockquote class="lang-specific javascript">
  <p>
    Examples are currently set to: <b>Javascript</b>
  </p>
  <p>
    If you're using the browser, no setup is necessary – we'll use the browser's inbuilt WebSocket support.
  </p>
</blockquote>

```javascript
  var ws = new WebSocket("wss://emotivcortex.com:54321");

  ws.onopen = function() { console.log('Websocket connected'); };
  ws.onclose = function() { console.log('Websocket disconnected'); };

  ws.onmessage = function(data) {
    console.log('>', data);
  };
```

<blockquote class="lang-specific javascript">
  <p>
    In NodeJS, we use the <code>ws</code> library. To install it, run: <code>npm install --save ws</code>.
  </p>
</blockquote>

```javascript
  const WebSocket = require('ws');

  const ws = new WebSocket('wss://emotivcortex.com:54321');

  ws.on('open', () => console.log('Websocket connected'));
  ws.on('close', () => console.log('Websocket disconnected'));

  ws.on('message', (data) => {
    console.log('>', data);
  });
```


<blockquote class="lang-specific python">
  <p>
    Examples are currently set to: <b>Python</b>
  </p>
</blockquote>

<blockquote class="lang-specific matlab">
  <p>
    Examples are currently set to: <b>Matlab</b>
  </p>
</blockquote>

<blockquote class="lang-specific java">
  <p>
    Examples are currently set to: <b>Java</b>
  </p>
</blockquote>

<blockquote class="lang-specific c">
  <p>
    Examples are currently set to: <b>C/C++</b>
  </p>
</blockquote>

<blockquote class="lang-specific csharp">
  <p>
    Examples are currently set to: <b>C#/Unity</b>
  </p>
</blockquote>

<blockquote class="lang-specific swift">
  <p>
    Examples are currently set to: <b>Swift</b>
  </p>
</blockquote> -->



<!-- ```python
  # Python example
  import lol
  if True:
    print("yeah!")
```

```matlab
  % Matlab example
```

```java
  /* Java example */
```

```c
  // C example
```

```csharp
  // C# example
```

```swift
  // Swift example
``` -->


<!-- The examples in this documentation are available in a variety of different languages, you can click the tabs on the bottom-right to pick one.

In some cases we expect that you're using particular JSON and WebSocket libraries. Instructions on how to install and use them for your chosen language are on the right. -->


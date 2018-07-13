
# Concepts

<div class="fullwidth">

This is a general overview of the concepts in the API.

</div>

## Protocol

<div class="fullwidth">

The Cortex protocol is made of 3 building blocks: WebSockets, JSON, and JSON-RPC. WebSockets provide a real-time connection to the underlying Cortex service, designed to be easy to use in both desktop and web-based applications. JSON is a widely supported format used by Cortex to send and receive data, and JSON-RPC is a standard way of using JSON to make requests and get back the results.

If you're not familiar with WebSockets or JSON, it may be helpful to read [An Introduction to WebSockets](http://blog.teamtreehouse.com/an-introduction-to-websockets) and [An Introduction to JSON](https://www.digitalocean.com/community/tutorials/an-introduction-to-json) before going any further.

</div>

### WebSockets

<div class="fullwidth">

The Cortex service listens on port 54321. Depending on the WebSocket client you're using, this means you can connect to it using the url `wss://emotivcortex.com:54321`.

</div>

### JSON-RPC

> Request

```json
{
  "jsonrpc": "2.0",
  "method": "hello",
  "params": {
    "hello": "world"
  },
  "id": 1
}
```

> Response (success)

```json
{
  "jsonrpc": "2.0",
  "result": "hello, world!",
  "id": 1
}

```

> Response (error)

```json
{
  "jsonrpc": "2.0",
  "error": {
    "code": -9999,
    "message": "Don't know how to say hello"
  }
  "id": 1
}
```

JSON-RPC builds on top of JSON by adding a few standard keys to track requests. An example request and response are shown to the right. The `jsonrpc` key is always `2.0`, indicating the protocol version. `method` indicates which of the [API Methods](#methods) you're trying to call, and `params` contains the keys and values you want to use for that method. To find the parameters for a given method, you can look it up in the [Method reference](#methods).

You'll get either a response with a `result`, or an `error` if the request was unsuccessful. `id` is a parameter used to track the association between requests and responses. If you send `1`, you'll get `1` back. If you send `"hello"`, you'll get `"hello"` back.
Currently, the request in Cortex is synchronous. We are planning change to support asynchronous in next version.

The exception to this is streams of data that you receive from the headset, which do not follow a request-response pattern and do not follow JSON-RPC. They are described below, under [Subscriptions](#subscriptions).

## Authorization

<div class="fullwidth">

By default, You can work with Cortex without client id/ secret. But if you want to access Raw EEG data and high-resolution performance metrics, you have to call the [`authorize` method](#authorize) with a client ID and secret. These are specific to your application and used for security and to prevent abuse. You can request a client ID and secret [on your "my account" page](https://www.emotiv.com/my-account/cortex-apps).

</div>

### User accounts and licensing

<div class="fullwidth">

There are different levels of Cortex access depending on the user's license. Most features are available for free, however a subscription is required for professional and research features like Raw EEG data and high-resolution performance metrics. For more information, see [the licensing page](https://www.emotiv.com/developer).

If your application will use these features, you should provide the username and password of the appropriately licensed user when you call the `authorize` method.

`debit` parameter is amount of the sessions which user request to work on the local machine. this control how much quota an application is allowed to use.

</div>

### Auth token

<div class="fullwidth">

After authorizing, you will be provided with an authorization token to use in subsequent requests. This token is valid for 48 hours from when it's issued. You can receive a new token by calling `authorize` again, or calling `generateNewToken` using the previous token to refresh it. Details on how to do this are in the [`authorize` method documentation](#authorize).

</div>



## Sessions

<div class="fullwidth">

A session represents a continuous period of data collection from a headset, whether live or prerecorded. To get data from a headset, you start by [creating a session](#createSession), put it into the appropriate state, then [subscribe](#subscribe) to receive the results in real time. The data available from the headset is split into various streams, described later in [Subscriptions](#subscriptions).

</div>

### Session lifecycle

<div class="fullwidth">

Every session has a `status` parameter, indicating its current state. This status can be `opened`, `activated`, or `closed`. New sessions start `opened` or `activated` and automatically become `closed` when the headset is unplugged or turned off (after a 1 minute delay if using the USB dongle).

When a session is `opened`, you only can subscribe to get: motion, mental command, facial expression, band power, device data, low-resolution performance metrics.

When a session is `activated`, depend on the license. You can subscribe to get Raw EEG or high-resolution performance metrics or both.

License | Raw EEG | Performance Metrics
------  | --------| ---------
advanced  | Yes | low-resolution
prime     | Yes | high-resolution

When a session is `closed`, no subscriptions are allowed.

Diagram:

![session_lifecycle](../images/session_lifecycle.png)

</div>

### Multiple sessions

<div class="fullwidth">

On one connection, you only can create one session with one headset. Ex: app A create session "abcd" with headset "INSIGHT-1234" . If app A want to create another session with this headset need to close session "abcd" first. But app B can create a session with headset "INSIGHT-1234". So, headset "INSIGHT-1234" has 2 session link with it. But these session are on different apps.

</div>

### Saved sessions

<div class="fullwidth">

After the session is set to "active" successfully. The data will be saved and uploaded on the Emotiv's server. The saved datas include Raw EEG data, Motion data, Performance Metrics data.  

</div>

<!-- ### Record

<div class="fullwidth">

**TODO: what is this? Can we have multiple recordings per session? If so how does that work?**

**On a session can make multiple recordings**

</div> -->



## Subscriptions

<div class="fullwidth">

To actually receive data from a session, you have to subscribe to it. This is done using the [`subscribe`](#subscribe) method. Along with the session you want to subscribe to, you have to specify which streams you are interested in. Each stream represents a different kind of data coming from the headset.

</div>

### Streams

<div class="fullwidth">

Each stream returns a series of events, with relevant data in columns depending on the type of event. You can find the columns for each event under [Data types](#data-types).

Stream | Description
------ | -----------
[mot](#mot-event) | Motion data from the accelerometer/gyroscope
[eeg](#eeg-event) | Raw EEG data (see note in [User accounts and licensing](#user-accounts-and-licensing))
[com](#com-event) | Mental Command Event
[fac](#fac-event) | Facial Expression Event
[met](#met-event) | Performance Metrics data
[dev](#dev-event) | Device data include battery level , signal strength, and signal quality all of channel headset
[pow](#pow-event) | Band Power data
[sys](#sys-event) | System event ( for set up training )


</div>



<!-- ## Subjects

<div class="fullwidth">

**TODO: Are subjects a thing? Maybe something on metadata in general? What about Notes?**

**subjects is a field will use in the future.It's useful in case many persons use same account to record data. 
So, each person will have a subject. Note is a description for a recording**

</div> -->



## Markers

<div class="fullwidth">

Markers are reference points in the data stream, used to match external events with data in the EEG.

Markers format in EEG stream is a pair of 2 channels `IEE_MARKER` and `IEE_MARKER_HARDWARE`.

`IEE_MARKER` : Actual value of the marker inserted. If no marker trigger was detected at the particular timing sample, a value of 0 is added into the file (except from Extender, see `IEE_MARKER_HARDWARE`).
Otherwise the number associated with the marker trigger (positive number), or the byte value transmitted via the USB/COM port, will be inserted for that sample.

`IEE_MARKER_HARDWARE`: The index of device that has been used to trigger this marker. The value depends on order of devices (USB, serial, keyboard) when you use to send the marker. The first device will get an index of 1, the second will get 2, and vice versa.

Example:

Event | MARKER_HARDWARE | MARKER
------ | ----------- | ---------
1st marker from keyboard, with value 26 | 1 | 26 
No event                                | 0 | 0 
2nd marker from USB, with value 8       | 2 | 8 
3rd marker from keyboard, with value 99 | 1 | 99
4th marker from serial, with value 42   | 3 | 42
No event                                | 0 | 0
5th marker from Extender                | 1 | 0 
6th marker from USB, with value 27      | 2 | 27
7th marker from serial, with value 24   | 3 | 24


</div>

<!-- ### Configuring

<div class="fullwidth">

**TODO: What does markerConfig do?**

**that api for save user's marker config and upload to cloud server. So, on another machines user can load their config**

</div> -->

### Placing

<div class="fullwidth">

You can place a marker using the [`injectMarker`](#injectmarker) method.


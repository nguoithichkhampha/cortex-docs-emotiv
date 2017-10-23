## `injectMarker`

<div class="fullwidth">

Injects a marker into the data stream for a headset. The marker will appear in eeg event of that session.

For more information about sessions, see the [Sessions](#sessions) section in Concepts, and for a general overview of streams and subscriptions, see [Subscriptions](#subscriptions).

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token))  | Yes |Auth token
session   | string | No | session id to subscribe (If this param not set, Cortex will get first session in session list do not close)
label     | string | Yes | label name of marker
value     | json (number or string) | No | marker value
stop      | json (number or string) | No | stop value (Only use for marker recording)
port      | string | No  | marker source (if not set default value = `Software`)
time      | number | Yes | [Epoch time](https://en.wikipedia.org/wiki/Unix_time) Timestamp for marker event

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
session object | json | updated [Session object](#session-object)  

A marker is identified by `label` and `port` . If you send 2 marker events have same `label` and `port`. That mean you send same marker type in twice. Other cases, you send two different marker type. See the details in [marker concept](#markers).


When you send marker `value` is string, the marker value in eeg stream is index of this string in array `enums`. The index start from 1.

Event   | marker value | array `enums` | `IEE_MARKER` | `IEE_MARKER_HARDWARE`
------- | ------------ | ------------- | -----------  | --------------------
Send 1st marker type A | "start" | ["start"] | 1 | 1
Send 2nd marker type A | "stop"  | ["start","stop"] | 2 | 1
Send 3rd marker type B | "test"  | ["test"] | 1 | 2

</div>

### Example: String markers

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "injectMarker",
  "params": {
    "_auth": "..",
    "session": "session-1234",
    "label": "test1",
    "value": "record-1",
    "port": "USB",
    "time": 123456789
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1
  "appId": "",
  "headset": {...},
  "id": "1234",
  "license": "1ca3fd1c-4ce8-4643-8aa0-28a3255019e8",
  "logs": null,
  "markers": [
    {
      "code": 1,
      "enums": [
        "record-1"
      ],
      "events": [
        [
          "2017-06-01T15:25:00.976923+07:00",
          1
        ],
      ],
      "label": "test1",
      "port": "USB"
    }
  ],
  ...
}
```

### Example: Numeric markers

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "injectMarker",
  "params": {
    "_auth": "...",
    "session": "abcd",
    "label": "test1",
    "value": 10,
    "port": "Serial port",
    "time": 123456789
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1
  "appId": "",
  "headset": {...},
  "id": "abcd",
  "license": "1ca3fd1c-4ce8-4643-8aa0-28a3255019e8",
  "logs": null,
  "markers": [
    {
      "code": 1,
      "enums": [],
      "events": [
        [
          "2017-06-01T15:25:00.976923+07:00",
          10
        ]
      ],
      "label": "test1",
      "port": "Serial port"
    }
  ],
  ...
}
```
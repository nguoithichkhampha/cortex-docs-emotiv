# Data types

<!-- ## Auth Token

```json
{
  "_auth": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0OTA4OTUxMTYsInVzZXJuYW1lIjoiQmFzaWMiLCJ1c2VyQ2xvdWRJZCI6LTEsImxpY2Vuc2VJZCI6IiIsImxpY2Vuc2VTY29wZSI6MX0.S66hU4wnMPO8R107Y-rrUqWtAWcbRiKp9KTNwFHNDvs"
}
```

An auth token is an opaque string returned by the [`authorize`](#authorize) method. You shouldn't make any particular assumptions about its content or length. -->

## Headset Object

> Example Headset object

```json
{
  "connectedBy": "dongle",
  "dongle": "6ff",
  "firmware": "925",
  "id": "INSIGHT-59683C10",
  "label": "",
  "sensors": [],
  "settings": {
    "eegRate": 128,
    "eegRes": 14,
    "memsRate": 128,
    "memsRes": 14,
    "mode": "EPOC"
  },
  "status": "connected"
}
```

The headset object is returned by [`queryHeadsets`](#queryheadsets). It contains the following fields:

Field | Description
----- | -----------
connectedBy | One of `dongle`, `usb cable`, `bluetooth`
dongle   | Dongle version ( connect by bluetooth `dongle`=0)
firmware | Firmware version of headset
id       | Unique identifier for this headset
label    | Custom name for headset (use in the future)
sensors  | array of the channels headset (Use in the future)
status   | headset status
settings | See below


The `settings` field contains the following subfields:

Field    | Description
-----    | -----------
eegRate  | Sample rate for EEG data (in Hz, 128 or 256)
eegRes   | Resolution for EEG data (in bits, 14 or 16)
memsRate | Sample rate for movement data (in Hz, 0, 32, 64, 128)
memsRes  | Resolution for movement data (in bits, 14 or 16)
mode     | One of `EPOC`, `EPOCPLUS`

<!-- **TODO: if we have a method to change the settings, maybe some of this information should move there, and/or go in a concepts section on headset settings** -->

## Session Object

```json
{
  "appId": "",
  "headset": {
    "connectedBy": "dongle",
    "dongle": "6ff",
    "firmware": "610",
    "id": "EPOCPLUS-DEADBEEF",
    "label": "",
    "sensors": [],
    "settings": {
      "eegRate": 128,
      "eegRes": 16,
      "memsRate": 64,
      "memsRes": 16,
      "mode": "EPOCPLUS"
    },
    "status": "connected"
  },
  "id": "9ea68a11-253d-427e-8020-5bc5e4c99a69",
  "license": "1ca3fd1c-4ce8-4643-8aa0-28a3255019e8",
  "logs": {
    "recordInfos": [
      {
        "name": "demo",
        "notes": "test1",
        "recordId": "c7030f18-4b0f-4a6d-b953-a2b16edd217e",
        "sampleMarkerAFF": [
          174,
          239
        ],
        "sampleMarkerEEG": [
          11140,
          15324
        ],
        "startMarkerRecording": "2017-06-01T15:25:00.994326+07:00",
        "stopMarkerRecording": "2017-06-01T15:25:33.906495+07:00",
        "subject": "sub 2"
      }
    ]
  },
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
        [
          "2017-06-01T15:25:33.878849+07:00",
          -1
        ]
      ],
      "label": "demo",
      "port": "EmotivProRecording"
    }
  ],
  "owner": "cortextest",
  "profile": "",
  "project": "Test Cortex",
  "recording": false,
  "started": "2017-06-01T15:23:33.130641+07:00",
  "status": "closed",
  "stopped": "2017-06-01T15:25:53.315695+07:00",
  "streams": null,
  "subject": "",
  "tags": [],
  "title": "test1"
}
```

The session object is returned by [`createSession`](#createsession), [`updateSession`](#updatesession) and [`querySessions`](#querysessions). It can also be updated by updateSession. It contains the following fields:

Field     | Description
-----     | -----------
appId     | Unique ID for the application which you use to [`authorize`](#authorize)
headset   | See the [Headset](#headset-object) data type
id        | Unique ID for the session
license   | License ID link with this session
logs      | Contain recording info
markers   | Contain marker info ( set by call [`injectMarker`](#injectmarker) )
owner     | Username that created the session (`owner`= `Basic` if an anonymous user)
profile   | 
project   | User-specified project name
recording | Whether the session is currently recording
started   | [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) Timestamp for recording start
status    | Current status: `opened`, `activated` or `closed`. See [Session lifecycle](#session-lifecycle)
stopped   | [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) Timestamp for recording start
streams   | 
subject   | User-specified subject
tags      | An arrary of User-specified tag
title     | User-specified title

## Marker

```json
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
    [
      "2017-06-01T15:25:33.878849+07:00",
      -1
    ]
  ],
  "label": "demo",
  "port": "EmotivProRecording"
}
```

Field     | Description
-----     | -----------
code      | value of channel `IEE_MARKER_HARDWARE` in [`Markers`](#markers)
enums     | array of string value when set `value` in [`injectMarker`](#injectmarker) is string
events    | array of marker event
label     | label name of marker
port      | marker source ('usb','keyboard','serial port'...)

## Event

```json
{
  "mot": [...],
  "sid": "af349e3e-c72b-44c9-992c-5ee1905cfdaa",
  "time": 1283.58928052493
}
```

Events are generated in response to [`subscribe`](#subscribe) requests. Each event contains the following fields:

Field    | Description
-----    | -----------
(stream) | Key depending on stream name, value will be an array of data (see below)
sid      | ID of the session that generated this event
time (optional)     | Time since Cortex start in seconds 

<!-- **TODO: should we tell people not to rely on column order and trust what they get back from `subscribe`?**

**TODO: examples for all the other events**

**TODO: what are the other events?** -->

The order of value in array value get from response of the request [`subscribe`](#subscribe).

## `eeg` event

Depend on the headset `eeg` can have 5 channels eeg or 14 channels eeg (5 channels for Insight headset, 14 channels for EPOC and EPOC PLUS headset)

> `eeg` event of Insight headset

```json
{
  "eeg": [
    12.0,
    0.0,
    150.0,
    8203.0,
    8225.0,
    8183.0,
    6346.0,
    4439.0,
    0.0,
    0.0
  ],
  "sid": "af349e3e-c72b-44c9-992c-5ee1905cfdaa",
  "time": 1283.58928052493
}
```

Column      | Description
------      | -----------
IED_COUNTER | Counter that increments by 1 each event
IED_INTERPOLATED | 1 if this is interpolated package, otherwise = 0
IED_RAW_CQ  | Signal quality raw value
IED_AF3     | AF3 channel 
IED_T7      | T7 channel 
IED_Pz      | Pz channel 
IED_T8      | T8 channel
IED_AF4     | AF4 channel 
IED_MARKER_HARDWARE  | marker hardware value | See [`Markers`](#markers)
IED_MARKER | marker value | See [`Markers`](#markers)

## `mot` event

```json
{
  "mot": [
    2.0,
    8203.0,
    8225.0,
    8183.0,
    6346.0,
    4439.0,
    8214.0,
    8066.0,
    8058.0,
    8292.0
  ],
  "sid": "af349e3e-c72b-44c9-992c-5ee1905cfdaa",
  "time": 1283.58928052493
}
```

The unit of motion data is angular velocity, degrees per second.

Column      | Description
------      | -----------
IMD_COUNTER | Counter that increments by 1 each event
IMD_GYROX   | Gyroscope, X axis 
IMD_GYROY   | Gyroscope, Y axis 
IMD_GYROZ   | Gyroscope, Z axis 
IMD_ACCX    | Acceleration, X axis 
IMD_ACCY    | Acceleration, Y axis 
IMD_ACCZ    | Acceleration, Z axis 
IMD_MAGX    | Magnetometer, X axis 
IMD_MAGY    | Magnetometer, Y axis 
IMD_MAGZ    | Magnetometer, Z axis 

## `com` event

```json
{
  "com":[
    "push",
    0.673717498779297
  ],
  "sid":"46d18597-7034-40ab-9d6e-d617a89a24ce",
  "time":245.356536865234
}
```

Column      | Description
------      | -----------
act         | Mental command current action
pow         | Mental command current action power 

## `fac` event

```json
{
  "fac":[
    "lookD",
    "surprise",
    0.0,
    "neutral",
    0.0446911528706551
  ],
  "sid":"9a62d98f-5ad0-4bf9-8fa1-9695e2c92f2f",
  "time":383.103973388672
}
```

Column      | Description
------      | -----------
eyeAct      | eye action
uAct        | upper face action
uPow        | upper face action power
lAct        | lower face action
lPow        | lower face action power 

## `met` event

```json
{
  "met":[
    0.651354849338531,
    0.0,
    0.302940726280212,
    0.0,
    0.560504496097565,
    0.0,
    0.298657447099686
  ],
  "sid":"9a62d98f-5ad0-4bf9-8fa1-9695e2c92f2f",
  "time":195.577545166016
}
```

Column      | Description
------      | -----------
int         | interest value
str         | stress value
rel         | relaxation value
exc         | excitement value
eng         | engagement value
lex         | long term excitement value
foc         | focus value

## `dev` event

```json
{
  "dev":[
    4,
    2,
    [
      0.0,
      0.0,
      0.0,
      0.0,
      0.0
    ]
  ],
  "sid":"26cf6ed7-38fd-4125-9474-83c161d9498f",
  "time":11664.9873046875
}
```

Depend on the headset signal quality will have 5 elements or 14 elements

Column      | Description
------      | -----------
Battery     | battery level of headset
Signal      | signal strength
IEE_CHAN_AF3 | signal quality of channel AF3
IEE_CHAN_T7  | signal quality of channel T7
IEE_CHAN_Pz  | singal quality of channel Pz
IEE_CHAN_T8  | signal quality of channel T8
IEE_CHAN_AF4 | signal quality of channel AF4

## `pow` event

```json
{
  "pow":[
    64.0,
    46.0,
    66.0,
    65.0,
    71.0,
    42.0,
    57.0,
    37.0,
    369.0,
    76.0,
    22.0,
    40.0,
    17.0,
    50.0,
    41.0,
    14.0,
    10.0,
    31.0,
    26.0,
    30.0,
    20.0,
    36.0,
    26.0,
    80.0,
    40.0
  ],
  "sid":"d8834c5f-ae19-4a3c-8ce0-a861c5e05daf"
}
```

Column      | Description
------      | -----------
IED_AF3/theta    | theta value of channel AF3
IED_AF3/alpha    | alpha value of channel AF3
IED_AF3/betaL    | low-beta value of channel AF3
IED_AF3/betaH    | high-beta value of channel AF3
IED_AF3/gamma    | gamma value of channel AF3
IED_T7/theta     | theta value of channel T7
IED_T7/alpha     | alpha value of channel T7
IED_T7/betaL     | low-beta value of channel T7
IED_T7/betaH     | high-beta value of channel T7
IED_T7/gamma     | gamma value of channel Pz
IED_Pz/theta     | theta value of channel Pz
IED_Pz/alpha     | alpha value of channel Pz
IED_Pz/betaL     | low-beta value of channel Pz
IED_Pz/betaH     | high-beta value of channel Pz
IED_Pz/gamma     | gamma value of channel Pz
IED_T8/theta     | theta value of channel T8
IED_T8/alpha     | alpha value of channel T8
IED_T8/betaL     | low-beta value of channel T8
IED_T8/betaH     | high-beta value of channel T8
IED_T8/gamma     | gamma value of channel T8
IED_AF4/theta    | theta value of channel AF4
IED_AF4/alpha    | alpha value of channel AF4
IED_AF4/betaL    | low-beta value of channel AF4
IED_AF4/betaH    | high-beta value of channel AF4
IED_AF4/gamma    | gamma value of channel AF4

## `sys` event

```json
{
  "sid":"46d18597-7034-40ab-9d6e-d617a89a24ce",
  "sys":[
    "Mental Command",
    "MC_Started"
  ]
}
```

Column      | Description
------      | -----------
event       | Detection name (Mental Command or Facial Expression)
msg         | Training event of Mental Command or Facial Expression


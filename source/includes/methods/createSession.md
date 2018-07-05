## `createSession`

<div class="fullwidth">

Creates a new session. Sessions are used to manage live or pre-recorded streams of data from the headset. To use a session successfuly, it must be in the correct state.

For more information about sessions and state management, see the [Sessions](#sessions) section in Concepts.


#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
status    | string ([session state](#sessions)) | Yes | Initial session status
headset   | string | No | Headset ID link with session (if not set Cortex will link with first headset connected)
project   | string | No | Project name for session
title     | string | No | Title name for session
subject   | string | No | use in the future
experimentID | number | No | specific experiment id for the application
sensors   | array of strings | No | Set mapping channel for flex headset. The size of array should be 34 (include 2 reference channels and 32 eeg channels). 2 first elements is CMS and DRL. the last channels follow the order LA - LQ and RA - RQ. Set element is empty string if you don't set mapping for this channel. Example: don't set mapping for LA -> ["Fz","AFz","",.......]

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | object ([Session](#session-object))    | Newly created session object

</div>



### Example: Without headset ID

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "createSession",
    "params": {
      "_auth": "...",
      "status": "open"
    },
    "id": 1
  }
```

> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": {
      "client": "",
      "headset": "INSIGHT-59683C10",
      "id": "af349e3e-c72b-44c9-992c-5ee1905cfdaa",
      "license": "",
      "logs": null,
      "markers": [],
      "profile": "",
      "started": "2017-03-23T18:25:08Z",
      "status": "opened",
      "stopped": "",
      "streams": {},
      "subject": "",
      "tags": []
    }
  }
```

This creates a new session in the "opened" state.


### Example: With headset ID and status

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "createSession",
    "params": {
      "_auth": "...",
      "headset": "INSIGHT-59683C10",
      "status": "active"
    },
    "id": 1
  }
```

> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": {
      "client": "",
      "headset": "INSIGHT-59683C10",
      "id": "af349e3e-c72b-44c9-992c-5ee1905cfdaa",
      "license": "",
      "logs": null,
      "markers": [],
      "profile": "",
      "started": "2017-03-23T18:25:08Z",
      "status": "activated",
      "stopped": "",
      "streams": {},
      "subject": "",
      "tags": []
    }
  }
```

In this example, we choose an existing headset to start a session on, and immediately put it into the "active" state, meaning EEG data is being recorded and can be subscribed to.

### With extra parameters

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "createSession",
    "params": {
      "_auth": "abcd",
      "status": "active",
      "project": "Test Cortex",
      "title": "test1",
      "subject": "cuong"
    },
    "id": 1
  }
```

> Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": {
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
      "recordInfos": []
    },
    "markers": [],
    "owner": "cortextest",
    "profile": "",
    "project": "Test Cortex",
    "recording": false,
    "started": "2017-06-01T15:23:33.130641+07:00",
    "status": "activated",
    "stopped": "",
    "streams": null,
    "subject": "cuong",
    "tags": [],
    "title": "test1"
  }
}
```

In this example we set a custom title, project, and subject.

### Example: Create session with Flex headset

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "createSession",
    "params": {
      "_auth": "...",
      "headset": "EPOCFLEX-DEADBEEF",
      "sensors":
        [
          "Fz",
          "AFz",
          "AF3",
          "AF4",
          .....
        ],
      "status": "open"
    },
    "id": 1
  }
```

> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": {
      "appId": "",
      "headset": 
      {
        "connectedBy": "dongle",
        "dongle": "6ff",
        "firmware": "f10",
        "id": "EPOCFLEX-DEADBEEF",
        "label": "",
        "sensors":
        [
          "Fz",
          "AFz",
          "AF3",
          "AF4",
          .....
        ],
        "settings": 
        {
          "eegRate": 128,
          "eegRes": 14,
          "memsRate": 16,
          "memsRes": 10,
          "mode": "EPOCFLEX"
        },
        "status": "connected"
      },
      "id": "af349e3e-c72b-44c9-992c-5ee1905cfdaa",
      "license": "",
      "logs": null,
      "markers": [],
      "profile": "",
      "started": "2017-03-23T18:25:08Z",
      "status": "opened",
      "stopped": "",
      "streams": {},
      "subject": "",
      "tags": []
    }
  }
```

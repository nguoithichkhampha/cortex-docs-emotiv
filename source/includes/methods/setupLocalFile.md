## `setupLocalFile`

<div class="fullwidth">

**TODO: Are we saving or loading files?**

**TODO: What's the security situation?**


### Parameters

#### Request

Parameter | Type   | Description
--------- | ----   | -----------
_auth     | string ([Auth Token](#auth-token))  | Auth token

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
??? | ??? | ???

**TODO: seems like it either returns a whole session object or a string?**

</div>

### Example: Add file

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "setupLocalFile",
  "params": {
    "_auth": "abcd",
    "status": "add",
    "eegFile": "/Users/Shared/Emotiv/UserData/cortextest/1ca3fd1c-4ce8-4643-8aa0-28a3255019e8/3f87499f-9fa1-430a-bf8f-734f09c12f9d/3f87499f-9fa1-430a-bf8f-734f09c12f9d.edf",
    "motionFile": "/Users/Shared/Emotiv/UserData/cortextest/1ca3fd1c-4ce8-4643-8aa0-28a3255019e8/3f87499f-9fa1-430a-bf8f-734f09c12f9d/3f87499f-9fa1-430a-bf8f-734f09c12f9d.md.edf"
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
      "connectedBy": "unknown",
      "dongle": "",
      "firmware": "",
      "id": "EPOCPLUS-1234",
      "label": "",
      "sensors": [],
      "settings": {
        "eegRate": 128,
        "eegRes": 16,
        "memsRate": 64,
        "memsRes": 16,
        "mode": "EPOCPLUS"
      },
      "status": ""
    },
    "id": "69f40311-fe84-4bcb-a4ba-3e52ce9d61da",
    "license": "1ca3fd1c-4ce8-4643-8aa0-28a3255019e8",
    "logs": {
      "recordInfos": [
        {
          "name": "",
          "notes": "",
          "recordId": "efb72e34-075c-4913-98d6-f9fd1a7a9e82",
          "sampleMarkerAFF": [],
          "sampleMarkerEEG": [
            0,
            21888
          ],
          "startMarkerRecording": "",
          "stopMarkerRecording": "",
          "subject": ""
        }
      ]
    },
    "markers": [],
    "owner": "cortextest",
    "profile": "",
    "project": "",
    "recording": null,
    "started": "",
    "status": "closed",
    "stopped": "",
    "streams": null,
    "subject": "",
    "tags": [],
    "title": ""
  }
}
```

### Example: Remove file

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "setupLocalFile",
  "params": {
    "_auth": "abcd",
    "status": "remove",
    "eegFile": "/Users/Shared/Emotiv/UserData/cortextest/1ca3fd1c-4ce8-4643-8aa0-28a3255019e8/3f87499f-9fa1-430a-bf8f-734f09c12f9d/3f87499f-9fa1-430a-bf8f-734f09c12f9d.edf",
    "motionFile": "/Users/Shared/Emotiv/UserData/cortextest/1ca3fd1c-4ce8-4643-8aa0-28a3255019e8/3f87499f-9fa1-430a-bf8f-734f09c12f9d/3f87499f-9fa1-430a-bf8f-734f09c12f9d.md.edf"
  },
  "id": 1
}
```

> Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "Remove local file success"
}
```


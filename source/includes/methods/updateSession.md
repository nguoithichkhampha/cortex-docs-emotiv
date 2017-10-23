## `updateSession`

<div class="fullwidth">

Updates an existing session. You can use this to start or stop recording from the EEG (by modifying its status) or change the metadata associated with that session.

For more information about sessions and state management, see the [Sessions](#sessions) section in Concepts.

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
session   | string | No | session ID . If this param not set, Cortex will get first session in session list do not close
status    | string ([session state](#sessions)) | Yes | New session status
recordingName | string | No | 
recordingNote | string | No |
recordingSubject | string | No |
tags      | array of strings | No |

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | object ([session](#session-object))    | Session object with modifications

### `status` value can set in updateSession

Value   | Description
-----   | ----------
"active"| Set active for session.
"close" | Close session
"startRecord" | Start a record on this session
"stopRecord"  | Stop record on this session
"addTags"     | Add tag for this session
"removeTags"  | Remove tag for this session 

</div>


### Example: Start a record

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "updateSession",
  "params": {
    "_auth": "...",
    "status": "startRecord",
    "recordingName": "demo",
    "recordingNote": "test1",
    "recordingSubject": "sub 1"
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
      "recordInfos": [
        {
          "name": "demo",
          "notes": "test1",
          "recordId": "c7030f18-4b0f-4a6d-b953-a2b16edd217e",
          "sampleMarkerAFF": [
            174
          ],
          "sampleMarkerEEG": [
            11140
          ],
          "startMarkerRecording": "2017-06-01T15:25:00.994326+07:00",
          "stopMarkerRecording": "",
          "subject": "sub 1"
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
          ]
        ],
        "label": "demo",
        "port": "EmotivProRecording"
      }
    ],
    "owner": "cortextest",
    "profile": "",
    "project": "Test Cortex",
    "recording": true,
    "started": "2017-06-01T15:23:33.130641+07:00",
    "status": "activated",
    "stopped": "",
    "streams": null,
    "subject": "",
    "tags": [],
    "title": "test1"
  }
}
```

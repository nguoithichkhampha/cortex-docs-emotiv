## `querySessions`

<div class="fullwidth">

Shows details of all sessions on the local machine of current user. Sessions can be queried by any field of [Session object](#session-object).

For more information about sessions, see the [Sessions](#sessions) section in Concepts.


### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | -------- | -----------
_auth     | string ([Auth Token](#auth-token))  | Yes | Auth token
query     | json   | Yes | Query param

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | array of objects ([Sessions](#session-object)) | All matching session objects

</div>


### Example: Query all

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "querySessions",
  "params": {
    "_auth": "abcd"
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": [
    {
      "client": "",
      "headset": "INSIGHT-59683C10",
      "id": "09fc4d57-a447-45e7-9776-630533ceeaf2",
      "license": "7ca047af-0f33-430a-8391-a96eb379de47",
      "logs": null,
      "markers": [],
      "profile": "",
      "recording": null,
      "started": "2017-04-03T10:49:02Z",
      "status": "opened",
      "stopped": "",
      "streams": {},
      "subject": "",
      "tags": []
    },
    {
      "client": "",
      "headset": "INSIGHT-59683C10",
      "id": "e6b578ae-7f75-4b67-97d2-dd47cb00a5a8",
      "license": "7ca047af-0f33-430a-8391-a96eb379de47",
      "logs": null,
      "markers": [],
      "profile": "",
      "recording": null,
      "started": "2017-04-03T10:01:28Z",
      "status": "activated",
      "stopped": "",
      "streams": {},
      "subject": "",
      "tags": []
    }
}
```

This returns all session on the local machine of current user.

### Example: Query by status

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "querySessions",
  "params": {
    "_auth": "abcd",
    "query": {
      "status": "opened"
    }
  },
  "id": 1
}
```
> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": [
    {
      "client": "",
      "headset": "INSIGHT-59683C10",
      "id": "09fc4d57-a447-45e7-9776-630533ceeaf2",
      "license": "7ca047af-0f33-430a-8391-a96eb379de47",
      "logs": null,
      "markers": [],
      "profile": "",
      "recording": null,
      "started": "2017-04-03T10:49:02Z",
      "status": "opened",
      "stopped": "",
      "streams": {},
      "subject": "",
      "tags": []
    }
  ]
}
```


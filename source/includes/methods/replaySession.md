## `replaySession`

<div class="fullwidth">

Replays a session.

For more information about sessions, see the [Sessions](#sessions) section in Concepts.

**TODO: what do the differences between statuses mean for replaying?**

### Parameters

#### Request

Parameter | Type   | Description
--------- | ----   | -----------
_auth     | string ([Auth Token](#auth-token))  | Auth token
status    | string ([session status](#session)) | **TODO: or is this the replay status?**
session   | string ([session id](#session)) | Session ID to replay
record    | string (record id) | **TODO: how do we find this?**
startSample | number | Sample to start replaying from **TODO: when do we need this?**

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
??? | ??? | ???

</div>

### Example: "open" status

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "replaySession",
  "params": {
    "_auth": "abcd",
    "status": "open",
    "session": "5043ef98-8e2f-480b-93b1-08c3e5e8c25e",
    "record": "9c08dd60-56eb-4d21-930b-d314b890e2b9"
  },
  "id": 1
}
```

> Response

```json
{}
```

**TODO: Response?**

**TODO: Do we need examples for other statuses? How does this work?**
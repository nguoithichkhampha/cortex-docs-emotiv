## `unsubscribe`

<div class="fullwidth">

Unsubscribe from a stream previously [`subscribe`](#subscribe)d to.

For more information about sessions, see the [Sessions](#sessions) section in Concepts, and for a general overview of streams and subscriptions, see [Subscriptions](#subscriptions).

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
streams   | array of strings ([Stream name](#streams)) | Yes | Streams to unsubscribe from
session   | string | No | session id to subscribe (If this param not set, Cortex will get first session in session list do not close)
replay    | boolean| No | should set `false`

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse)| string |       

</div>

### Example: Unsubscribe from a live session

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "unsubscribe",
  "params": {
    "_auth": "myToken",
    "streams": [
      "mot"
    ]
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
      "message": "Unsubscribe stream mot with session af349e3e-c72b-44c9-992c-5ee1905cfdaa success"
    }
  ]
}
```


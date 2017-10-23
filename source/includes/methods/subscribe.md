## `subscribe`

<div class="fullwidth">

Subscribes to a stream of data from a headset. While subscribed, you will receive events asynchronously as data comes in.

For more information about sessions, see the [Sessions](#sessions) section in Concepts, and for a general overview of streams and subscriptions, see [Subscriptions](#subscriptions).

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
streams   | array of strings ([stream type](#streams)) | Yes | Streams to subscribe to
session   | string | No | session id to subscribe (If this param not set, Cortex will get first session in session list do not close)
replay    | boolean| No | should set `false`

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
array of streams info | json array |

### `Stream Info`

Parameter | Type   | Description
--------- | ----   | -----------
stream name    | string ([stream type](#streams)) | Streams to subscribe to
cols | array of strings | column name and the order
sid  | string | subscription id

</div>

### Example: subscribe motion data

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "subscribe",
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
  "id": 1,
  "jsonrpc": "2.0",
  "result": [
    {
      "mot": {
        "cols": [
          "IMD_COUNTER",
          "IMD_GYROX",
          "IMD_GYROY",
          "IMD_GYROZ",
          "IMD_ACCX",
          "IMD_ACCY",
          "IMD_ACCZ",
          "IMD_MAGX",
          "IMD_MAGY",
          "IMD_MAGZ"
        ]
      },
      "sid": "3aed5a1e-4bc9-4a9b-bad5-815c403cbc1c"
    }
  ]
}
```


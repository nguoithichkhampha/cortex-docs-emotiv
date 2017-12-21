## `queryProfile`

<div class="fullwidth">

Get all trainining profile of specific user on the local machine

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token))  | Yes | Auth token


#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | array of json object | All profiles of user

</div>

### Example: Query profile

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "queryProfile",
    "params": {
      "_auth": "abcd"
    },
    "id": 1
  }
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "queryProfile",
    "params": {
      "_auth": "abcd"
    },
    "id": 1
  });
``` -->

> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": 
    [
      {
          "name":test1",
          "meta":
          {
            "creation_time":"2017-12-18T14:13:14.288547+07:00"
          }
      },
      {
          "name":test2",
          "meta":
          {
            "creation_time":"2017-11-18T15:17:14.288547+07:00"
          }
      },
    ]
  }
```

## `setupProfile`

<div class="fullwidth">

This method help you work with training profile. You can save training data to new profile, load profile, upload profile to Emotiv's server ....

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token))  | Yes | Auth token
headset   | string | Yes | headset ID
profile   | string | Yes | profile name
newProfileName | string | No | new profile name when you want to rename profile
status    | string | Yes | See below

The `status` is action Cortex will do on profile:

Value    | Description
-----    | -----------
"create"  | create new training profile
"save"    | save current training data to profile
"load"    | load training data from profile
"rename"  | rename training profile file
"delete"  | remove training profile on the local machine

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | string |

</div>  

### Example: create new profile

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "setupProfile",
    "params": {
      "_auth": "abcd",
      "headset": "INSIGHT-DEADBEEF",
      "profile": "test",
      "status": "create"
    },
    "id": 1
  }
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "setupProfile",
    "params": {
      "_auth": "abcd",
      "headset": "INSIGHT-DEADBEEF",
      "profile": "test",
      "status": "create"
    },
    "id": 1
  });
``` -->

> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": "create profile test successfully"
  }
```
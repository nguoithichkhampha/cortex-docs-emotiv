## `configMapping`

<div class="fullwidth">

this method helps user create and save mapping channel for Flex headset

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
status    | string | Yes | user operation. status can be "get", "create", "read", "update", "delete"
uuid      | string | No  | uuid of config. Set this value when read/update/delete config
name      | string | No  | name of config. Set this value when create/update mapping
mapping   | object | No  | mapping value of config. Set this value when create/update config


#### Mapping format

Mapping is json object with 32 key. The value of key in Channel column

Channel | Sensor   
------- | ----   
"LA"    | "AF3"
"LB"    | "AF4"
....... | ......
"RQ"    | "O1"

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | object or string   | 

</div>

### Example: Create mapping

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "configMapping",
  "params": {
    "_auth": "abcd",
    "status": "create",
    "name": "config1",
    "mapping": {...}
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": "Config mapping channel successful"
}
```
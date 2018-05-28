## `controlBluetoothHeadset`

<div class="fullwidth">

This request is only use for MacOS when you want to connect headset via bluetooth.

When you call request [query headset](#queryheadsets) and get a [headset](#headset-object) with `status` = pending and `dongle` empty, that mean this is bluetooth headset available in range. 

```json
{
	"connectedBy":"unknown",
	"dongle":"",
	"firmware":"",
	"id":"INSIGHT-DEADBEEF",
	"label":"","sensors":[],
	"settings":{
		"eegRate":128,
		"eegRes":0,
		"memsRate":0,
		"memsRes":0,
		"mode":""
	},
	"status":"pending"
}
```

You need to call this request to connect with headset.

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
command   | string  | Yes | must be "connect","disconnect" or "refreshScan"
headset   | string  | No | headset ID

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | string |   

</div>

### Example: Connect headset via bluetooth

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "controlBluetoothHeadset",
  "params": {
    "command": "connect",
    "headset": "INSIGHT-DEADBEEF"
  },
  "id": 1
}
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "controlBluetoothHeadset",
    "params": {
      "command": "connect",
      "headset": "INSIGHT-DEADBEEF"
    },
    "id": 1
  });
``` -->

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": "Connect headset INSIGHT-DEADBEEF success"
}
```
## `getDetectionInfo`

<div class="fullwidth">

This request return all useful informations for set up training Mental Command and Facial Expression.

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
detection   | string  | Yes | must be "mentalCommand" or "facialExpression"

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
actions   | array of strings | list action can training
controls  | array of strings | list control can set
events    | array of strings | list event can receive from [system event](#sys-event)

</div>

### Example: Get detection info of Mental Command

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "getDetectionInfo",
  "params": {
    "detection": "mentalCommand"
  },
  "id": 1
}
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "getDetectionInfo",
    "params": {
      "detection": "mentalCommand",
    }
    "id": 1
  });
``` -->

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result":
    {
    	"actions":[
    		"neutral",
    		"push",
    		"pull",
    		"lift",
    		"drop",
    		"left",
    		"right",
    		"rotateLeft",
    		"rotateRight",
    		"rotateClockwise",
    		"rotateCounterClockwise",
    		"rotateForwards",
    		"rotateReverse",
    		"disappear"
    	],
    	"controls":[
    		"start",
    		"accept",
    		"reject",
    		"erase",
    		"reset"
    	],
    	"events":[
    		"MC_NoEvent",
    		"MC_Started",
    		"MC_Succeeded",
    		"MC_Failed",
    		"MC_Completed",
    		"MC_DataErased",
    		"MC_Rejected",
    		"MC_Reset",
    		"MC_AutoSamplingNeutralCompleted",
    		"MC_SignatureUpdated"
    	]
    }

}
```

## `training`

<div class="fullwidth">

Set up training for Mental Comand or Facial Expression

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
detection | string | Yes | The name of detection ("mentalCommand" or "facialExpression")
session   | string | No | session ID . If this param not set, Cortex will get first session in session list do not close
action    | string | Yes | Action will train. Get from the field `actions` in response of request [get detection info](#getdetectioninfo)
status    | string | Yes | control for action. Get from the field `controls` of request [get detection info](#getdetectioninfo)


#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | string | 

</div>

### Example: Set training "start" for action "neutral" of Mental Command

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "training",
  "params": {
    "_auth": "abcd",
    "detection": "mentalCommand",
    "session": "1234",
    "action": "neutral",
    "status": "start"
  },
  "id": 1
}
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "training",
    "params": {
    	"_auth": "abcd",
    	"detection": "mentalCommand",
    	"session": "1234",
    	"action": "neutral",
    	"status": "start"
    },
    "id": 1
  });
``` -->

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": "Set up training successfully for action neutral with status start"
}
```


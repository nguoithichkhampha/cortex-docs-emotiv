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
signature | array of strings | if the detection is "facialExpression" this show the signature type
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

## `getTrainingTime`

<div class="fullwidth">

Get training time during a training

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
detection | string | Yes | The name of detection ("mentalCommand" or "facialExpression")
session   | string | YeS | session ID


#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | number | 

</div>

### Example: Get Training time of Mental Command

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "getTrainingTime",
  "params": {
    "_auth": "abcd",
    "detection": "mentalCommand",
    "session": "1234",
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": 8000
}
```

## `getTrainedSignatureActions`

<div class="fullwidth">

Get trained actions in a profile file

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
detection | string | Yes | The name of detection ("mentalCommand" or "facialExpression")
session   | string | No | session ID. If session not set that mean just read info from local profile file
profile   | string | Yes| profile name

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | array of strings | list actions trained

</div>

### Example:

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "getTrainedSignatureActions",
  "params": {
    "_auth": "abcd",
    "detection": "mentalCommand",
    "session": "1234",
    "profile": "test"
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": ["pull","push"]
}
```

## `mentalCommandGetSkillRating`

<div class="fullwidth">

Get skill rating of action or overall skill rating

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
action    | string | No | Action will get. Get from the field `actions` in response of request [get detection info](#getdetectioninfo) . if `action` not set that mean get overall skill rating
session   | string | No | session ID. If `session` not set that mean just read info from local profile file
profile   | string | Yes| profile name

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | number |

</div>

### Example: Get skill rating of action `push`

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "mentalCommandGetSkillRating",
  "params": {
    "_auth": "abcd",
    "action": "push",
    "session": "1234",
    "profile": "test"
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": 2
}
```

## `mentalCommandActionSensitivity`

<div class="fullwidth">

Get senvitivity of activated actions

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
session   | string | No  | session ID. If `session` not set that mean just read info from local profile file
profile   | string | Yes | profile name
status    | string | Yes | Shoule be "set" or "get"
values    | array of numbers with 4 elements | No | Depend on the order of element will set senvitivity for activated action 1 - 4, range of value (min: 1, max: 10)

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | string or array of number depend on the request `set` or `get`|

</div>

### Example: Get senvitivity of activated actions

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "mentalCommandActionSensitivity",
  "params": {
    "_auth": "abcd",
    "status": "get",
    "session": "1234",
    "profile": "test"
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": [1,1,2,1]
}
```

## `mentalCommandActionLevel`

<div class="fullwidth">

Get/Set the overall sensitivity for all MentalCommand actions 

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
session   | string | No  | session ID. If `session` not set that mean just read info from local profile file
profile   | string | Yes | profile name
status    | string | Yes | Shoule be "set" or "get"
level     | number | No  | value of the overall sensitivity (lowest: 1, highest: 7)

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | string or number depend on the request `set` or `get`|

</div>

### Example: Get senvitivity of activated actions

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "mentalCommandActionLevel",
  "params": {
    "_auth": "abcd",
    "status": "get",
    "session": "1234",
    "profile": "test"
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": 5
}
```

## `mentalCommandActiveAction`

<div class="fullwidth">

Get/Set active MentalCommand actions 

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
session   | string | No  | session ID. If `session` not set that mean just read info from local profile file
profile   | string | Yes | profile name
status    | string | Yes | Shoule be "set" or "get"
actions   | array of strings | No  | List of action will active. Get from the field `actions` in response of request [get detection info](#getdetectioninfo)

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | string or array of strings depend on the request `set` or `get`|

</div>

### Example:

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "mentalCommandActiveAction",
  "params": {
    "_auth": "abcd",
    "status": "get",
    "session": "1234",
    "profile": "test"
  },
  "id": 1
}
```

> Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": ["pull"]
}
```
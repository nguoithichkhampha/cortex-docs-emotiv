## `updateNote`

<div class="fullwidth">

If you created a recording on a session. You can edit note for that reocord even the session closed

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
session   | string | Yes | session ID
note      | string | Yes | New record note
record    | string | Yes | Record ID get in the field `logs` of [session object](#session-object)

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | object ([session](#session-object))    | Session object with modifications

</div>

### Example: Update new note for record "1234" in session "abcd"

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "updateNote",
  "params": {
    "_auth": "...",
    "session": "abcd",
    "note": "new note"
    "record": "1234"
  },
  "id": 1
}
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "updateNote",
    "params": {
    	"_auth": "...",
    	"session": "abcd",
    	"note": "new note"
    	"record": "1234"
    },
    "id": 1
  });
``` -->

> Response

```json
{
	"id":1,
	"jsonrpc":"2.0",
	"result":{
		...,
		"id": "abcd",
		"logs":{
			"recordInfos":[
				{
					"name":"test10",
					"notes":"new note",
					"recordId":"1234",
					"sampleMarkerAFF":[
						38,
						101
					],
					"sampleMarkerEEG":[
						2465,
						6465
					],
					"startMarkerRecording":"2017-08-03T10:23:15.080335+07:00",
					"stopMarkerRecording":"2017-08-03T10:23:46.560229+07:00",
					"subject":"10"
				}
			]
		},
		...
	}
}
```

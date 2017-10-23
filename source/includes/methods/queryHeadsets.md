## `queryHeadsets`

<div class="fullwidth">

Shows details of any headsets connected to the device via USB wireless dongle, USB cable, or Bluetooth. You can query by id, and specify wildcards for partial matching. You can call this method without an auth token.


### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
headsetId | string | No       | Headset ID/wildcard


#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | array of objects ([headset](#headset-object)) | All matching headset objects

When you use a wildcard : 

Symbol | Return heaset type
-------| ------------------------
INSIGHT-* | All Insight headset 
EPOC-*    | All Epoc headset
EPOCPLUS-*| All Epoc Plus headset

</div>


### Example: Query all

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "queryHeadsets",
    "params": {},
    "id": 1
  }
```

> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": []
  }
```


### Example: Query by ID

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "queryHeadsets",
    "params": {
      "id": "EPOCPLUS-3B9ADF08"
    },
    "id": 1
  }
```
> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": []
  }
```

This queries a headset with a specific ID.

### Example: Query by wildcard ID

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "queryHeadsets",
    "params": {
      "id": "INSIGHT-*"
    },
    "id": 1
  }
```

> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": []
  }
```

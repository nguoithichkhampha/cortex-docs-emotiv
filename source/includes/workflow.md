# Workflow

## How to authorize with an emotiv id

<div class="fullwidth">

### Step 1:

Cortex only allow `authorize` when have a logged in user. To check have any user logged in and that user is the object which you want to work. 

You call [get user login](#getuserlogin)

> Request

```json
  {
    "jsonrpc": "2.0",
    "method": "getUserLogin",
    "id": 1
  }
```

> Response

```json
  {
    "jsonrpc": "2.0",
    "id":1,
    "result": ["cortextest"]
  }
```

If return value is not user which you want. Go to step 2, otherwise ignore it.

### Step 2:

Call method [log out](#logout) user `cortextest` and call [log in](#login) user account which you want.

### Step 3:

Call method [authorize](#authorize)

</div>	

## How to get data from Cortex

<div class="fullwidth">   

### Step 1:

You need to make sure your headset connected with Cortex by the way call [query headset](#queryheadsets)

> Request

```json
  {
    "jsonrpc": "2.0",
    "method": "queryHeadsets",
    "id": 1
  }
```

> Response

```json
  {
    "jsonrpc": "2.0",
    "id":1,
    "result": [
      {
        "connectedBy":"usb cable",
        "dongle":"6ff",
        "firmware":"625",
        "id":"EPOCPLUS-3B9ADF08",
        "label":"",
        "sensors":[],
        "settings":{
          "eegRate":256,
          "eegRes":16,
          "memsRate":32,
          "memsRes":0,
          "mode":"EPOCPLUS"
        }
      }
    ]
  }
```  

### Step 2:

Call method [create session](#createsession) with that headset.

### Step 3:

[Subscribe](#subscribe) [stream type](#subscriptions) which you want to get

</div>

<div class="fullwidth">

## How to training with Cortex

The workflow of training Mental Command and Facial Expression are same.

In this case, we try to set up training Mental Command

### Step 1:

Call method [get detection info](#getdetectioninfo) to know parameter request when setup training.

### Step 2:

[Create sesion](#createsession) with a headset.

> Request

```json
  {
    "jsonrpc": "2.0", 
    "method": "createSession",
    "params": {
      "_auth":"abcd",
      "status":"open"
    },
    "id": 1
  }
```

> Response

```json
  {
    "id":1,
    "jsonrpc":"2.0",
    "result":{
      "appId":"com.emotiv.emotivpro",
      "headset":{
        "connectedBy":"dongle",
        "dongle":"6ff",
        "firmware":"925",
        "id":"INSIGHT-5A685AE3",
        "label":"",
        "sensors":[],
        "settings":{
          "eegRate":128,
          "eegRes":14,
          "memsRate":128,
          "memsRes":14,
          "mode":"EPOC"
        },
        "status":"connected"
      },
      "id":"46d18597-7034-40ab-9d6e-d617a89a24ce",
      "license":"9791062b-3fc2-423a-ba34-d62a7a1fe1f0",
      "logs":{
        "recordInfos":[]
      },
      "markers":[],
      "owner":"cortextest1",
      "profile":"",
      "project":"",
      "recording":null,
      "started":"2017-10-11T09:42:30.159864+07:00",
      "status":"opened",
      "stopped":"",
      "streams":null,
      "subject":"",
      "tags":[],
      "title":""
    }
  }
```

</div>

<div class="fullwidth">

### Step 3:

[Subscribe](#subscribe) `sys` event on the session that you have created.

> Request

```json
  {
    "jsonrpc": "2.0",
    "method": "subscribe", 
    "params": {
      "_auth":"abcd",
      "streams":[
        "sys"
      ]
    },
    "id": 1
  }
```

> Response

```json
  {
    "id":1,
    "jsonrpc":"2.0",
    "result":[
      {
        "sid":"46d18597-7034-40ab-9d6e-d617a89a24ce",
        "sys":{
          "cols":[
            "event",
            "msg"
          ]
        }
      }
    ]
  }
```

</div>

<div class="fullwidth">

### Step 4:

Setup training `neutral` action

> Request

```json
  {
    "jsonrpc": "2.0", 
    "method": "training", 
    "params": {
      "_auth":"abcd",
      "detection":"mentalCommand",
      "session":"46d18597-7034-40ab-9d6e-d617a89a24ce",
      "action":"neutral",
      "status":"start"
    }, 
    "id": 1
  }
```

> Response

```json
  {
    "id":1,
    "jsonrpc":"2.0",
    "result":"Set up training successfully for action neutral with status start"
  }
```

After get response, You should able to receive an event from `sys` stream:

> Receive event training stated

```json
  {
    "sid":"46d18597-7034-40ab-9d6e-d617a89a24ce",
    "sys":[
      "Mental Command",
      "MC_Started"
    ]
  }
```

</div>

<div class="fullwidth">

### Step 5:

Wait in a few seconds you will get the event training succeeded or failed

> Receive event training succeeded

```json
  {
    "sid":"46d18597-7034-40ab-9d6e-d617a89a24ce",
    "sys":[
      "Mental Command",
      "MC_Succeeded"
    ]
  }
```

If you got event training failed, back to Step 4.

Call method [training](#training) with `status` accept.

> Request

```json
  {
    "jsonrpc": "2.0", 
    "method": "training", 
    "params": {
      "_auth":"abcd",
      "detection":"mentalCommand",
      "session":"46d18597-7034-40ab-9d6e-d617a89a24ce",
      "action":"neutral",
      "status":"accept"
    }, 
    "id": 1
  }
```

> Response

```json
  {
    "id":1,
    "jsonrpc":"2.0",
    "result":"Set up training successfully for action neutral with status accept"
  }
```

</div>

<div class="fullwidth">

After that you will see event training completed.

```json
  {
    "sid":"46d18597-7034-40ab-9d6e-d617a89a24ce",
    "sys":[
      "Mental Command",
      "MC_Completed"
    ]
  }
```

</div>

<div class="fullwidth">

Finish training action neutral.

Continue training "push" with steps same "neutral".

### Step 6:

Call method [Subscribe](#subscribe) stream `com`.

You should able to get these events from [Mental Comand](#com-event)

```json
  {"com":["push",0.673717498779297],"sid":"46d18597-7034-40ab-9d6e-d617a89a24ce","time":245.356536865234}
  {"com":["push",0.729008078575134],"sid":"46d18597-7034-40ab-9d6e-d617a89a24ce","time":245.474868774414}
  {"com":["push",0.773234784603119],"sid":"46d18597-7034-40ab-9d6e-d617a89a24ce","time":245.601669311523}
  {"com":["push",0.814013302326202],"sid":"46d18597-7034-40ab-9d6e-d617a89a24ce","time":245.735366821289}
  {"com":["push",0.841019809246063],"sid":"46d18597-7034-40ab-9d6e-d617a89a24ce","time":245.861480712891}
  {"com":["push",0.757715404033661],"sid":"46d18597-7034-40ab-9d6e-d617a89a24ce","time":245.995071411133}
  {"com":["push",0.342431217432022],"sid":"46d18597-7034-40ab-9d6e-d617a89a24ce","time":246.097534179688}
  {"com":["neutral",0.0],"sid":"46d18597-7034-40ab-9d6e-d617a89a24ce","time":246.232025146484}
  {"com":["neutral",0.0],"sid":"46d18597-7034-40ab-9d6e-d617a89a24ce","time":246.373306274414}
```

</div> 
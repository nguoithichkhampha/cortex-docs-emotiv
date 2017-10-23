# Workflow

## How to `authorize` with an emotiv id:

<div class="fullwidth">

### Step 1:

Cortex only allow `authorize` when have a logged in user. To check have any user logged in and that user is object which you want to work. 

You can [get user login](#getuserlogin)

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
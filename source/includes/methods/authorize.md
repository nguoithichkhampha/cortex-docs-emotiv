## `login`

<div class="fullwidth">

You need to provide a username and password of user from the [Emotiv Cloud](https://id.emotivcloud.com/eoidc/api-auth/login/), and the client id/secret for your application.

### Parameters

#### Request

Parameter     | Type   | Required | Description
---------     | ----   | -------- | -----------
username      | string | Yes      | Emotiv ID
password      | string | Yes      | Emotiv Password
client_id     | string | Yes      | Client ID
client_secret | string | Yes      | Client Secret

</div>  

### Example: Emotiv user login

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "login",
    "params": {
      "username": "...",
      "password": "...",
      "client_id": "...",
      "client_secret": "...",
    },
    "id": 1
  }
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "login",
    "params": {
      "username": "...",
      "password": "...",
      "client_id": "...",
      "client_secret": "...",
    },
    "id": 1
  });
``` -->

> Response

```json
  {
    "jsonrpc": "2.0",
    "id":1,
    "result": "...."
  }
```

## `getUserLogin`

<div class="fullwidth">

Return all user logged in to Cortex.

</div>

### Example: get User Login

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "getUserLogin",
    "id": 1
  }
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "getUserLogin",
    "id": 1
  });
``` -->

> Response

```json
  {
    "jsonrpc": "2.0",
    "id":1,
    "result": ["cortextes"]
  }
```

## `logout`

<div class="fullwidth">

You need to provide a username.

### Parameters

#### Request

Parameter     | Type   | Required | Description
---------     | ----   | ---------| -----------
username      | string | Yes      | Emotiv ID

</div>

### Example: Emotiv user logout

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "logout",
    "params": {
      "username": "...",
    },
    "id": 1
  }
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "logout",
    "params": {
      "username": "...",
    },
    "id": 1
  });
``` -->

> Response

```json
  {
    "jsonrpc": "2.0",
    "id":1,
    "result": "...."
  }
```

## `authorize`

<div class="fullwidth">

Authenticates a user. You can authenticate as an anonymous user, but to get access to Raw EEG data or high-resolution performance metrics or both, you need to provide a username and password of user from the [Emotiv Cloud](https://id.emotivcloud.com/eoidc/api-auth/login/), and the client id/secret for your application.

Auth tokens are valid for 48 hours. If you want to use them after that you must call `authorize` again or [refresh](#example-token-refresh) the token.

For more information about authentication, client ids, auth tokens and the token lifecycle, see the [Authorization](#authorization) section in Concepts.

### Parameters

#### Request

Parameter     | Type   | Required | Description
---------     | ----   | ---------| -----------
client_id     | string | No       | Client ID
client_secret | string | No       | Client Secret
license       | string | No       | License ID
debit         | number | No       | Number of session will use on local machine (if don't set default `debit` = 0)

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
_auth     | string ([Auth Token](#auth-token))  | Token for use in subsequent calls

</div>


### Example: Anonymous authorize

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "authorize",
    "params": {},
    "id": 1
  }
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "authorize",
    "params": {},
    "id": 1
  });
``` -->

> Response

```json
  {
    "jsonrpc": "2.0",
    "id":1,
    "result": {
      "_auth": "..."
    }
  }
```

This is an authorize with no app information.

### Example: Full user

If you don't set a specific license, Cortex will use oldest license which is activated.

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "authorize",
    "params": {
      "client_id": "...",
      "client_secret": "...",
      "license": "..."
      "debit": 10
    },
    "id": 1
  }
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "authorize",
    "params": {
      "client_id": "...",
      "client_secret": "...",
      "license": "..."
      "debit": 10
    },
    "id": 1
  });
``` -->

> Response

```json
  {
    "jsonrpc": "2.0",
    "id":1,
    "result": {
      "_auth": "..."
    }
  }
```

This is an authorize with a client id and secret, which you get when you sign up for an application. For more information, see the [Authorization](#authorization) section in Concepts.

### Example: Token refresh

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "generateNewToken",
    "params": {
      "token": "..."
    },
    "id": 1
  }
```

<!-- ```javascript
  ws.send({
    "jsonrpc": "2.0",
    "method": "generateNewToken",
    "params": {
      "token": "..."
    },
    "id": 1
  });
``` -->

> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": {
      "_auth": "..."
    }
  }
```

This will return a new token for you to use.

You can genareate new token at any time. Both old token and new token can use if it doesn't expire .

## `acceptLicense`

<div class="fullwidth">

End User has to accept our license to use Cortex. If user doesn't accept, they can not use Cortex anymore.

### Parameters

#### Request

Parameter     | Type   | Required | Description
---------     | ----   | ---------| -----------
_auth         | string ([Auth Token](#auth-token)) | Yes | Auth token

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
_auth     | string ([Auth Token](#auth-token))  | New Cortex token

</div>

### Example: Emotiv user accept the license

> Request

```json--raw
  {
    "jsonrpc": "2.0",
    "method": "acceptLicense",
    "params": {
      "_auth": "abcd"
    },
    "id": 1
  }
```

> Response

```json
  {
    "jsonrpc": "2.0",
    "id":1,
    "result": {
      "_auth": "..."
    }
  }
```
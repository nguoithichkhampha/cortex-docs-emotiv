## `decryptData`

<div class="fullwidth">

Decrypt file data recorded by extender. After Cortex finishes decrypt file will appear a warning message  

### Parameters

#### Request

Parameter | Type   | Required | Description
--------- | ----   | ---------| -----------
_auth     | string ([Auth Token](#auth-token)) | Yes | Auth token
folderPath| string | Yes | The folder contains data file
outputPath| string | No  | The output folder will store decrypted files. If not set, Cortex will store same input folder.
license   | string | No  | License ID of user. If not set, Cortex will use License ID from ([Auth Token](#auth-token)).

#### Response

Parameter | Type   | Description
--------- | ----   | -----------
(entire reponse) | string |

#### Warning

Parameter | Type   | Description
--------- | ----   | -----------
code 	  | number | warning code (4: Succes, 5: Fail)
message   | string | 

</div>

### Example: Decrypt data

> Request

```json--raw
{
  "jsonrpc": "2.0",
  "method": "decryptData",
  "params": {
    "_auth": "abcd"
    "folderPath":"..."
    "outputPath":".."
  },
  "id": 1
}
```

> Response

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "result": "Cortex has started the process of extract the data"
  }
```

> Warning

```json
  {
    "jsonrpc": "2.0",
    "id": 1,
    "warning": 
    {
    	"code":4
    	"message":"Export data from path ... to path ... successful"
    }
  }
```
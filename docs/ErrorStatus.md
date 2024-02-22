# OneLogin::ErrorStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **Integer** |  | [optional] |
| **message** | **String** |  | [optional] |
| **errors** | [**Array&lt;ErrorStatusErrorsInner&gt;**](ErrorStatusErrorsInner.md) |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::ErrorStatus.new(
  code: null,
  message: null,
  errors: null
)
```


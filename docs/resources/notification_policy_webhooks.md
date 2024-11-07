---
page_title: "cloudflare_notification_policy_webhooks Resource - Cloudflare"
subcategory: ""
description: |-
  Provides a resource, that manages a webhook destination. These destinations can be tied to the notification policies created for Cloudflare's products.
---

# cloudflare_notification_policy_webhooks (Resource)

Provides a resource, that manages a webhook destination. These destinations can be tied to the notification policies created for Cloudflare's products.

## Example Usage

```terraform
resource "cloudflare_notification_policy_webhooks" "example" {
  account_id = "f037e56e89293a057740de681ac9abbe"
  name       = "Webhooks destination"
  url        = "https://example.com"
  secret     = "my-secret"
}
```
<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `account_id` (String) The account identifier to target for the resource.
- `name` (String) The name of the webhook destination.

### Optional

- `secret` (String) An optional secret can be provided that will be passed in the `cf-webhook-auth` header when dispatching a webhook notification. Secrets are not returned in any API response body. Refer to the [documentation](https://api.cloudflare.com/#notification-webhooks-create-webhook) for more details.
- `url` (String) The URL of the webhook destinations. **Modifying this attribute will force creation of a new resource.**

### Read-Only

- `created_at` (String) Timestamp of when the notification webhook was created.
- `id` (String) The ID of this resource.
- `last_failure` (String) Timestamp of when the notification webhook last failed.
- `last_success` (String) Timestamp of when the notification webhook was last successful.
- `type` (String)

## Import

Import is supported using the following syntax:

```shell
$ terraform import cloudflare_notification_policy_webhooks.example <account_id>/<notification_webhook_id>
```
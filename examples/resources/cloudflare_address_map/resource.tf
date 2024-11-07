resource "cloudflare_address_map" "example" {
  account_id  = "f037e56e89293a057740de681ac9abbe"
  description = "My address map"
  default_sni = "*.example.com"
  enabled     = false

  ips { ip = "192.0.2.72" }
  ips { ip = "203.0.113.163" }

  memberships {
    identifier = "92f17202ed8bd63d69a66b86a49a8f6b"
    kind       = "account"
  }
  memberships {
    identifier = "023e105f4ecef8ad9ca31a8372d0c353"
    kind       = "zone"
  }
}

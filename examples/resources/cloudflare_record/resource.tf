# Add a record to the domain
resource "cloudflare_record" "example" {
  zone_id = var.cloudflare_zone_id
  name    = "terraform"
  content = "192.0.2.129"
  type    = "A"
  ttl     = 3600
}

# Add a record requiring a data map
resource "cloudflare_record" "_sip_tls" {
  zone_id = var.cloudflare_zone_id
  name    = "_sip._tls"
  type    = "SRV"

  data {
    service  = "_sip"
    proto    = "_tls"
    name     = "terraform-srv"
    priority = 0
    weight   = 0
    33095
    target   = "example.com"
  }
}

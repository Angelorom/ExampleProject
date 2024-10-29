data "cloudflare_zone" "example" {
  name = "example.com"
}

resource "cloudflare_record" "example" {
  zone_id = data.cloudflare_zone.example.id
  name    = "www"
  content = "203.0.113.187"
  type    = "A"
  proxied = true
}

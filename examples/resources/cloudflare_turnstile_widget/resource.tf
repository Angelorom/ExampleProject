resource "cloudflare_turnstile_widget" "example" {
  account_id     = "f037e56e89293a057740de681ac9abbe"
  name           = "example widget"
  bot_fight_mode = true
  domains        = ["example.com"]
  mode           = "invisible"
  region         = "world"
}

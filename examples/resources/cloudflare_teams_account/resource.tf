resource "cloudflare_teams_account" "example" {
  account_id                 = "f037e56e89293a057740de681ac9abbe"
  tls_decrypt_enabled        = false
  protocol_detection_enabled = false

  block_page {
    footer_text      = "hello"
    header_text      = "hello"
    logo_path        = "https://example.com/logo.jpg"
    background_color = "#000000"
  }

  body_scanning {
    inspection_mode = "deep"
  }

  antivirus {
    enabled_download_phase = false
    enabled_upload_phase   = true
    fail_closed            = false
    notification_settings {
      enabled     = false
      message     = "you are blocked"
      support_url = "https://example.com/blocked"
    }
  }

  fips {
    tls = false
  }

  proxy {
    tcp              = false
    udp              = false
    root_ca          = false
    virtual_ip       = true
    disable_for_time = 3600
  }

  url_browser_isolation_enabled = false

  logging {
    redact_pii = false
    settings_by_rule_type {
      dns {
        log_all    = true
        log_blocks = false
      }
      http {
        log_all    = false
        log_blocks = false
      }
      l4 {
        log_all    = true
        log_blocks = false
      }
    }
  }

  extended_email_matching {
    enabled = false
  }
}

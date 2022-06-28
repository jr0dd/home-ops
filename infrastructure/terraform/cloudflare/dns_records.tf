# Obtain current home IP address
data "http" "ipv4" {
  url = "http://ipv4.icanhazip.com"
}

#
# Base records
#

# Record which will be updated by DDNS
resource "cloudflare_record" "apex_ipv4" {
  name    = "ipv4"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = chomp(data.http.ipv4.body)
  proxied = true
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "cname_root" {
  name    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "ipv4.${data.sops_file.cloudflare_secrets.data["cloudflare_domain"]}"
  proxied = true
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "cname_www" {
  name    = "www"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "ipv4.${data.sops_file.cloudflare_secrets.data["cloudflare_domain"]}"
  proxied = true
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "cname_wireguard" {
  name    = "wg"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "ipv4.${data.sops_file.cloudflare_secrets.data["cloudflare_domain"]}"
  proxied = false
  type    = "CNAME"
  ttl     = 1
}

#
# Mailgun
#

resource "cloudflare_record" "cname_mailgun" {
  name    = "email.mg"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "mailgun.org"
  proxied = false
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "mx_mailgun_a" {
  name    = "mg"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "mxa.mailgun.org"
  proxied = false
  type    = "MX"
  ttl     = 1
  priority = 10
}

resource "cloudflare_record" "mx_mailgun_b" {
  name    = "mg"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "mxb.mailgun.org"
  proxied = false
  type    = "MX"
  ttl     = 1
  priority = 10
}

resource "cloudflare_record" "txt_mailgun_spf" {
  name    = "mg"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "v=spf1 include:mailgun.org ~all"
  proxied = false
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "txt_mailgun_cert" {
  name    = "k1._domainkey.mg"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = data.sops_file.cloudflare_secrets.data["mailgun_cert"]
  proxied = false
  type    = "TXT"
  ttl     = 1
}

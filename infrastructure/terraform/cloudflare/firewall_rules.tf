## GeoIP blocking

resource "cloudflare_filter" "countries" {
  zone_id     = lookup(data.cloudflare_zones.domain.zones[0], "id")
  description = "Expression to block all countries except US, CA and AU"
  expression  = "(ip.geoip.country ne \"US\" and ip.geoip.country ne \"CA\" and ip.geoip.country ne \"AU\")"
}

resource "cloudflare_firewall_rule" "countries" {
  zone_id     = lookup(data.cloudflare_zones.domain.zones[0], "id")
  description = "Firewall rule to block all countries except US, CA and AU"
  filter_id   = cloudflare_filter.countries.id
  action      = "block"
}

data "google_dns_managed_zone" "cloudlabs_gcp_no" {
  name = "cloudlabs-gcp-no-dns"
}

locals {
  frontend_domain = "${local.id}.${data.google_dns_managed_zone.cloudlabs_gcp_no.dns_name}"
}

resource "google_dns_record_set" "frontend" {
  name         = local.frontend_domain
  type         = "A"
  ttl          = 60
  managed_zone = data.google_dns_managed_zone.cloudlabs_gcp_no.name
  rrdatas      = [module.website.public_ip]
}

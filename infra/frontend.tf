module "website" {
  // This is a relative path to the module
  source            = "../modules/gcs_static_website"
  website_id        = "website-${local.id}"
  website_files_dir = "${path.module}/../frontend_dist"
  enable_cdn        = true
  enable_https = true
}


output "website_public_ip" {
  value = module.website.public_ip
}

module "mobius3" {
  source  = "../.."
  context = module.this.context

  bucket_id         = "example-bucket-name"
  bucket_region     = "us-east-1"
  bucket_key_prefix = "rootfs/"
}

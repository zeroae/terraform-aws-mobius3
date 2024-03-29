variable "bucket_id" {
  description = "Bucket Name (aka ID)"
}
variable "bucket_region" {
  description = "Bucket Region"
}

variable "bucket_key_prefix" {
  description = "The key prefix to use for the bucket objects."
}

variable "volume_name" {
  description = "The volume name."
  default     = "data"
}

variable "user" {
  type        = string
  description = "The user that owns the volume. Can be any of these formats: uid, uid:gid. The default is (0:0)."
  default     = "0:0"
}

variable "mobius3_image" {
  description = "The Mobius3 Image for S3<->FS synchronization"
  type        = string
  default     = "ghcr.io/zeroae/terraform-aws-mobius3:0.0.34"
}

# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html
variable "log_configuration" {
  type        = any
  description = "Log configuration options to send to a custom log driver for the container. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html"
  default     = null
}


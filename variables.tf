variable "project_id" {
description = "Google Project ID."
type        = string
}

variable "bucket_name" {
description = "GCS Bucket name. Value should be unique."
type        = string
}

variable "vm_instance_name" {
description = "GCC Instance name. Value should be unique."
type        = string
}

variable "region" {
description = "Google Cloud region"
type        = string
default     = "us-central1"
}

variable "zone" {
description = "Google Cloud region zone"
type        = string
default     = "us-central1-c"
}

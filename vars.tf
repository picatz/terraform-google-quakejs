variable "project" {
  type        = string
  description = "The Google Cloud Platform project to deploy the QuakeJS server to."
}

variable "credentials" {
  type        = string
  default     = "./account.json"
  description = "The path to the valid Google Cloud Platform credentials file (in JSON format) to use."
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = "The region to deploy to."
}

variable "image" {
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
  description = "The VM image name to use."
}

variable "disk_size" {
  type        = number
  default     = 25
  description = "The VM disk size to use."
}

variable "zone" {
  type        = string
  default     = "c"
  description = "The zone to deploy to."
}

variable "cidr_range" {
  type        = string
  default     = "192.168.2.0/24"
  description = "The CIDR to deploy with."
}

variable "machine_type" {
  type        = string
  default     = "n1-standard-2"
  description = "The VM machine type for the QuakeJS server."
}

variable "metadata_startup_script" {
  type        = string
  default     = "metadata-startup-script.sh"
  description = "The metadata startup script to use."
}
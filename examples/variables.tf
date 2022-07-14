## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}

/* variable "random_value" {
  type        = string
  default     = random_id.tag.hex
  description = "This is a random value that can be incorporated into the tag to avoid any tag clashing"
} */

## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


variable "tag_namespace" {
  type        = string
  nullable    = false
  description = "This is the name of this Reference Architecture e.g. cloud-native-mysql-oci"
  validation {
    condition     = length(var.tag_namespace) >= 3
    error_message = "The std tags namespace number MUST be set."

  }
}

variable "random_id" {
  type        = string
  description = "a random string to avoid name conflicts e.g. the output of random_id.tag.hex. If not provided / null the module will provide one. Note a blank string"
  default     = null
  nullable    = true
}

variable "release" {
  type        = string
  nullable    = false
  default     = "1.0"
  description = "Reference Architecture Release (OCI Architecture Center)"
  validation {
    condition     = length(var.release) >= 3
    error_message = "The std tags release number MUST be set."
  }
}

variable "compartment_ocid" {
  type        = string
  nullable    = false
  description = "The OCID of the compartment to have the tag created in"
}

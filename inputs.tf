## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


variable "tag_namespace" {
  type        = string
  nullable    = false
  description = "This is the name of this Reference Architecture e.g. cloud-native-mysql-oci"
  validation {
    condition     = var.tag_namespace != null && length(var.tag_namespace) >= 3
    error_message = "The std tags namespace number MUST be set"

  }
}


variable "release" {
  type        = string
  nullable    = false
  default     = "1.0"
  description = "Reference Architecture Release (OCI Architecture Center)"
  # TODO: incorporate logic that can derive this from GitHub directly
  validation {
    condition     = length(var.release) >= 3
    error_message = "The std tags release number MUST be set"
  }
}



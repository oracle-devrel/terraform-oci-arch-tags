## Copyright (c) 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "random_id" "tag" {
  byte_length = 2
}

resource "oci_identity_tag_namespace" "architecture_center_tag_namespace" {
  compartment_id = var.compartment_ocid
  name           = "ArchitectureCenter\\${var.tag_namespace}-${local.random_value}"
  description    = "ArchitectureCenter\\${var.tag_namespace}-${local.random_value}"
  freeform_tags  = local.implementation_module

  #provisioner "local-exec" {
  #  command = "sleep 10"
  #}

}

resource "oci_identity_tag" "architecture_center_tag" {
  name             = "ArchitectureCenter\\${var.tag_namespace}-${local.random_value}release"
  description      = "ArchitectureCenter\\${var.tag_namespace}-${local.random_value} release value"
  tag_namespace_id = oci_identity_tag_namespace.architecture_center_tag_namespace.id
  freeform_tags    = local.implementation_module

  validator {
    validator_type = "ENUM"
    values         = ["release", "${var.release}"]
  }

  #provisioner "local-exec" {
  #  command = "sleep 120"
  #}
}

locals {
  tag_expression = { "${oci_identity_tag_namespace.architecture_center_tag_namespace.name}.${oci_identity_tag.architecture_center_tag.name}" = var.release }
  random_value   = random_id.tag.hex
}


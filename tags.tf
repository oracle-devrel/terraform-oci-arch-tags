## Copyright (c) 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "random_id" "tag_local" {
  byte_length = 2
}

locals {
  tag_expression = { "${oci_identity_tag_namespace.architecture_center_tag_namespace.name}.${oci_identity_tag.architecture_center_tag.name}" = var.release }

  # if the provided random_id is null then use our own occurrence
  random_value = var.random_id == null ? random_id.tag_local.hex : var.random_id
}

resource "oci_identity_tag_namespace" "architecture_center_tag_namespace" {
  compartment_id = var.compartment_ocid
  name           = "ArchitectureCenter\\${var.tag_namespace}-${local.random_value}"
  description    = "ArchitectureCenter\\${var.tag_namespace}-${local.random_value} dedicated tag namespace"
  freeform_tags  = local.implementation_module

  provisioner "local-exec" {
    command = "sleep 10"
  }

}

resource "oci_identity_tag" "architecture_center_tag" {
  name             = "release"
  description      = "release tag in namespace ${oci_identity_tag_namespace.architecture_center_tag_namespace.name}"
  tag_namespace_id = oci_identity_tag_namespace.architecture_center_tag_namespace.id
  freeform_tags    = local.implementation_module
  validator {
    validator_type = "ENUM"
    values         = ["release", "${var.release}"]
  }
  # NOTE: the name and the values attribute name in the vaidator must line up

  #provisioner "local-exec" {
  #  command = "echo 'architecture center tag provisioner ---------------'"
  #}
  provisioner "local-exec" {
    command = "sleep 120"
  }
}




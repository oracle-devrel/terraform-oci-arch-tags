## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

module "tags" {
  #source           = "./.."
  source           = "github.com/oracle-devrel/terraform-oci-arch-tags"
  tag_namespace    = "terraform-oci-arch-test-name"
  compartment_ocid = var.compartment_ocid
  release          = "1.1" # this is optional, if not provided then 1.0 is defaulted
}

resource "oci_logging_log_group" "test_log_group" {
  display_name   = "OCI Test Log Group for Tagging"
  description    = "This log group exists only to demonstrate the attachment of a predefined tag"
  compartment_id = var.compartment_ocid
  defined_tags    = module.tags.predefined_tags
}

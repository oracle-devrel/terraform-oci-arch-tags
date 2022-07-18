## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

module "tags_manual" {
  #source = "./../.."
  source           = "github.com/oracle-devrel/terraform-oci-arch-tags"
  tag_namespace    = "terraform-oci-arch-test-name-manual"
  compartment_ocid = var.compartment_ocid
  release          = "1.5" # this is optional, if not provided then 1.0 is defaulted
  random_id        = "PW25"
}

resource "oci_logging_log_group" "test_log_group-from-manual" {
  display_name   = "OCILoggingGroupWithMANUALId"
  description    = "This log group exists only to demonstrate the attachment of a predefined tag"
  compartment_id = var.compartment_ocid
  defined_tags   = module.tags_manual.predefined_tags
}

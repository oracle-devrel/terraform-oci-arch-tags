## Copyright (c) 2022, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "predefined-tags" {
  value       = local.tag_expression
  description = "The default generated tags"
}

output "random_id" {
  value       = local.random_value
  description = "Random string used in the tag - provided incase needed elsewhere"
}

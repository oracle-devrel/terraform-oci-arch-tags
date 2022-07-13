# terraform-oci-arch-tags

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-arch-tags)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-arch-tags)

## Introduction
This module is used to generate the standard tags used with the *terraform-oci-arch-*  repos. This means that tags can be established by simply referencing the output of this module when creating other resources.

## Getting Started
The use of this module is deliberately as simple as possible. The module can be used as follows:

```
module "tags" {
  source           = "github.com/oracle-devrel/terraform-oci-arch-tags"
  tag_namespace    = "terraform-oci-arch-test-name"
  tenancy_ocid     = var.tenanct_ocid
  compartment_ocid = var.compartment_ocid
}
```

This is also illustrated and can be tried using the example provided. Populating our own resources becomes like this:

```
defined_tags = tags.predefined-tags
```



### Prerequisites

Terraform

## Notes

### Inputs

The module  uses the following inputs:

| Name          | Description                                                  |
| ------------- | ------------------------------------------------------------ |
| tag_namespace | The namespace to be used within the tag e.g. "test-namespace" |
| release       | If this isn't provided then the value is set to 1.0.  It can not have a null value. |

### Outputs

| Name            | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| predefined-tags | The Terraform resource created                               |
| random_id       | The random value that is used to ensure that multiple deployments of the same resources don't clash. This shared so it can be re-used elsewhere if needed |



## URLs
* [Oracle Tagging documentation](https://docs.oracle.com/en-us/iaas/Content/Tagging/home.htm)

## Deploy Using the Terraform CLI

### Clone the Module

Now, you'll want a local copy of this repo. You can make that with the commands:

```
  git clone https://github.com/oracle-devrel/terraform-oci-arch-tags.git
  cd terraform-oci-arch-tags
  ls
```

### Prerequisites

First off, you'll need to do some pre-deploy setup. That's all detailed [here](https://github.com/cloud-partners/oci-prerequisites).

Create a `terraform.tfvars` file, and specify the following variables:

```
# Authentication
tenancy_ocid         = "<tenancy_ocid>"
user_ocid            = "<user_ocid>"
fingerprint          = "<fingerprint>"
private_key_path     = "<pem_private_key_path>"

private_key_oci      = "~/.ssh/id_rsa"
public_key_oci       = "~/.ssh/id_rsa.pub"

# Region
region = "<oci_region>"

# Compartment
compartment_ocid = "<compartment_ocid>"

# Availability Domain (optional)
availability_domain_name = "<availability_domain_name>"
```

 

### Create the Resources

Run the following commands:

```
  terraform init
  terraform plan
  terraform apply
```

### Destroy the Deployment

When you no longer need the deployment, you can run this command to destroy the resources:

```
terraform destroy
```

 

# Contributing

This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open-source community.

## License
Copyright (c) 2022 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.

ORACLE AND ITS AFFILIATES DO NOT PROVIDE ANY WARRANTY WHATSOEVER, EXPRESS OR IMPLIED, FOR ANY SOFTWARE, MATERIAL OR CONTENT OF ANY KIND CONTAINED OR PRODUCED WITHIN THIS REPOSITORY, AND IN PARTICULAR SPECIFICALLY DISCLAIM ANY AND ALL IMPLIED WARRANTIES OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSE.  FURTHERMORE, ORACLE AND ITS AFFILIATES DO NOT REPRESENT THAT ANY CUSTOMARY SECURITY REVIEW HAS BEEN PERFORMED WITH RESPECT TO ANY SOFTWARE, MATERIAL OR CONTENT CONTAINED OR PRODUCED WITHIN THIS REPOSITORY. IN ADDITION, AND WITHOUT LIMITING THE FOREGOING, THIRD PARTIES MAY HAVE POSTED SOFTWARE, MATERIAL OR CONTENT TO THIS REPOSITORY WITHOUT ANY REVIEW. USE AT YOUR OWN RISK. 
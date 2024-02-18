# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# The following configuration uses a provider which provisions [fake] resources
# to a fictitious cloud vendor called "Fake Web Services". Configuration for
# the fakewebservices provider can be found in provider.tf.
#
# After running the setup script (./scripts/setup.sh), feel free to change these
# resources and 'terraform apply' as much as you'd like! These resources are
# purely for demonstration and created in Terraform Cloud, scoped to your TFC
# user account.
#
# To review the provider and documentation for the available resources and
# schemas, see: https://registry.terraform.io/providers/hashicorp/fakewebservices
#
# If you're looking for the configuration for the remote backend, you can find that
# in backend.tf.

module "aws_naming" {
  source      = "github.com/makdiuk/terraform_module_aws_naming"
  solution    = "stacks"
  environment = "dev"
  region      = var.region
  alteration  = "01"
  team        = var.team

  tags = {
    Owner = "makdiuk"
  }
}

module "aws_vpc" {
  source = "github.com/makdiuk/terraform_module_aws_vpc"
  cidr   = "10.0.0.0/16"
  name   = module.aws_naming.name
  tags   = module.aws_naming.tags
}

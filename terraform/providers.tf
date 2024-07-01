provider "aws" {
  region = local.region
  default_tags {
    tags = {
      owner     = "sandesh.lama@adex.ltd"
      silo      = "intern"
      terraform = "true"
    }
  }
}

provider "aws" {
  region = var.main_region
  default_tags {
    tags = local.required_tags
  }
}

terraform {
  backend "s3" {
    //! These configuration are in template command "terraform init"
    # region = "[REGION]"
    # bucket = "[BUCKET]"
    # key    = "state.tfstate"

    //Decomment if you want it to deploy locally
    // profile = "[YOUR_PROFILE_NAME]"
  }
}

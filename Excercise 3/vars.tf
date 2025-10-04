variable "region" {
  default = "us-east-1"
}

variable "zone1" {
  default = "us-east-1a"
}
variable "amiID" {
  type = map(string)
  default = {
    us-east-1 = "ami-0360c520857e3138f"
    us-east-2 = "ami-0cfde0ea8edd312d4"
  }
}
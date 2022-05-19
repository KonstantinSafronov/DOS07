variable "sgr_id"  {
  type = list(string)
}

variable "pub_net"  {
  type = list(string)
  default     = ["subnet-06c6a70035f2331d6","subnet-0e18d9bad03f4753b"]
}

#variable "s3_backet"  {
#  type = string
#  default     = "hw31task4"
#}


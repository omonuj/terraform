# locals {
#     subnet_ids = tolist(data.aws_subnet_ids.default_subnets.ids)

#     indexed_subnets = zipmap(
#       [for i in range(length(local.subnet_ids)) : "subnet-${i}"],
#       local.subnet_ids
#     )      
# }
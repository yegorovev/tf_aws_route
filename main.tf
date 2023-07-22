data "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  filter {
    name   = "tag:Name"
    values = [var.rt_name]
  }

}

data "aws_internet_gateway" "igw" {
  count = var.igw_name != null ? 1 : 0

  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "tag:Name"
    values = [var.igw_name]
  }
}

resource "aws_route" "route" {
  route_table_id         = data.aws_route_table.rt.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.igw_name != null ? data.aws_internet_gateway.igw[0].id : null
  network_interface_id   = var.network_interface_id
}
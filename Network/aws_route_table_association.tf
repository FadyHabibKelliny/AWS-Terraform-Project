# attached public table with private subent
resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.public-route-table.id

}

resource "aws_route_table_association" "b" {
    subnet_id = aws_subnet.public_subnet2.id
    route_table_id = aws_route_table.public-route-table.id

}

# attached private table with private subent

resource "aws_route_table_association" "c" {
    subnet_id = aws_subnet.private_subnet1.id
    route_table_id = aws_route_table.private-route-table.id

}

resource "aws_route_table_association" "d" {
    subnet_id = aws_subnet.private_subnet2.id
    route_table_id = aws_route_table.private-route-table.id

}
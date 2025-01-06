# Output AWS Public IP (East Instance)

output "aws_east_instance_ip" {
  value = aws_instance.east_instance.public_ip
}

# Output AWS Public IP (West Instance)

output "aws_west_instance_ip" {
  value = aws_instance.west_instance.public_ip
}

# Output Azure VM Details

output "azure_vm_name" {
  value = azurerm_virtual_machine.azure_vm.name
}

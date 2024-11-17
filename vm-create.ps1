$location = "canadacentral"
$vmName = "VMPWScript"

# Define the username and password
$username = "azureadmin"  # Replace with the desired username
$password = "Welcome@12345"  # Replace with the desired password

# Create a PSCredential object using the username and password
$SecurePassword = ConvertTo-SecureString $password -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($username, $SecurePassword)

# Define the resource group (this was missing in your script)
$resourceGroup = "ProjPow"  # Replace with the desired resource group name

# Create a resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create a virtual machine
New-AzVM `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -ImageName "Ubuntu2204" `
  -VirtualNetworkName "myVnet" `
  -SubnetName "mySubnet" `
  -SecurityGroupName "myNetworkSecurityGroup" `
  -PublicIpAddressName "myPublicIp" `
  -Credential $cred

~                        

targetScope = 'subscription'

param resourceGroupName string
param location string

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
}

param name string
param location string
param skuName string
@secure()
param adminPassword string

var sqlServerName = '${name}-sqlserver'
var sqlServerAdminUsername = 'dbadmin'
var databaseName = '${name}-db'

resource sqlServer 'Microsoft.Sql/servers@2023-08-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: sqlServerAdminUsername
    administratorLoginPassword: adminPassword
  }
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2023-08-01-preview' = {
  parent: sqlServer
  name: databaseName
  location: location
  sku: {
    name: skuName
  }
}

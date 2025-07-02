param appName string
param location string

var sqlServerAdminUsername = 'dbadmin'
var sqlServerAdminPassword = 'SuperSecretPassword123!'
var sqlServerName = '${appName}-sqlserver'
var databaseName = '${appName}-db'

resource sqlServer 'Microsoft.Sql/servers@2023-08-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: sqlServerAdminUsername
    administratorLoginPassword: sqlServerAdminPassword
  }
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2023-08-01-preview' = {
  parent: sqlServer
  name: databaseName
  location: location
  sku: {
    name: 'Basic'
  }
}

targetScope = 'subscription'

param appName string

var resourceGroupName = '${appName}-rg'
var location = 'westeurope'

module resourceGroupModule './resources/resource-group.bicep' = {
  name: 'resourceGroupModule'
  params: {
    resourceGroupName: resourceGroupName
    location: location
  }
}

module appInsightsModule './resources/app-insights.bicep' = {
  name: 'appInsightsModule'
  scope: resourceGroup(resourceGroupName)
  params: {
    appName: appName
    location: location
  }
  dependsOn: [
    resourceGroupModule
  ]
}

module serviceModule './resources/app-service.bicep' = {
  name: 'serviceModule'
  scope: resourceGroup(resourceGroupName)
  params: {
    appName: appName
    location: location
    appInsightsInstrumentationKey: appInsightsModule.outputs.appInsightsInstrumentationKey
  }
  dependsOn: [
    resourceGroupModule
  ]
}

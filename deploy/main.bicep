param spring_cloud_name string = 'sping-cloud-service'
param gatewayAppName string = 'gateway'
// param authAppName string = 'auth-service'
// param accountAppName string = 'account-service'
param location string = resourceGroup().location


resource springcloudservice 'Microsoft.AppPlatform/Spring@2021-06-01-preview' = {
  name: spring_cloud_name
  location: location
  sku: {
    name: 'S0'
    tier: 'Standard'
  }
}

resource springcloudserviceconfig 'Microsoft.AppPlatform/Spring/configServers@2021-06-01-preview' = {
  name: '${springcloudservice.name}/default'
  properties: {
    configServer: {
      gitProperty: {
        uri: 'https://github.com/Azure-Samples/piggymetrics-config'
      }
    }
  }
}

resource gateway 'Microsoft.AppPlatform/Spring/apps@2021-06-01-preview' = {
  name: '${springcloudservice.name}/${gatewayAppName}'
  location: location
  properties: {
    public: true
  }
}

// resource authservice 'Microsoft.AppPlatform/Spring/apps@2021-06-01-preview' = {
//   name: '${springcloudservice.name}/${authAppName}'
//   location: location
//   properties: {
//     public: false
//   }
// }

// resource accountservice 'Microsoft.AppPlatform/Spring/apps@2021-06-01-preview' = {
//   name: '${springcloudservice.name}/${accountAppName}'
//   location: location
//   properties: {
//     public: false
//   }
// }

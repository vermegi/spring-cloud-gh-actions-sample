param spring_cloud_name string = 'sping-cloud-service'
param appName string = 'app1'
param location string = resourceGroup().location


resource springcloudservice 'Microsoft.AppPlatform/Spring@2021-06-01-preview' = {
  name: spring_cloud_name
  location: location
  sku: {
    name: 'S0'
    tier: 'Standard'
  }
}

resource app1 'Microsoft.AppPlatform/Spring/apps@2021-06-01-preview' = {
  name: '${springcloudservice.name}/${appName}'
  location: location
  properties: {
    public: true
  }
}


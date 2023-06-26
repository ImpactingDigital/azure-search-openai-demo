param name string
param location string = resourceGroup().location
param tags object = {}

param sku object = {
  name: 'free'
}

param authOptions object = {}


resource search 'Microsoft.Search/searchServices@2021-04-01-preview' = {
  name: name
  location: location
  tags: tags
  
  properties: {
    authOptions: authOptions
    disableLocalAuth: false
    disabledDataExfiltrationOptions: []
    encryptionWithCmk: {
      enforcement: 'Unspecified'
    }
    hostingMode: 'default'
    networkRuleSet: {
      bypass: 'None'
      ipRules: []
    }
    partitionCount: 1
    publicNetworkAccess: 'Enabled'
    replicaCount: 1
  }
  sku: sku
}

output id string = search.id
output endpoint string = 'https://${name}.search.windows.net/'
output name string = search.name

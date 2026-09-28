param name string
param tags object = {}

@description('Short name for the action group (max 12 chars)')
param groupShortName string

@description('Whether the action group is enabled')
param enabled bool = true

@description('List of email receivers')
param emailReceivers array = []

resource actionGroup 'Microsoft.Insights/actionGroups@2023-01-01' = {
  name: name
  location: 'global'
  tags: tags
  properties: {
    groupShortName: groupShortName
    enabled: enabled
    emailReceivers: emailReceivers
  }
}

output id string = actionGroup.id
output name string = actionGroup.name

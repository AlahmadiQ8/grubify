param name string
param tags object = {}

@description('Severity of the alert (0-4)')
param severity int = 3

@description('Whether the alert is enabled')
param enabled bool = true

@description('How often the alert is evaluated (ISO 8601 duration)')
param evaluationFrequency string = 'PT1M'

@description('Time window for the alert evaluation (ISO 8601 duration)')
param windowSize string = 'PT5M'

@description('Resource IDs to scope the alert to')
param scopes array

@description('Action group resource IDs to notify')
param actionGroupIds array

@description('Metric alert criteria')
param criteria object

resource metricAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: name
  location: 'global'
  tags: tags
  properties: {
    severity: severity
    enabled: enabled
    evaluationFrequency: evaluationFrequency
    windowSize: windowSize
    scopes: scopes
    criteria: criteria
    actions: [for actionGroupId in actionGroupIds: {
      actionGroupId: actionGroupId
    }]
  }
}

output id string = metricAlert.id
output name string = metricAlert.name

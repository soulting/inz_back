function GetOciTopLevelCommand_dashboard_service() {
    return 'dashboard-service'
}

function GetOciSubcommands_dashboard_service() {
    $ociSubcommands = @{
        'dashboard-service' = 'dashboard dashboard-group'
        'dashboard-service dashboard' = 'create create-dashboard-v1 delete get list-dashboards update update-dashboard-v1'
        'dashboard-service dashboard-group' = 'create delete get list-dashboard-groups update'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_dashboard_service() {
    $ociCommandsToLongParams = @{
        'dashboard-service dashboard create' = 'dashboard-group-id defined-tags description display-name freeform-tags from-json help max-wait-seconds schema-version wait-for-state wait-interval-seconds'
        'dashboard-service dashboard create-dashboard-v1' = 'config dashboard-group-id defined-tags description display-name freeform-tags from-json help max-wait-seconds wait-for-state wait-interval-seconds widgets'
        'dashboard-service dashboard delete' = 'dashboard-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'dashboard-service dashboard get' = 'dashboard-id from-json help'
        'dashboard-service dashboard list-dashboards' = 'all dashboard-group-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'dashboard-service dashboard update' = 'dashboard-id defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds schema-version wait-for-state wait-interval-seconds'
        'dashboard-service dashboard update-dashboard-v1' = 'config dashboard-id defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds widgets'
        'dashboard-service dashboard-group create' = 'compartment-id defined-tags description display-name freeform-tags from-json help max-wait-seconds wait-for-state wait-interval-seconds'
        'dashboard-service dashboard-group delete' = 'dashboard-group-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'dashboard-service dashboard-group get' = 'dashboard-group-id from-json help'
        'dashboard-service dashboard-group list-dashboard-groups' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'dashboard-service dashboard-group update' = 'dashboard-group-id defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_dashboard_service() {
    $ociCommandsToShortParams = @{
        'dashboard-service dashboard create' = '? h'
        'dashboard-service dashboard create-dashboard-v1' = '? h'
        'dashboard-service dashboard delete' = '? h'
        'dashboard-service dashboard get' = '? h'
        'dashboard-service dashboard list-dashboards' = '? h'
        'dashboard-service dashboard update' = '? h'
        'dashboard-service dashboard update-dashboard-v1' = '? h'
        'dashboard-service dashboard-group create' = '? c h'
        'dashboard-service dashboard-group delete' = '? h'
        'dashboard-service dashboard-group get' = '? h'
        'dashboard-service dashboard-group list-dashboard-groups' = '? c h'
        'dashboard-service dashboard-group update' = '? h'
    }
    return $ociCommandsToShortParams
}
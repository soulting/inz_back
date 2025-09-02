function GetOciTopLevelCommand_dblm() {
    return 'dblm'
}

function GetOciSubcommands_dblm() {
    $ociSubcommands = @{
        'dblm' = 'dblm-patch-management dblm-vulnerability notification-collection patch-databases-collection vulnerability-resource-collection vulnerability-scan vulnerability-scan-collection work-request work-request-error work-request-log-entry'
        'dblm dblm-patch-management' = 'get-patch-management'
        'dblm dblm-vulnerability' = 'get-vulnerability list-aggregated-vulnerability-data list-vulnerabilities'
        'dblm notification-collection' = 'list-notifications'
        'dblm patch-databases-collection' = 'list-databases'
        'dblm vulnerability-resource-collection' = 'list-vulnerability-resources'
        'dblm vulnerability-scan' = 'create get'
        'dblm vulnerability-scan-collection' = 'list-vulnerability-scans'
        'dblm work-request' = 'get list'
        'dblm work-request-error' = 'list'
        'dblm work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_dblm() {
    $ociCommandsToLongParams = @{
        'dblm dblm-patch-management get-patch-management' = 'compartment-id database-release from-json help lifecycle-state time-started-greater-than-or-equal-to time-started-less-than'
        'dblm dblm-vulnerability get-vulnerability' = 'compartment-id database-release from-json help lifecycle-state'
        'dblm dblm-vulnerability list-aggregated-vulnerability-data' = 'all compartment-id database-release from-json help lifecycle-state limit page page-size time-created-greater-than time-ended-less-than'
        'dblm dblm-vulnerability list-vulnerabilities' = 'all compartment-id database-release display-name from-json help lifecycle-state limit page page-size resource-id search-by severity-type sort-by sort-order'
        'dblm notification-collection list-notifications' = 'all compartment-id from-json help limit'
        'dblm patch-databases-collection list-databases' = 'all compartment-id database-release database-type display-name drifter-patch-id from-json help image-compliance image-id lifecycle-state limit page page-size severity-type sort-by sort-order'
        'dblm vulnerability-resource-collection list-vulnerability-resources' = 'all compartment-id cve-id database-release display-name from-json help lifecycle-state limit page page-size patch-recommendation severity-type sort-by sort-order'
        'dblm vulnerability-scan create' = 'compartment-id from-json help max-wait-seconds vulnerability-scan-type wait-for-state wait-interval-seconds'
        'dblm vulnerability-scan get' = 'from-json help vulnerability-scan-id'
        'dblm vulnerability-scan-collection list-vulnerability-scans' = 'all compartment-id display-name from-json help limit page page-size sort-by sort-order time-created-greater-than time-ended-less-than vulnerability-scan-id vulnerability-scan-status vulnerability-scan-type'
        'dblm work-request get' = 'from-json help work-request-id'
        'dblm work-request list' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
        'dblm work-request-error list' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'dblm work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_dblm() {
    $ociCommandsToShortParams = @{
        'dblm dblm-patch-management get-patch-management' = '? c h'
        'dblm dblm-vulnerability get-vulnerability' = '? c h'
        'dblm dblm-vulnerability list-aggregated-vulnerability-data' = '? c h'
        'dblm dblm-vulnerability list-vulnerabilities' = '? c h'
        'dblm notification-collection list-notifications' = '? c h'
        'dblm patch-databases-collection list-databases' = '? c h'
        'dblm vulnerability-resource-collection list-vulnerability-resources' = '? c h'
        'dblm vulnerability-scan create' = '? c h'
        'dblm vulnerability-scan get' = '? h'
        'dblm vulnerability-scan-collection list-vulnerability-scans' = '? c h'
        'dblm work-request get' = '? h'
        'dblm work-request list' = '? c h'
        'dblm work-request-error list' = '? h'
        'dblm work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
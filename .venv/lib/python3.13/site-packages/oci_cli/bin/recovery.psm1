function GetOciTopLevelCommand_recovery() {
    return 'recovery'
}

function GetOciSubcommands_recovery() {
    $ociSubcommands = @{
        'recovery' = 'protected-database protected-database-collection protection-policy protection-policy-collection recovery-service-subnet recovery-service-subnet-collection work-request work-request-error-collection work-request-log-entry-collection work-request-summary-collection'
        'recovery protected-database' = 'cancel-protected-database-deletion change-compartment change-protected-database-subscription create delete fetch-protected-database-configuration get schedule-protected-database-deletion update'
        'recovery protected-database-collection' = 'list-protected-databases'
        'recovery protection-policy' = 'change-compartment create delete get update'
        'recovery protection-policy-collection' = 'list-protection-policies'
        'recovery recovery-service-subnet' = 'change-compartment create delete get update'
        'recovery recovery-service-subnet-collection' = 'list-recovery-service-subnets'
        'recovery work-request' = 'get'
        'recovery work-request-error-collection' = 'list-work-request-errors'
        'recovery work-request-log-entry-collection' = 'list-work-request-logs'
        'recovery work-request-summary-collection' = 'list-work-requests'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_recovery() {
    $ociCommandsToLongParams = @{
        'recovery protected-database cancel-protected-database-deletion' = 'from-json help if-match protected-database-id'
        'recovery protected-database change-compartment' = 'compartment-id from-json help if-match max-wait-seconds protected-database-id wait-for-state wait-interval-seconds'
        'recovery protected-database change-protected-database-subscription' = 'from-json help if-match is-default max-wait-seconds protected-database-id subscription-id wait-for-state wait-interval-seconds'
        'recovery protected-database create' = 'change-rate compartment-id compression-ratio database-id database-size database-size-in-gbs db-unique-name defined-tags display-name freeform-tags from-json help is-redo-logs-shipped max-wait-seconds opc-dry-run password protection-policy-id recovery-service-subnets subscription-id wait-for-state wait-interval-seconds'
        'recovery protected-database delete' = 'deletion-schedule force from-json help if-match max-wait-seconds protected-database-id wait-for-state wait-interval-seconds'
        'recovery protected-database fetch-protected-database-configuration' = 'configuration-type file from-json help if-match protected-database-id'
        'recovery protected-database get' = 'from-json help protected-database-id'
        'recovery protected-database schedule-protected-database-deletion' = 'deletion-schedule from-json help if-match max-wait-seconds protected-database-id wait-for-state wait-interval-seconds'
        'recovery protected-database update' = 'database-size database-size-in-gbs defined-tags display-name force freeform-tags from-json help if-match is-redo-logs-shipped max-wait-seconds password protected-database-id protection-policy-id recovery-service-subnets wait-for-state wait-interval-seconds'
        'recovery protected-database-collection list-protected-databases' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size protection-policy-id recovery-service-subnet-id sort-by sort-order'
        'recovery protection-policy change-compartment' = 'compartment-id from-json help if-match max-wait-seconds protection-policy-id wait-for-state wait-interval-seconds'
        'recovery protection-policy create' = 'backup-retention-period-in-days compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds must-enforce-cloud-locality policy-locked-date-time wait-for-state wait-interval-seconds'
        'recovery protection-policy delete' = 'force from-json help if-match max-wait-seconds protection-policy-id wait-for-state wait-interval-seconds'
        'recovery protection-policy get' = 'from-json help protection-policy-id'
        'recovery protection-policy update' = 'backup-retention-period-in-days defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds policy-locked-date-time protection-policy-id wait-for-state wait-interval-seconds'
        'recovery protection-policy-collection list-protection-policies' = 'all compartment-id display-name from-json help lifecycle-state limit owner page page-size protection-policy-id sort-by sort-order'
        'recovery recovery-service-subnet change-compartment' = 'compartment-id from-json help if-match max-wait-seconds recovery-service-subnet-id wait-for-state wait-interval-seconds'
        'recovery recovery-service-subnet create' = 'compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds nsg-ids subnet-id subnets vcn-id wait-for-state wait-interval-seconds'
        'recovery recovery-service-subnet delete' = 'force from-json help if-match max-wait-seconds recovery-service-subnet-id wait-for-state wait-interval-seconds'
        'recovery recovery-service-subnet get' = 'from-json help recovery-service-subnet-id'
        'recovery recovery-service-subnet update' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds nsg-ids recovery-service-subnet-id subnets wait-for-state wait-interval-seconds'
        'recovery recovery-service-subnet-collection list-recovery-service-subnets' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order vcn-id'
        'recovery work-request get' = 'from-json help work-request-id'
        'recovery work-request-error-collection list-work-request-errors' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'recovery work-request-log-entry-collection list-work-request-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'recovery work-request-summary-collection list-work-requests' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_recovery() {
    $ociCommandsToShortParams = @{
        'recovery protected-database cancel-protected-database-deletion' = '? h'
        'recovery protected-database change-compartment' = '? c h'
        'recovery protected-database change-protected-database-subscription' = '? h'
        'recovery protected-database create' = '? c h'
        'recovery protected-database delete' = '? h'
        'recovery protected-database fetch-protected-database-configuration' = '? h'
        'recovery protected-database get' = '? h'
        'recovery protected-database schedule-protected-database-deletion' = '? h'
        'recovery protected-database update' = '? h'
        'recovery protected-database-collection list-protected-databases' = '? c h'
        'recovery protection-policy change-compartment' = '? c h'
        'recovery protection-policy create' = '? c h'
        'recovery protection-policy delete' = '? h'
        'recovery protection-policy get' = '? h'
        'recovery protection-policy update' = '? h'
        'recovery protection-policy-collection list-protection-policies' = '? c h'
        'recovery recovery-service-subnet change-compartment' = '? c h'
        'recovery recovery-service-subnet create' = '? c h'
        'recovery recovery-service-subnet delete' = '? h'
        'recovery recovery-service-subnet get' = '? h'
        'recovery recovery-service-subnet update' = '? h'
        'recovery recovery-service-subnet-collection list-recovery-service-subnets' = '? c h'
        'recovery work-request get' = '? h'
        'recovery work-request-error-collection list-work-request-errors' = '? h'
        'recovery work-request-log-entry-collection list-work-request-logs' = '? h'
        'recovery work-request-summary-collection list-work-requests' = '? c h'
    }
    return $ociCommandsToShortParams
}
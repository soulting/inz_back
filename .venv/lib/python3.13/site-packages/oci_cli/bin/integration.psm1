function GetOciTopLevelCommand_integration() {
    return 'integration'
}

function GetOciSubcommands_integration() {
    $ociSubcommands = @{
        'integration' = 'integration-instance work-request work-request-error work-request-log-entry'
        'integration integration-instance' = 'add-oracle-managed-custom-endpoint change-compartment change-network-endpoint change-private-endpoint-outbound-connection change-private-endpoint-outbound-connection-none-outbound-connection change-private-endpoint-outbound-connection-private-endpoint-outbound-connection create delete disaster-recovery-failover enable-process-automation extend-data-retention get list remove start stop update'
        'integration work-request' = 'get list'
        'integration work-request-error' = 'list'
        'integration work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_integration() {
    $ociCommandsToLongParams = @{
        'integration integration-instance add-oracle-managed-custom-endpoint' = 'dns-type dns-zone-name from-json help hostname if-match integration-instance-id max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance change-compartment' = 'compartment-id from-json help id if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance change-network-endpoint' = 'from-json help id if-match max-wait-seconds network-endpoint-details wait-for-state wait-interval-seconds'
        'integration integration-instance change-private-endpoint-outbound-connection' = 'from-json help if-match integration-instance-id max-wait-seconds private-endpoint-outbound-connection wait-for-state wait-interval-seconds'
        'integration integration-instance change-private-endpoint-outbound-connection-none-outbound-connection' = 'from-json help if-match integration-instance-id max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance change-private-endpoint-outbound-connection-private-endpoint-outbound-connection' = 'from-json help if-match integration-instance-id max-wait-seconds private-endpoint-outbound-connection-nsg-ids private-endpoint-outbound-connection-subnet-id wait-for-state wait-interval-seconds'
        'integration integration-instance create' = 'alternate-custom-endpoints compartment-id consumption-model custom-endpoint defined-tags display-name domain-id freeform-tags from-json help idcs-at is-byol is-disaster-recovery-enabled is-file-server-enabled is-visual-builder-enabled max-wait-seconds message-packs network-endpoint-details shape type wait-for-state wait-interval-seconds'
        'integration integration-instance delete' = 'force from-json help id if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance disaster-recovery-failover' = 'from-json help if-match integration-instance-id max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance enable-process-automation' = 'from-json help if-match integration-instance-id max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance extend-data-retention' = 'data-retention-period from-json help if-match integration-instance-id max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance get' = 'from-json help id'
        'integration integration-instance list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'integration integration-instance remove' = 'from-json help if-match integration-instance-id max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance start' = 'from-json help id if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance stop' = 'from-json help id if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'integration integration-instance update' = 'alternate-custom-endpoints custom-endpoint defined-tags display-name force freeform-tags from-json help id if-match is-byol is-file-server-enabled is-visual-builder-enabled max-wait-seconds message-packs type wait-for-state wait-interval-seconds'
        'integration work-request get' = 'from-json help work-request-id'
        'integration work-request list' = 'all compartment-id from-json help id limit page page-size'
        'integration work-request-error list' = 'all compartment-id from-json help limit page page-size work-request-id'
        'integration work-request-log-entry list-work-request-logs' = 'all compartment-id from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_integration() {
    $ociCommandsToShortParams = @{
        'integration integration-instance add-oracle-managed-custom-endpoint' = '? h'
        'integration integration-instance change-compartment' = '? c h'
        'integration integration-instance change-network-endpoint' = '? h'
        'integration integration-instance change-private-endpoint-outbound-connection' = '? h'
        'integration integration-instance change-private-endpoint-outbound-connection-none-outbound-connection' = '? h'
        'integration integration-instance change-private-endpoint-outbound-connection-private-endpoint-outbound-connection' = '? h'
        'integration integration-instance create' = '? c h'
        'integration integration-instance delete' = '? h'
        'integration integration-instance disaster-recovery-failover' = '? h'
        'integration integration-instance enable-process-automation' = '? h'
        'integration integration-instance extend-data-retention' = '? h'
        'integration integration-instance get' = '? h'
        'integration integration-instance list' = '? c h'
        'integration integration-instance remove' = '? h'
        'integration integration-instance start' = '? h'
        'integration integration-instance stop' = '? h'
        'integration integration-instance update' = '? h'
        'integration work-request get' = '? h'
        'integration work-request list' = '? c h'
        'integration work-request-error list' = '? c h'
        'integration work-request-log-entry list-work-request-logs' = '? c h'
    }
    return $ociCommandsToShortParams
}
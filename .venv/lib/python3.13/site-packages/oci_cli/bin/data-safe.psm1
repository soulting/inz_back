function GetOciTopLevelCommand_data_safe() {
    return 'data-safe'
}

function GetOciSubcommands_data_safe() {
    $ociSubcommands = @{
        'data-safe' = 'on-prem-connector private-endpoint service target-database work-request work-request-error work-request-log-entry'
        'data-safe on-prem-connector' = 'change-compartment create delete generate-on-prem-connector-configuration get list update update-on-prem-connector-wallet'
        'data-safe private-endpoint' = 'change-compartment create delete get list update'
        'data-safe service' = 'enable get'
        'data-safe target-database' = 'activate change-compartment create deactivate delete download-privilege-script get list update'
        'data-safe work-request' = 'get list'
        'data-safe work-request-error' = 'list'
        'data-safe work-request-log-entry' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_data_safe() {
    $ociCommandsToLongParams = @{
        'data-safe on-prem-connector change-compartment' = 'compartment-id from-json help if-match on-prem-connector-id'
        'data-safe on-prem-connector create' = 'compartment-id defined-tags description display-name freeform-tags from-json help max-wait-seconds wait-for-state wait-interval-seconds'
        'data-safe on-prem-connector delete' = 'force from-json help if-match max-wait-seconds on-prem-connector-id wait-for-state wait-interval-seconds'
        'data-safe on-prem-connector generate-on-prem-connector-configuration' = 'file from-json help if-match on-prem-connector-id password'
        'data-safe on-prem-connector get' = 'from-json help on-prem-connector-id'
        'data-safe on-prem-connector list' = 'access-level all compartment-id compartment-id-in-subtree display-name from-json help limit on-prem-connector-id on-prem-connector-lifecycle-state page page-size sort-by sort-order'
        'data-safe on-prem-connector update' = 'defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds on-prem-connector-id wait-for-state wait-interval-seconds'
        'data-safe on-prem-connector update-on-prem-connector-wallet' = 'from-json help if-match is-update max-wait-seconds on-prem-connector-id wait-for-state wait-interval-seconds'
        'data-safe private-endpoint change-compartment' = 'compartment-id from-json help if-match max-wait-seconds private-endpoint-id wait-for-state wait-interval-seconds'
        'data-safe private-endpoint create' = 'compartment-id defined-tags description display-name freeform-tags from-json help max-wait-seconds nsg-ids private-endpoint-ip subnet-id vcn-id wait-for-state wait-interval-seconds'
        'data-safe private-endpoint delete' = 'force from-json help if-match max-wait-seconds private-endpoint-id wait-for-state wait-interval-seconds'
        'data-safe private-endpoint get' = 'from-json help private-endpoint-id'
        'data-safe private-endpoint list' = 'access-level all compartment-id compartment-id-in-subtree display-name from-json help lifecycle-state limit page page-size sort-by sort-order vcn-id'
        'data-safe private-endpoint update' = 'defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds nsg-ids private-endpoint-id wait-for-state wait-interval-seconds'
        'data-safe service enable' = 'compartment-id from-json help if-match is-enabled max-wait-seconds wait-for-state wait-interval-seconds'
        'data-safe service get' = 'compartment-id from-json help'
        'data-safe target-database activate' = 'credentials from-json help if-match max-wait-seconds target-database-id wait-for-state wait-interval-seconds'
        'data-safe target-database change-compartment' = 'compartment-id from-json help if-match target-database-id'
        'data-safe target-database create' = 'compartment-id connection-option credentials database-details defined-tags description display-name freeform-tags from-json help max-wait-seconds tls-config wait-for-state wait-interval-seconds'
        'data-safe target-database deactivate' = 'from-json help if-match max-wait-seconds target-database-id wait-for-state wait-interval-seconds'
        'data-safe target-database delete' = 'force from-json help if-match max-wait-seconds target-database-id wait-for-state wait-interval-seconds'
        'data-safe target-database download-privilege-script' = 'file from-json help if-match'
        'data-safe target-database get' = 'from-json help target-database-id'
        'data-safe target-database list' = 'access-level all compartment-id compartment-id-in-subtree database-type display-name from-json help infrastructure-type lifecycle-state limit page page-size sort-by sort-order target-database-id'
        'data-safe target-database update' = 'connection-option credentials database-details defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds target-database-id tls-config wait-for-state wait-interval-seconds'
        'data-safe work-request get' = 'from-json help work-request-id'
        'data-safe work-request list' = 'all compartment-id from-json help limit operation-type page page-size resource-id'
        'data-safe work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'data-safe work-request-log-entry list' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_data_safe() {
    $ociCommandsToShortParams = @{
        'data-safe on-prem-connector change-compartment' = '? c h'
        'data-safe on-prem-connector create' = '? c h'
        'data-safe on-prem-connector delete' = '? h'
        'data-safe on-prem-connector generate-on-prem-connector-configuration' = '? h'
        'data-safe on-prem-connector get' = '? h'
        'data-safe on-prem-connector list' = '? c h'
        'data-safe on-prem-connector update' = '? h'
        'data-safe on-prem-connector update-on-prem-connector-wallet' = '? h'
        'data-safe private-endpoint change-compartment' = '? c h'
        'data-safe private-endpoint create' = '? c h'
        'data-safe private-endpoint delete' = '? h'
        'data-safe private-endpoint get' = '? h'
        'data-safe private-endpoint list' = '? c h'
        'data-safe private-endpoint update' = '? h'
        'data-safe service enable' = '? c h'
        'data-safe service get' = '? c h'
        'data-safe target-database activate' = '? h'
        'data-safe target-database change-compartment' = '? c h'
        'data-safe target-database create' = '? c h'
        'data-safe target-database deactivate' = '? h'
        'data-safe target-database delete' = '? h'
        'data-safe target-database download-privilege-script' = '? h'
        'data-safe target-database get' = '? h'
        'data-safe target-database list' = '? c h'
        'data-safe target-database update' = '? h'
        'data-safe work-request get' = '? h'
        'data-safe work-request list' = '? c h'
        'data-safe work-request-error list' = '? h'
        'data-safe work-request-log-entry list' = '? h'
    }
    return $ociCommandsToShortParams
}

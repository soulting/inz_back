function GetOciTopLevelCommand_opa() {
    return 'opa'
}

function GetOciSubcommands_opa() {
    $ociSubcommands = @{
        'opa' = 'opa-instance opa-instance-collection work-request work-request-error work-request-log-entry'
        'opa opa-instance' = 'change-compartment create delete get start stop update'
        'opa opa-instance-collection' = 'list-opa-instances'
        'opa work-request' = 'cancel get list'
        'opa work-request-error' = 'list'
        'opa work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_opa() {
    $ociCommandsToLongParams = @{
        'opa opa-instance change-compartment' = 'compartment-id from-json help if-match max-wait-seconds opa-instance-id wait-for-state wait-interval-seconds'
        'opa opa-instance create' = 'compartment-id consumption-model defined-tags description display-name freeform-tags from-json help idcs-at is-breakglass-enabled max-wait-seconds metering-type shape-name wait-for-state wait-interval-seconds'
        'opa opa-instance delete' = 'force from-json help if-match max-wait-seconds opa-instance-id wait-for-state wait-interval-seconds'
        'opa opa-instance get' = 'from-json help opa-instance-id'
        'opa opa-instance start' = 'from-json help if-match max-wait-seconds opa-instance-id wait-for-state wait-interval-seconds'
        'opa opa-instance stop' = 'from-json help if-match max-wait-seconds opa-instance-id wait-for-state wait-interval-seconds'
        'opa opa-instance update' = 'defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds opa-instance-id wait-for-state wait-interval-seconds'
        'opa opa-instance-collection list-opa-instances' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'opa work-request cancel' = 'force from-json help if-match work-request-id'
        'opa work-request get' = 'from-json help work-request-id'
        'opa work-request list' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
        'opa work-request-error list' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'opa work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_opa() {
    $ociCommandsToShortParams = @{
        'opa opa-instance change-compartment' = '? c h'
        'opa opa-instance create' = '? c h'
        'opa opa-instance delete' = '? h'
        'opa opa-instance get' = '? h'
        'opa opa-instance start' = '? h'
        'opa opa-instance stop' = '? h'
        'opa opa-instance update' = '? h'
        'opa opa-instance-collection list-opa-instances' = '? c h'
        'opa work-request cancel' = '? h'
        'opa work-request get' = '? h'
        'opa work-request list' = '? c h'
        'opa work-request-error list' = '? h'
        'opa work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
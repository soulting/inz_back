function GetOciTopLevelCommand_sch() {
    return 'sch'
}

function GetOciSubcommands_sch() {
    $ociSubcommands = @{
        'sch' = 'connector-plugins service-connector work-request work-request-error work-request-log-entry'
        'sch connector-plugins' = 'get list'
        'sch service-connector' = 'activate change-compartment create deactivate delete get list update'
        'sch work-request' = 'get list'
        'sch work-request-error' = 'list'
        'sch work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_sch() {
    $ociCommandsToLongParams = @{
        'sch connector-plugins get' = 'connector-plugin-name from-json help'
        'sch connector-plugins list' = 'all display-name from-json help lifecycle-state limit name page page-size sort-by sort-order'
        'sch service-connector activate' = 'from-json help if-match max-wait-seconds service-connector-id wait-for-state wait-interval-seconds'
        'sch service-connector change-compartment' = 'compartment-id from-json help if-match max-wait-seconds service-connector-id wait-for-state wait-interval-seconds'
        'sch service-connector create' = 'compartment-id defined-tags description display-name freeform-tags from-json help max-wait-seconds source target tasks wait-for-state wait-interval-seconds'
        'sch service-connector deactivate' = 'from-json help if-match max-wait-seconds service-connector-id wait-for-state wait-interval-seconds'
        'sch service-connector delete' = 'force from-json help if-match max-wait-seconds service-connector-id wait-for-state wait-interval-seconds'
        'sch service-connector get' = 'from-json help service-connector-id'
        'sch service-connector list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'sch service-connector update' = 'defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds service-connector-id source target tasks wait-for-state wait-interval-seconds'
        'sch work-request get' = 'from-json help work-request-id'
        'sch work-request list' = 'all compartment-id from-json help limit page page-size'
        'sch work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'sch work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_sch() {
    $ociCommandsToShortParams = @{
        'sch connector-plugins get' = '? h'
        'sch connector-plugins list' = '? h'
        'sch service-connector activate' = '? h'
        'sch service-connector change-compartment' = '? c h'
        'sch service-connector create' = '? c h'
        'sch service-connector deactivate' = '? h'
        'sch service-connector delete' = '? h'
        'sch service-connector get' = '? h'
        'sch service-connector list' = '? c h'
        'sch service-connector update' = '? h'
        'sch work-request get' = '? h'
        'sch work-request list' = '? c h'
        'sch work-request-error list' = '? h'
        'sch work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
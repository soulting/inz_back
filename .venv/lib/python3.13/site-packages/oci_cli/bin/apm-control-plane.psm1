function GetOciTopLevelCommand_apm_control_plane() {
    return 'apm-control-plane'
}

function GetOciSubcommands_apm_control_plane() {
    $ociSubcommands = @{
        'apm-control-plane' = 'apm-domain data-key work-request work-request-error work-request-log-entry'
        'apm-control-plane apm-domain' = 'change-compartment create delete get list update'
        'apm-control-plane data-key' = 'generate list remove'
        'apm-control-plane work-request' = 'get list list-apm-domain'
        'apm-control-plane work-request-error' = 'list'
        'apm-control-plane work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_apm_control_plane() {
    $ociCommandsToLongParams = @{
        'apm-control-plane apm-domain change-compartment' = 'apm-domain-id compartment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'apm-control-plane apm-domain create' = 'compartment-id defined-tags description display-name freeform-tags from-json help is-free-tier max-wait-seconds wait-for-state wait-interval-seconds'
        'apm-control-plane apm-domain delete' = 'apm-domain-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'apm-control-plane apm-domain get' = 'apm-domain-id from-json help'
        'apm-control-plane apm-domain list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'apm-control-plane apm-domain update' = 'apm-domain-id defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'apm-control-plane data-key generate' = 'apm-domain-id from-json generate-data-keys-list-details help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'apm-control-plane data-key list' = 'all apm-domain-id data-key-type from-json help'
        'apm-control-plane data-key remove' = 'apm-domain-id from-json help if-match max-wait-seconds remove-data-keys-list-details wait-for-state wait-interval-seconds'
        'apm-control-plane work-request get' = 'from-json help work-request-id'
        'apm-control-plane work-request list' = 'all compartment-id from-json help limit page page-size'
        'apm-control-plane work-request list-apm-domain' = 'all apm-domain-id from-json help'
        'apm-control-plane work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'apm-control-plane work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_apm_control_plane() {
    $ociCommandsToShortParams = @{
        'apm-control-plane apm-domain change-compartment' = '? c h'
        'apm-control-plane apm-domain create' = '? c h'
        'apm-control-plane apm-domain delete' = '? h'
        'apm-control-plane apm-domain get' = '? h'
        'apm-control-plane apm-domain list' = '? c h'
        'apm-control-plane apm-domain update' = '? h'
        'apm-control-plane data-key generate' = '? h'
        'apm-control-plane data-key list' = '? h'
        'apm-control-plane data-key remove' = '? h'
        'apm-control-plane work-request get' = '? h'
        'apm-control-plane work-request list' = '? c h'
        'apm-control-plane work-request list-apm-domain' = '? h'
        'apm-control-plane work-request-error list' = '? h'
        'apm-control-plane work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
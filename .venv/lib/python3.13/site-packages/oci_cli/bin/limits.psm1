function GetOciTopLevelCommand_limits() {
    return 'limits'
}

function GetOciSubcommands_limits() {
    $ociSubcommands = @{
        'limits' = 'definition quota resource-availability service value'
        'limits definition' = 'list'
        'limits quota' = 'addlock create delete get list removelock update'
        'limits resource-availability' = 'get'
        'limits service' = 'list'
        'limits value' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_limits() {
    $ociCommandsToLongParams = @{
        'limits definition list' = 'all compartment-id from-json help limit name page page-size service-name sort-by sort-order subscription-id'
        'limits quota addlock' = 'from-json help if-match max-wait-seconds message quota-id related-resource-id type wait-for-state wait-interval-seconds'
        'limits quota create' = 'compartment-id defined-tags description freeform-tags from-json help locks max-wait-seconds name statements wait-for-state wait-interval-seconds'
        'limits quota delete' = 'force from-json help if-match is-lock-override max-wait-seconds quota-id wait-for-state wait-interval-seconds'
        'limits quota get' = 'from-json help quota-id'
        'limits quota list' = 'all compartment-id from-json help lifecycle-state limit name page page-size sort-by sort-order'
        'limits quota removelock' = 'from-json help if-match max-wait-seconds quota-id type wait-for-state wait-interval-seconds'
        'limits quota update' = 'defined-tags description force freeform-tags from-json help if-match is-lock-override max-wait-seconds quota-id statements wait-for-state wait-interval-seconds'
        'limits resource-availability get' = 'availability-domain compartment-id from-json help limit-name service-name subscription-id'
        'limits service list' = 'all compartment-id from-json help limit page page-size sort-by sort-order subscription-id'
        'limits value list' = 'all availability-domain compartment-id from-json help limit name page page-size scope-type service-name sort-by sort-order subscription-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_limits() {
    $ociCommandsToShortParams = @{
        'limits definition list' = '? c h'
        'limits quota addlock' = '? h'
        'limits quota create' = '? c h'
        'limits quota delete' = '? h'
        'limits quota get' = '? h'
        'limits quota list' = '? c h'
        'limits quota removelock' = '? h'
        'limits quota update' = '? h'
        'limits resource-availability get' = '? c h'
        'limits service list' = '? c h'
        'limits value list' = '? c h'
    }
    return $ociCommandsToShortParams
}
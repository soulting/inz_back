function GetOciTopLevelCommand_mngdmac() {
    return 'mngdmac'
}

function GetOciSubcommands_mngdmac() {
    $ociSubcommands = @{
        'mngdmac' = 'mac-device mac-order'
        'mngdmac mac-device' = 'mac-device mac-device-collection'
        'mngdmac mac-device mac-device' = 'get terminate'
        'mngdmac mac-device mac-device-collection' = 'list-mac-devices'
        'mngdmac mac-order' = 'mac-order mac-order-collection work-request work-request-error work-request-log-entry'
        'mngdmac mac-order mac-order' = 'cancel change-compartment create get update'
        'mngdmac mac-order mac-order-collection' = 'list-mac-orders'
        'mngdmac mac-order work-request' = 'cancel get list'
        'mngdmac mac-order work-request-error' = 'list'
        'mngdmac mac-order work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_mngdmac() {
    $ociCommandsToLongParams = @{
        'mngdmac mac-device mac-device get' = 'from-json help mac-device-id mac-order-id'
        'mngdmac mac-device mac-device terminate' = 'from-json help if-match mac-device-id mac-order-id max-wait-seconds wait-for-state wait-interval-seconds'
        'mngdmac mac-device mac-device-collection list-mac-devices' = 'all compartment-id from-json help id lifecycle-state limit mac-order-id page page-size serial-number sort-by sort-order'
        'mngdmac mac-order mac-order cancel' = 'cancel-reason from-json help if-match mac-order-id max-wait-seconds wait-for-state wait-interval-seconds'
        'mngdmac mac-order mac-order change-compartment' = 'compartment-id from-json help if-match mac-order-id max-wait-seconds wait-for-state wait-interval-seconds'
        'mngdmac mac-order mac-order create' = 'commitment-term compartment-id display-name from-json help ip-range max-wait-seconds order-description order-size shape wait-for-state wait-interval-seconds'
        'mngdmac mac-order mac-order get' = 'from-json help mac-order-id'
        'mngdmac mac-order mac-order update' = 'display-name from-json help if-match ip-range mac-order-id max-wait-seconds order-description order-size shape wait-for-state wait-interval-seconds'
        'mngdmac mac-order mac-order-collection list-mac-orders' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'mngdmac mac-order work-request cancel' = 'force from-json help if-match work-request-id'
        'mngdmac mac-order work-request get' = 'from-json help work-request-id'
        'mngdmac mac-order work-request list' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
        'mngdmac mac-order work-request-error list' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'mngdmac mac-order work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_mngdmac() {
    $ociCommandsToShortParams = @{
        'mngdmac mac-device mac-device get' = '? h'
        'mngdmac mac-device mac-device terminate' = '? h'
        'mngdmac mac-device mac-device-collection list-mac-devices' = '? c h'
        'mngdmac mac-order mac-order cancel' = '? h'
        'mngdmac mac-order mac-order change-compartment' = '? c h'
        'mngdmac mac-order mac-order create' = '? c h'
        'mngdmac mac-order mac-order get' = '? h'
        'mngdmac mac-order mac-order update' = '? h'
        'mngdmac mac-order mac-order-collection list-mac-orders' = '? c h'
        'mngdmac mac-order work-request cancel' = '? h'
        'mngdmac mac-order work-request get' = '? h'
        'mngdmac mac-order work-request list' = '? c h'
        'mngdmac mac-order work-request-error list' = '? h'
        'mngdmac mac-order work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
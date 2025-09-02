function GetOciTopLevelCommand_waa() {
    return 'waa'
}

function GetOciSubcommands_waa() {
    $ociSubcommands = @{
        'waa' = 'web-app-acceleration web-app-acceleration-policy work-request work-request-error work-request-log'
        'waa web-app-acceleration' = 'change-compartment create-for-load-balancer delete get list purge-entire-cache update'
        'waa web-app-acceleration-policy' = 'change-compartment create delete get list update'
        'waa work-request' = 'get list'
        'waa work-request-error' = 'list'
        'waa work-request-log' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_waa() {
    $ociCommandsToLongParams = @{
        'waa web-app-acceleration change-compartment' = 'compartment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds web-app-acceleration-id'
        'waa web-app-acceleration create-for-load-balancer' = 'compartment-id defined-tags display-name freeform-tags from-json help load-balancer-id max-wait-seconds system-tags wait-for-state wait-interval-seconds web-app-acceleration-policy-id'
        'waa web-app-acceleration delete' = 'force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds web-app-acceleration-id'
        'waa web-app-acceleration get' = 'from-json help web-app-acceleration-id'
        'waa web-app-acceleration list' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order web-app-acceleration-policy-id'
        'waa web-app-acceleration purge-entire-cache' = 'from-json help max-wait-seconds wait-for-state wait-interval-seconds web-app-acceleration-id'
        'waa web-app-acceleration update' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds system-tags wait-for-state wait-interval-seconds web-app-acceleration-id web-app-acceleration-policy-id'
        'waa web-app-acceleration-policy change-compartment' = 'compartment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds web-app-acceleration-policy-id'
        'waa web-app-acceleration-policy create' = 'compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds response-caching-policy response-compression-policy system-tags wait-for-state wait-interval-seconds'
        'waa web-app-acceleration-policy delete' = 'force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds web-app-acceleration-policy-id'
        'waa web-app-acceleration-policy get' = 'from-json help web-app-acceleration-policy-id'
        'waa web-app-acceleration-policy list' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'waa web-app-acceleration-policy update' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds response-caching-policy response-compression-policy system-tags wait-for-state wait-interval-seconds web-app-acceleration-policy-id'
        'waa work-request get' = 'from-json help work-request-id'
        'waa work-request list' = 'all compartment-id from-json help limit page page-size work-request-id'
        'waa work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'waa work-request-log list' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_waa() {
    $ociCommandsToShortParams = @{
        'waa web-app-acceleration change-compartment' = '? c h'
        'waa web-app-acceleration create-for-load-balancer' = '? c h'
        'waa web-app-acceleration delete' = '? h'
        'waa web-app-acceleration get' = '? h'
        'waa web-app-acceleration list' = '? c h'
        'waa web-app-acceleration purge-entire-cache' = '? h'
        'waa web-app-acceleration update' = '? h'
        'waa web-app-acceleration-policy change-compartment' = '? c h'
        'waa web-app-acceleration-policy create' = '? c h'
        'waa web-app-acceleration-policy delete' = '? h'
        'waa web-app-acceleration-policy get' = '? h'
        'waa web-app-acceleration-policy list' = '? c h'
        'waa web-app-acceleration-policy update' = '? h'
        'waa work-request get' = '? h'
        'waa work-request list' = '? c h'
        'waa work-request-error list' = '? h'
        'waa work-request-log list' = '? h'
    }
    return $ociCommandsToShortParams
}
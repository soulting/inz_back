function GetOciTopLevelCommand_nlb() {
    return 'nlb'
}

function GetOciSubcommands_nlb() {
    $ociSubcommands = @{
        'nlb' = 'backend backend-health backend-set backend-set-health health-checker listener listener-protocols network-load-balancer network-load-balancer-health network-load-balancing-policy work-request work-request-error work-request-log-entry'
        'nlb backend' = 'create delete get list update'
        'nlb backend-health' = 'get'
        'nlb backend-set' = 'create delete get list update'
        'nlb backend-set-health' = 'get'
        'nlb health-checker' = 'get update'
        'nlb listener' = 'create delete get list update'
        'nlb listener-protocols' = 'list'
        'nlb network-load-balancer' = 'change-compartment create delete get list update update-network-security-groups'
        'nlb network-load-balancer-health' = 'get list'
        'nlb network-load-balancing-policy' = 'list'
        'nlb work-request' = 'get list'
        'nlb work-request-error' = 'list'
        'nlb work-request-log-entry' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_nlb() {
    $ociCommandsToLongParams = @{
        'nlb backend create' = 'backend-set-name from-json help if-match ip-address is-backup is-drain is-offline max-wait-seconds name network-load-balancer-id port target-id wait-for-state wait-interval-seconds weight'
        'nlb backend delete' = 'backend-name backend-set-name force from-json help if-match max-wait-seconds network-load-balancer-id wait-for-state wait-interval-seconds'
        'nlb backend get' = 'backend-name backend-set-name from-json help if-none-match network-load-balancer-id'
        'nlb backend list' = 'all backend-set-name from-json help if-none-match limit network-load-balancer-id page page-size sort-order'
        'nlb backend update' = 'backend-name backend-set-name from-json help if-match is-backup is-drain is-offline max-wait-seconds network-load-balancer-id wait-for-state wait-interval-seconds weight'
        'nlb backend-health get' = 'backend-name backend-set-name from-json help network-load-balancer-id'
        'nlb backend-set create' = 'backends from-json health-checker help if-match is-preserve-source max-wait-seconds name network-load-balancer-id policy wait-for-state wait-interval-seconds'
        'nlb backend-set delete' = 'backend-set-name force from-json help if-match max-wait-seconds network-load-balancer-id wait-for-state wait-interval-seconds'
        'nlb backend-set get' = 'backend-set-name from-json help if-none-match network-load-balancer-id'
        'nlb backend-set list' = 'all from-json help if-none-match limit network-load-balancer-id page page-size sort-order'
        'nlb backend-set update' = 'backend-set-name backends force from-json health-checker help if-match is-preserve-source max-wait-seconds network-load-balancer-id policy wait-for-state wait-interval-seconds'
        'nlb backend-set-health get' = 'backend-set-name from-json help network-load-balancer-id'
        'nlb health-checker get' = 'backend-set-name from-json help if-none-match network-load-balancer-id'
        'nlb health-checker update' = 'backend-set-name from-json help if-match interval-in-millis max-wait-seconds network-load-balancer-id port protocol request-data response-body-regex response-data retries return-code timeout-in-millis url-path wait-for-state wait-interval-seconds'
        'nlb listener create' = 'default-backend-set-name from-json help if-match max-wait-seconds name network-load-balancer-id port protocol wait-for-state wait-interval-seconds'
        'nlb listener delete' = 'force from-json help if-match listener-name max-wait-seconds network-load-balancer-id wait-for-state wait-interval-seconds'
        'nlb listener get' = 'from-json help if-none-match listener-name network-load-balancer-id'
        'nlb listener list' = 'all from-json help if-none-match limit network-load-balancer-id page page-size sort-order'
        'nlb listener update' = 'default-backend-set-name from-json help if-match listener-name max-wait-seconds network-load-balancer-id port protocol wait-for-state wait-interval-seconds'
        'nlb listener-protocols list' = 'all from-json help limit page page-size sort-order'
        'nlb network-load-balancer change-compartment' = 'compartment-id from-json help if-match max-wait-seconds network-load-balancer-id wait-for-state wait-interval-seconds'
        'nlb network-load-balancer create' = 'backend-sets compartment-id defined-tags display-name freeform-tags from-json help is-preserve-source-destination is-private listeners max-wait-seconds network-security-group-ids reserved-ips subnet-id wait-for-state wait-interval-seconds'
        'nlb network-load-balancer delete' = 'force from-json help if-match max-wait-seconds network-load-balancer-id wait-for-state wait-interval-seconds'
        'nlb network-load-balancer get' = 'from-json help if-none-match network-load-balancer-id'
        'nlb network-load-balancer list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'nlb network-load-balancer update' = 'defined-tags display-name force freeform-tags from-json help if-match is-preserve-source-destination max-wait-seconds network-load-balancer-id wait-for-state wait-interval-seconds'
        'nlb network-load-balancer update-network-security-groups' = 'force from-json help if-match max-wait-seconds network-load-balancer-id network-security-group-ids wait-for-state wait-interval-seconds'
        'nlb network-load-balancer-health get' = 'from-json help network-load-balancer-id'
        'nlb network-load-balancer-health list' = 'all compartment-id from-json help limit page page-size sort-by sort-order'
        'nlb network-load-balancing-policy list' = 'all from-json help limit page page-size sort-order'
        'nlb work-request get' = 'from-json help work-request-id'
        'nlb work-request list' = 'all compartment-id from-json help limit page page-size'
        'nlb work-request-error list' = 'all compartment-id from-json help limit page page-size work-request-id'
        'nlb work-request-log-entry list' = 'all compartment-id from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_nlb() {
    $ociCommandsToShortParams = @{
        'nlb backend create' = '? h'
        'nlb backend delete' = '? h'
        'nlb backend get' = '? h'
        'nlb backend list' = '? h'
        'nlb backend update' = '? h'
        'nlb backend-health get' = '? h'
        'nlb backend-set create' = '? h'
        'nlb backend-set delete' = '? h'
        'nlb backend-set get' = '? h'
        'nlb backend-set list' = '? h'
        'nlb backend-set update' = '? h'
        'nlb backend-set-health get' = '? h'
        'nlb health-checker get' = '? h'
        'nlb health-checker update' = '? h'
        'nlb listener create' = '? h'
        'nlb listener delete' = '? h'
        'nlb listener get' = '? h'
        'nlb listener list' = '? h'
        'nlb listener update' = '? h'
        'nlb listener-protocols list' = '? h'
        'nlb network-load-balancer change-compartment' = '? c h'
        'nlb network-load-balancer create' = '? c h'
        'nlb network-load-balancer delete' = '? h'
        'nlb network-load-balancer get' = '? h'
        'nlb network-load-balancer list' = '? c h'
        'nlb network-load-balancer update' = '? h'
        'nlb network-load-balancer update-network-security-groups' = '? h'
        'nlb network-load-balancer-health get' = '? h'
        'nlb network-load-balancer-health list' = '? c h'
        'nlb network-load-balancing-policy list' = '? h'
        'nlb work-request get' = '? h'
        'nlb work-request list' = '? c h'
        'nlb work-request-error list' = '? c h'
        'nlb work-request-log-entry list' = '? c h'
    }
    return $ociCommandsToShortParams
}
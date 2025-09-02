function GetOciTopLevelCommand_waf() {
    return 'waf'
}

function GetOciSubcommands_waf() {
    $ociSubcommands = @{
        'waf' = 'network-address-list protection-capability web-app-firewall web-app-firewall-policy work-request work-request-error work-request-log'
        'waf network-address-list' = 'change-compartment create-addresses-list create-vcn-addresses-list delete get list update-addresses-list update-vcn-addresses-list'
        'waf protection-capability' = 'list list-protection-capability-group-tags'
        'waf web-app-firewall' = 'change-compartment create-for-load-balancer delete get list update-for-load-balancer'
        'waf web-app-firewall-policy' = 'change-compartment create delete get list update'
        'waf work-request' = 'get list'
        'waf work-request-error' = 'list'
        'waf work-request-log' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_waf() {
    $ociCommandsToLongParams = @{
        'waf network-address-list change-compartment' = 'compartment-id from-json help if-match max-wait-seconds network-address-list-id wait-for-state wait-interval-seconds'
        'waf network-address-list create-addresses-list' = 'addresses compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds system-tags wait-for-state wait-interval-seconds'
        'waf network-address-list create-vcn-addresses-list' = 'compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds system-tags vcn-addresses wait-for-state wait-interval-seconds'
        'waf network-address-list delete' = 'force from-json help if-match max-wait-seconds network-address-list-id wait-for-state wait-interval-seconds'
        'waf network-address-list get' = 'from-json help network-address-list-id'
        'waf network-address-list list' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'waf network-address-list update-addresses-list' = 'addresses defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds network-address-list-id system-tags wait-for-state wait-interval-seconds'
        'waf network-address-list update-vcn-addresses-list' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds network-address-list-id system-tags vcn-addresses wait-for-state wait-interval-seconds'
        'waf protection-capability list' = 'all compartment-id display-name from-json group-tag help is-latest-version key limit page page-size sort-by sort-order type'
        'waf protection-capability list-protection-capability-group-tags' = 'all compartment-id from-json help limit name page page-size sort-by sort-order type'
        'waf web-app-firewall change-compartment' = 'compartment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds web-app-firewall-id'
        'waf web-app-firewall create-for-load-balancer' = 'compartment-id defined-tags display-name freeform-tags from-json help load-balancer-id max-wait-seconds system-tags wait-for-state wait-interval-seconds web-app-firewall-policy-id'
        'waf web-app-firewall delete' = 'force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds web-app-firewall-id'
        'waf web-app-firewall get' = 'from-json help web-app-firewall-id'
        'waf web-app-firewall list' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order web-app-firewall-policy-id'
        'waf web-app-firewall update-for-load-balancer' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds system-tags wait-for-state wait-interval-seconds web-app-firewall-id web-app-firewall-policy-id'
        'waf web-app-firewall-policy change-compartment' = 'compartment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds web-app-firewall-policy-id'
        'waf web-app-firewall-policy create' = 'actions compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds request-access-control request-protection request-rate-limiting response-access-control response-protection system-tags wait-for-state wait-interval-seconds'
        'waf web-app-firewall-policy delete' = 'force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds web-app-firewall-policy-id'
        'waf web-app-firewall-policy get' = 'from-json help web-app-firewall-policy-id'
        'waf web-app-firewall-policy list' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'waf web-app-firewall-policy update' = 'actions defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds request-access-control request-protection request-rate-limiting response-access-control response-protection system-tags wait-for-state wait-interval-seconds web-app-firewall-policy-id'
        'waf work-request get' = 'from-json help work-request-id'
        'waf work-request list' = 'all compartment-id from-json help limit page page-size work-request-id'
        'waf work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'waf work-request-log list' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_waf() {
    $ociCommandsToShortParams = @{
        'waf network-address-list change-compartment' = '? c h'
        'waf network-address-list create-addresses-list' = '? c h'
        'waf network-address-list create-vcn-addresses-list' = '? c h'
        'waf network-address-list delete' = '? h'
        'waf network-address-list get' = '? h'
        'waf network-address-list list' = '? c h'
        'waf network-address-list update-addresses-list' = '? h'
        'waf network-address-list update-vcn-addresses-list' = '? h'
        'waf protection-capability list' = '? c h'
        'waf protection-capability list-protection-capability-group-tags' = '? c h'
        'waf web-app-firewall change-compartment' = '? c h'
        'waf web-app-firewall create-for-load-balancer' = '? c h'
        'waf web-app-firewall delete' = '? h'
        'waf web-app-firewall get' = '? h'
        'waf web-app-firewall list' = '? c h'
        'waf web-app-firewall update-for-load-balancer' = '? h'
        'waf web-app-firewall-policy change-compartment' = '? c h'
        'waf web-app-firewall-policy create' = '? c h'
        'waf web-app-firewall-policy delete' = '? h'
        'waf web-app-firewall-policy get' = '? h'
        'waf web-app-firewall-policy list' = '? c h'
        'waf web-app-firewall-policy update' = '? h'
        'waf work-request get' = '? h'
        'waf work-request list' = '? c h'
        'waf work-request-error list' = '? h'
        'waf work-request-log list' = '? h'
    }
    return $ociCommandsToShortParams
}
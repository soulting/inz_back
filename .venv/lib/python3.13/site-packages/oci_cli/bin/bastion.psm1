function GetOciTopLevelCommand_bastion() {
    return 'bastion'
}

function GetOciSubcommands_bastion() {
    $ociSubcommands = @{
        'bastion' = 'bastion session work-request work-request-error work-request-log-entry'
        'bastion bastion' = 'change-compartment create delete get list update'
        'bastion session' = 'create create-managed-ssh create-port-forwarding create-session-create-dynamic-port-forwarding-session-target-resource-details delete get list update'
        'bastion work-request' = 'get list'
        'bastion work-request-error' = 'list'
        'bastion work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_bastion() {
    $ociCommandsToLongParams = @{
        'bastion bastion change-compartment' = 'bastion-id compartment-id from-json help if-match'
        'bastion bastion create' = 'bastion-type client-cidr-list compartment-id defined-tags dns-proxy-status freeform-tags from-json help jump-host-ips max-session-ttl max-wait-seconds name phone-book-entry target-subnet-id wait-for-state wait-interval-seconds'
        'bastion bastion delete' = 'bastion-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'bastion bastion get' = 'bastion-id from-json help'
        'bastion bastion list' = 'all bastion-id bastion-lifecycle-state compartment-id from-json help limit name page page-size sort-by sort-order'
        'bastion bastion update' = 'bastion-id client-cidr-list defined-tags force freeform-tags from-json help if-match jump-host-ips max-session-ttl max-wait-seconds wait-for-state wait-interval-seconds'
        'bastion session create' = 'bastion-id display-name from-json help key-type max-wait-seconds session-ttl-in-seconds ssh-public-key-file target-resource-details wait-for-state wait-interval-seconds'
        'bastion session create-managed-ssh' = 'bastion-id display-name from-json help key-type max-wait-seconds session-ttl ssh-public-key-file target-os-username target-port target-private-ip target-resource-id wait-for-state wait-interval-seconds'
        'bastion session create-port-forwarding' = 'bastion-id display-name from-json help key-type max-wait-seconds session-ttl ssh-public-key-file target-port target-private-ip target-resource-details-target-resource-fqdn target-resource-id wait-for-state wait-interval-seconds'
        'bastion session create-session-create-dynamic-port-forwarding-session-target-resource-details' = 'bastion-id display-name from-json help key-details key-type max-wait-seconds session-ttl-in-seconds wait-for-state wait-interval-seconds'
        'bastion session delete' = 'force from-json help if-match max-wait-seconds session-id wait-for-state wait-interval-seconds'
        'bastion session get' = 'from-json help session-id'
        'bastion session list' = 'all bastion-id display-name from-json help limit page page-size session-id session-lifecycle-state sort-by sort-order'
        'bastion session update' = 'display-name from-json help if-match max-wait-seconds session-id wait-for-state wait-interval-seconds'
        'bastion work-request get' = 'from-json help work-request-id'
        'bastion work-request list' = 'all compartment-id from-json help limit page page-size'
        'bastion work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'bastion work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_bastion() {
    $ociCommandsToShortParams = @{
        'bastion bastion change-compartment' = '? c h'
        'bastion bastion create' = '? c h'
        'bastion bastion delete' = '? h'
        'bastion bastion get' = '? h'
        'bastion bastion list' = '? c h'
        'bastion bastion update' = '? h'
        'bastion session create' = '? h'
        'bastion session create-managed-ssh' = '? h'
        'bastion session create-port-forwarding' = '? h'
        'bastion session create-session-create-dynamic-port-forwarding-session-target-resource-details' = '? h'
        'bastion session delete' = '? h'
        'bastion session get' = '? h'
        'bastion session list' = '? h'
        'bastion session update' = '? h'
        'bastion work-request get' = '? h'
        'bastion work-request list' = '? c h'
        'bastion work-request-error list' = '? h'
        'bastion work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
function GetOciTopLevelCommand_desktops() {
    return 'desktops'
}

function GetOciSubcommands_desktops() {
    $ociSubcommands = @{
        'desktops' = 'desktop desktop-pool work-request'
        'desktops desktop' = 'delete get list start stop update'
        'desktops desktop-pool' = 'change-compartment create delete get list list-desktops list-volumes start stop update'
        'desktops work-request' = 'cancel get list list-errors list-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_desktops() {
    $ociCommandsToLongParams = @{
        'desktops desktop delete' = 'desktop-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'desktops desktop get' = 'desktop-id from-json help'
        'desktops desktop list' = 'all availability-domain compartment-id desktop-pool-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'desktops desktop start' = 'desktop-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'desktops desktop stop' = 'desktop-id from-json help if-match is-soft-stop max-wait-seconds wait-for-state wait-interval-seconds'
        'desktops desktop update' = 'defined-tags desktop-id display-name force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'desktops desktop-pool change-compartment' = 'compartment-id desktop-pool-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'desktops desktop-pool create' = 'are-privileged-users availability-domain availability-policy compartment-id contact-details defined-tags description device-policy display-name freeform-tags from-json help image is-storage-enabled max-wait-seconds maximum-size network-configuration nsg-ids private-access-details session-lifecycle-actions shape-config shape-name standby-size storage-backup-policy-id storage-size-in-gbs time-start-scheduled time-stop-scheduled use-dedicated-vm-host wait-for-state wait-interval-seconds'
        'desktops desktop-pool delete' = 'are-volumes-preserved desktop-pool-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'desktops desktop-pool get' = 'desktop-pool-id from-json help'
        'desktops desktop-pool list' = 'all availability-domain compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'desktops desktop-pool list-desktops' = 'all availability-domain compartment-id desktop-pool-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'desktops desktop-pool list-volumes' = 'all availability-domain compartment-id desktop-pool-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'desktops desktop-pool start' = 'desktop-pool-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'desktops desktop-pool stop' = 'desktop-pool-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'desktops desktop-pool update' = 'availability-policy contact-details defined-tags description desktop-pool-id device-policy display-name force freeform-tags from-json help if-match max-wait-seconds maximum-size session-lifecycle-actions standby-size time-start-scheduled time-stop-scheduled wait-for-state wait-interval-seconds'
        'desktops work-request cancel' = 'force from-json help if-match work-request-id'
        'desktops work-request get' = 'from-json help work-request-id'
        'desktops work-request list' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
        'desktops work-request list-errors' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'desktops work-request list-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_desktops() {
    $ociCommandsToShortParams = @{
        'desktops desktop delete' = '? h'
        'desktops desktop get' = '? h'
        'desktops desktop list' = '? c h'
        'desktops desktop start' = '? h'
        'desktops desktop stop' = '? h'
        'desktops desktop update' = '? h'
        'desktops desktop-pool change-compartment' = '? c h'
        'desktops desktop-pool create' = '? c h'
        'desktops desktop-pool delete' = '? h'
        'desktops desktop-pool get' = '? h'
        'desktops desktop-pool list' = '? c h'
        'desktops desktop-pool list-desktops' = '? c h'
        'desktops desktop-pool list-volumes' = '? c h'
        'desktops desktop-pool start' = '? h'
        'desktops desktop-pool stop' = '? h'
        'desktops desktop-pool update' = '? h'
        'desktops work-request cancel' = '? h'
        'desktops work-request get' = '? h'
        'desktops work-request list' = '? c h'
        'desktops work-request list-errors' = '? h'
        'desktops work-request list-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
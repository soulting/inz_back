function GetOciTopLevelCommand_tenant_manager_control_plane() {
    return 'tenant-manager-control-plane'
}

function GetOciSubcommands_tenant_manager_control_plane() {
    $ociSubcommands = @{
        'tenant-manager-control-plane' = 'link recipient-invitation sender-invitation work-request'
        'tenant-manager-control-plane link' = 'link'
        'tenant-manager-control-plane link link' = 'delete get list'
        'tenant-manager-control-plane recipient-invitation' = 'recipient-invitation'
        'tenant-manager-control-plane recipient-invitation recipient-invitation' = 'accept get ignore list update'
        'tenant-manager-control-plane sender-invitation' = 'sender-invitation'
        'tenant-manager-control-plane sender-invitation sender-invitation' = 'cancel create get list update'
        'tenant-manager-control-plane work-request' = 'work-request work-request-error work-request-log-entry'
        'tenant-manager-control-plane work-request work-request' = 'get list'
        'tenant-manager-control-plane work-request work-request-error' = 'list'
        'tenant-manager-control-plane work-request work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_tenant_manager_control_plane() {
    $ociCommandsToLongParams = @{
        'tenant-manager-control-plane link link delete' = 'force from-json help if-match link-id max-wait-seconds wait-for-state wait-interval-seconds'
        'tenant-manager-control-plane link link get' = 'from-json help link-id'
        'tenant-manager-control-plane link link list' = 'all child-tenancy-id from-json help lifecycle-state limit page page-size parent-tenancy-id sort-order'
        'tenant-manager-control-plane recipient-invitation recipient-invitation accept' = 'from-json help if-match max-wait-seconds recipient-invitation-id wait-for-state wait-interval-seconds'
        'tenant-manager-control-plane recipient-invitation recipient-invitation get' = 'from-json help recipient-invitation-id'
        'tenant-manager-control-plane recipient-invitation recipient-invitation ignore' = 'from-json help if-match max-wait-seconds recipient-invitation-id wait-for-state wait-interval-seconds'
        'tenant-manager-control-plane recipient-invitation recipient-invitation list' = 'all compartment-id from-json help lifecycle-state page sender-tenancy-id status'
        'tenant-manager-control-plane recipient-invitation recipient-invitation update' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds recipient-invitation-id wait-for-state wait-interval-seconds'
        'tenant-manager-control-plane sender-invitation sender-invitation cancel' = 'from-json help if-match max-wait-seconds sender-invitation-id wait-for-state wait-interval-seconds'
        'tenant-manager-control-plane sender-invitation sender-invitation create' = 'compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds recipient-email-address recipient-tenancy-id wait-for-state wait-interval-seconds'
        'tenant-manager-control-plane sender-invitation sender-invitation get' = 'from-json help sender-invitation-id'
        'tenant-manager-control-plane sender-invitation sender-invitation list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size recipient-tenancy-id sort-by sort-order status'
        'tenant-manager-control-plane sender-invitation sender-invitation update' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds sender-invitation-id wait-for-state wait-interval-seconds'
        'tenant-manager-control-plane work-request work-request get' = 'from-json help work-request-id'
        'tenant-manager-control-plane work-request work-request list' = 'all compartment-id from-json help limit page page-size sort-order'
        'tenant-manager-control-plane work-request work-request-error list' = 'all compartment-id from-json help limit page page-size sort-order work-request-id'
        'tenant-manager-control-plane work-request work-request-log-entry list-work-request-logs' = 'all compartment-id from-json help limit page page-size sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_tenant_manager_control_plane() {
    $ociCommandsToShortParams = @{
        'tenant-manager-control-plane link link delete' = '? h'
        'tenant-manager-control-plane link link get' = '? h'
        'tenant-manager-control-plane link link list' = '? h'
        'tenant-manager-control-plane recipient-invitation recipient-invitation accept' = '? h'
        'tenant-manager-control-plane recipient-invitation recipient-invitation get' = '? h'
        'tenant-manager-control-plane recipient-invitation recipient-invitation ignore' = '? h'
        'tenant-manager-control-plane recipient-invitation recipient-invitation list' = '? c h'
        'tenant-manager-control-plane recipient-invitation recipient-invitation update' = '? h'
        'tenant-manager-control-plane sender-invitation sender-invitation cancel' = '? h'
        'tenant-manager-control-plane sender-invitation sender-invitation create' = '? c h'
        'tenant-manager-control-plane sender-invitation sender-invitation get' = '? h'
        'tenant-manager-control-plane sender-invitation sender-invitation list' = '? c h'
        'tenant-manager-control-plane sender-invitation sender-invitation update' = '? h'
        'tenant-manager-control-plane work-request work-request get' = '? h'
        'tenant-manager-control-plane work-request work-request list' = '? c h'
        'tenant-manager-control-plane work-request work-request-error list' = '? c h'
        'tenant-manager-control-plane work-request work-request-log-entry list-work-request-logs' = '? c h'
    }
    return $ociCommandsToShortParams
}
function GetOciTopLevelCommand_management_agent() {
    return 'management-agent'
}

function GetOciSubcommands_management_agent() {
    $ociSubcommands = @{
        'management-agent' = 'agent agent-image install-key plugin work-request work-request-error work-request-log-entry'
        'management-agent agent' = 'delete deploy-plugins get list list-availability-histories update'
        'management-agent agent-image' = 'list'
        'management-agent install-key' = 'create delete get get-install-key-content list update'
        'management-agent plugin' = 'list'
        'management-agent work-request' = 'delete get list'
        'management-agent work-request-error' = 'list'
        'management-agent work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_management_agent() {
    $ociCommandsToLongParams = @{
        'management-agent agent delete' = 'agent-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'management-agent agent deploy-plugins' = 'agent-compartment-id agent-ids from-json help max-wait-seconds plugin-ids wait-for-state wait-interval-seconds'
        'management-agent agent get' = 'agent-id from-json help'
        'management-agent agent list' = 'agent-version all compartment-id display-name from-json help lifecycle-state limit page page-size platform-type plugin-name sort-by sort-order'
        'management-agent agent list-availability-histories' = 'all from-json help limit management-agent-id page page-size sort-by sort-order time-availability-status-ended-greater-than time-availability-status-started-less-than'
        'management-agent agent update' = 'agent-id defined-tags display-name force freeform-tags from-json help if-match is-agent-auto-upgradable max-wait-seconds wait-for-state wait-interval-seconds'
        'management-agent agent-image list' = 'all compartment-id from-json help lifecycle-state limit name page page-size sort-by sort-order'
        'management-agent install-key create' = 'allowed-key-install-count compartment-id display-name from-json help max-wait-seconds time-expires wait-for-state wait-interval-seconds'
        'management-agent install-key delete' = 'force from-json help if-match install-key-id max-wait-seconds wait-for-state wait-interval-seconds'
        'management-agent install-key get' = 'from-json help install-key-id'
        'management-agent install-key get-install-key-content' = 'file from-json help management-agent-install-key-id plugin-name'
        'management-agent install-key list' = 'access-level all compartment-id compartment-id-in-subtree display-name from-json help lifecycle-state page sort-by sort-order'
        'management-agent install-key update' = 'display-name from-json help if-match install-key-id is-key-active max-wait-seconds wait-for-state wait-interval-seconds'
        'management-agent plugin list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'management-agent work-request delete' = 'force from-json help if-match work-request-id'
        'management-agent work-request get' = 'from-json help work-request-id'
        'management-agent work-request list' = 'agent-id all compartment-id from-json help limit page page-size sort-by sort-order status time-created-greater-than-or-equal-to'
        'management-agent work-request-error list' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'management-agent work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_management_agent() {
    $ociCommandsToShortParams = @{
        'management-agent agent delete' = '? h'
        'management-agent agent deploy-plugins' = '? h'
        'management-agent agent get' = '? h'
        'management-agent agent list' = '? c h'
        'management-agent agent list-availability-histories' = '? h'
        'management-agent agent update' = '? h'
        'management-agent agent-image list' = '? c h'
        'management-agent install-key create' = '? c h'
        'management-agent install-key delete' = '? h'
        'management-agent install-key get' = '? h'
        'management-agent install-key get-install-key-content' = '? h'
        'management-agent install-key list' = '? c h'
        'management-agent install-key update' = '? h'
        'management-agent plugin list' = '? c h'
        'management-agent work-request delete' = '? h'
        'management-agent work-request get' = '? h'
        'management-agent work-request list' = '? c h'
        'management-agent work-request-error list' = '? h'
        'management-agent work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
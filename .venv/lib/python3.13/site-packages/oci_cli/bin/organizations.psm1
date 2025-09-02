function GetOciTopLevelCommand_organizations() {
    return 'organizations'
}

function GetOciSubcommands_organizations() {
    $ociSubcommands = @{
        'organizations' = 'domain domain-governance link order recipient-invitation sender-invitation work-request work-request-error work-request-log-entry'
        'organizations domain' = 'create delete get list update'
        'organizations domain-governance' = 'create delete get list update'
        'organizations link' = 'delete get list'
        'organizations order' = 'activate get'
        'organizations recipient-invitation' = 'accept get ignore list update'
        'organizations sender-invitation' = 'cancel create get list update'
        'organizations work-request' = 'get list'
        'organizations work-request-error' = 'list'
        'organizations work-request-log-entry' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_organizations() {
    $ociCommandsToLongParams = @{
        'organizations domain create' = 'compartment-id defined-tags domain-name freeform-tags from-json help is-governance-enabled max-wait-seconds subscription-email wait-for-state wait-interval-seconds'
        'organizations domain delete' = 'domain-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'organizations domain get' = 'domain-id from-json help'
        'organizations domain list' = 'all compartment-id domain-id from-json help lifecycle-state limit name page page-size sort-by sort-order status'
        'organizations domain update' = 'defined-tags domain-id force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'organizations domain-governance create' = 'compartment-id defined-tags domain-id freeform-tags from-json help max-wait-seconds ons-subscription-id ons-topic-id subscription-email wait-for-state wait-interval-seconds'
        'organizations domain-governance delete' = 'domain-governance-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'organizations domain-governance get' = 'domain-governance-id from-json help'
        'organizations domain-governance list' = 'all compartment-id domain-governance-id domain-id from-json help lifecycle-state limit name page page-size sort-by sort-order'
        'organizations domain-governance update' = 'defined-tags domain-governance-id force freeform-tags from-json help if-match is-governance-enabled max-wait-seconds subscription-email wait-for-state wait-interval-seconds'
        'organizations link delete' = 'force from-json help if-match link-id max-wait-seconds wait-for-state wait-interval-seconds'
        'organizations link get' = 'from-json help link-id'
        'organizations link list' = 'all child-tenancy-id from-json help lifecycle-state limit page page-size parent-tenancy-id sort-order'
        'organizations order activate' = 'activation-token compartment-id from-json help max-wait-seconds wait-for-state wait-interval-seconds'
        'organizations order get' = 'activation-token from-json help'
        'organizations recipient-invitation accept' = 'from-json help if-match max-wait-seconds recipient-invitation-id wait-for-state wait-interval-seconds'
        'organizations recipient-invitation get' = 'from-json help recipient-invitation-id'
        'organizations recipient-invitation ignore' = 'from-json help if-match max-wait-seconds recipient-invitation-id wait-for-state wait-interval-seconds'
        'organizations recipient-invitation list' = 'all compartment-id from-json help lifecycle-state page sender-tenancy-id status'
        'organizations recipient-invitation update' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds recipient-invitation-id wait-for-state wait-interval-seconds'
        'organizations sender-invitation cancel' = 'from-json help if-match max-wait-seconds sender-invitation-id wait-for-state wait-interval-seconds'
        'organizations sender-invitation create' = 'compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds recipient-email-address recipient-tenancy-id wait-for-state wait-interval-seconds'
        'organizations sender-invitation get' = 'from-json help sender-invitation-id'
        'organizations sender-invitation list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size recipient-tenancy-id sort-by sort-order status'
        'organizations sender-invitation update' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds sender-invitation-id wait-for-state wait-interval-seconds'
        'organizations work-request get' = 'from-json help work-request-id'
        'organizations work-request list' = 'all compartment-id from-json help limit page page-size sort-order'
        'organizations work-request-error list' = 'all from-json help limit page page-size sort-order work-request-id'
        'organizations work-request-log-entry list' = 'all from-json help limit page page-size sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_organizations() {
    $ociCommandsToShortParams = @{
        'organizations domain create' = '? c h'
        'organizations domain delete' = '? h'
        'organizations domain get' = '? h'
        'organizations domain list' = '? c h'
        'organizations domain update' = '? h'
        'organizations domain-governance create' = '? c h'
        'organizations domain-governance delete' = '? h'
        'organizations domain-governance get' = '? h'
        'organizations domain-governance list' = '? c h'
        'organizations domain-governance update' = '? h'
        'organizations link delete' = '? h'
        'organizations link get' = '? h'
        'organizations link list' = '? h'
        'organizations order activate' = '? c h'
        'organizations order get' = '? h'
        'organizations recipient-invitation accept' = '? h'
        'organizations recipient-invitation get' = '? h'
        'organizations recipient-invitation ignore' = '? h'
        'organizations recipient-invitation list' = '? c h'
        'organizations recipient-invitation update' = '? h'
        'organizations sender-invitation cancel' = '? h'
        'organizations sender-invitation create' = '? c h'
        'organizations sender-invitation get' = '? h'
        'organizations sender-invitation list' = '? c h'
        'organizations sender-invitation update' = '? h'
        'organizations work-request get' = '? h'
        'organizations work-request list' = '? c h'
        'organizations work-request-error list' = '? h'
        'organizations work-request-log-entry list' = '? h'
    }
    return $ociCommandsToShortParams
}
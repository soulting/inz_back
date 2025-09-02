function GetOciTopLevelCommand_logging() {
    return 'logging'
}

function GetOciSubcommands_logging() {
    $ociSubcommands = @{
        'logging' = 'agent-configuration log log-group log-saved-search service work-request work-request-error work-request-log'
        'logging agent-configuration' = 'change-compartment create create-log-configuration create-unified-agent-configuration-unified-agent-monitoring-configuration-details delete get list update update-log-configuration update-unified-agent-configuration-unified-agent-monitoring-configuration-details'
        'logging log' = 'change-log-group create delete get list update'
        'logging log-group' = 'change-compartment create delete get list update'
        'logging log-saved-search' = 'change-compartment create delete get list update'
        'logging service' = 'list'
        'logging work-request' = 'delete get list'
        'logging work-request-error' = 'list'
        'logging work-request-log' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_logging() {
    $ociCommandsToLongParams = @{
        'logging agent-configuration change-compartment' = 'compartment-id config-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'logging agent-configuration create' = 'compartment-id defined-tags description display-name freeform-tags from-json group-association help is-enabled max-wait-seconds service-configuration wait-for-state wait-interval-seconds'
        'logging agent-configuration create-log-configuration' = 'compartment-id defined-tags description display-name freeform-tags from-json group-association help is-enabled max-wait-seconds service-conf-destination service-conf-sources service-configuration-filter wait-for-state wait-interval-seconds'
        'logging agent-configuration create-unified-agent-configuration-unified-agent-monitoring-configuration-details' = 'compartment-id defined-tags description display-name freeform-tags from-json group-association help is-enabled max-wait-seconds service-configuration-application-configurations wait-for-state wait-interval-seconds'
        'logging agent-configuration delete' = 'config-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'logging agent-configuration get' = 'config-id from-json help'
        'logging agent-configuration list' = 'all compartment-id compartmentidinsubtree display-name from-json group-id help lifecycle-state limit log-id page page-size sort-by sort-order'
        'logging agent-configuration update' = 'config-id defined-tags description display-name force freeform-tags from-json group-association help if-match is-enabled max-wait-seconds service-configuration wait-for-state wait-interval-seconds'
        'logging agent-configuration update-log-configuration' = 'config-id defined-tags description display-name force freeform-tags from-json group-association help if-match is-enabled max-wait-seconds service-conf-destination service-conf-sources service-configuration-filter wait-for-state wait-interval-seconds'
        'logging agent-configuration update-unified-agent-configuration-unified-agent-monitoring-configuration-details' = 'defined-tags description display-name force freeform-tags from-json group-association help if-match is-enabled max-wait-seconds service-configuration-application-configurations unified-agent-configuration-id wait-for-state wait-interval-seconds'
        'logging log change-log-group' = 'from-json help if-match log-group-id log-id max-wait-seconds target-log-group-id wait-for-state wait-interval-seconds'
        'logging log create' = 'configuration defined-tags display-name freeform-tags from-json help is-enabled log-group-id log-type max-wait-seconds retention-duration wait-for-state wait-interval-seconds'
        'logging log delete' = 'force from-json help if-match log-group-id log-id max-wait-seconds wait-for-state wait-interval-seconds'
        'logging log get' = 'from-json help log-group-id log-id'
        'logging log list' = 'all display-name from-json help lifecycle-state limit log-group-id log-type page page-size sort-by sort-order source-resource source-service'
        'logging log update' = 'configuration defined-tags display-name force freeform-tags from-json help if-match is-enabled log-group-id log-id max-wait-seconds retention-duration wait-for-state wait-interval-seconds'
        'logging log-group change-compartment' = 'compartment-id from-json help if-match log-group-id max-wait-seconds wait-for-state wait-interval-seconds'
        'logging log-group create' = 'compartment-id defined-tags description display-name freeform-tags from-json help max-wait-seconds wait-for-state wait-interval-seconds'
        'logging log-group delete' = 'force from-json help if-match log-group-id max-wait-seconds wait-for-state wait-interval-seconds'
        'logging log-group get' = 'from-json help log-group-id'
        'logging log-group list' = 'all compartment-id compartmentidinsubtree display-name from-json help limit page page-size sort-by sort-order'
        'logging log-group update' = 'defined-tags description display-name force freeform-tags from-json help if-match log-group-id max-wait-seconds wait-for-state wait-interval-seconds'
        'logging log-saved-search change-compartment' = 'compartment-id from-json help if-match log-saved-search-id'
        'logging log-saved-search create' = 'compartment-id defined-tags description freeform-tags from-json help log-query max-wait-seconds name wait-for-state wait-interval-seconds'
        'logging log-saved-search delete' = 'force from-json help if-match log-saved-search-id max-wait-seconds wait-for-state wait-interval-seconds'
        'logging log-saved-search get' = 'from-json help log-saved-search-id'
        'logging log-saved-search list' = 'all compartment-id from-json help limit log-saved-search-id name page page-size sort-by sort-order'
        'logging log-saved-search update' = 'defined-tags description force freeform-tags from-json help if-match log-query log-saved-search-id max-wait-seconds name wait-for-state wait-interval-seconds'
        'logging service list' = 'all from-json help'
        'logging work-request delete' = 'force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds work-request-id'
        'logging work-request get' = 'from-json help work-request-id'
        'logging work-request list' = 'all compartment-id from-json help id limit page page-size sort-by sort-order status'
        'logging work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'logging work-request-log list' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_logging() {
    $ociCommandsToShortParams = @{
        'logging agent-configuration change-compartment' = '? c h'
        'logging agent-configuration create' = '? c h'
        'logging agent-configuration create-log-configuration' = '? c h'
        'logging agent-configuration create-unified-agent-configuration-unified-agent-monitoring-configuration-details' = '? c h'
        'logging agent-configuration delete' = '? h'
        'logging agent-configuration get' = '? h'
        'logging agent-configuration list' = '? c h'
        'logging agent-configuration update' = '? h'
        'logging agent-configuration update-log-configuration' = '? h'
        'logging agent-configuration update-unified-agent-configuration-unified-agent-monitoring-configuration-details' = '? h'
        'logging log change-log-group' = '? h'
        'logging log create' = '? h'
        'logging log delete' = '? h'
        'logging log get' = '? h'
        'logging log list' = '? h'
        'logging log update' = '? h'
        'logging log-group change-compartment' = '? c h'
        'logging log-group create' = '? c h'
        'logging log-group delete' = '? h'
        'logging log-group get' = '? h'
        'logging log-group list' = '? c h'
        'logging log-group update' = '? h'
        'logging log-saved-search change-compartment' = '? c h'
        'logging log-saved-search create' = '? c h'
        'logging log-saved-search delete' = '? h'
        'logging log-saved-search get' = '? h'
        'logging log-saved-search list' = '? c h'
        'logging log-saved-search update' = '? h'
        'logging service list' = '? h'
        'logging work-request delete' = '? h'
        'logging work-request get' = '? h'
        'logging work-request list' = '? c h'
        'logging work-request-error list' = '? h'
        'logging work-request-log list' = '? h'
    }
    return $ociCommandsToShortParams
}
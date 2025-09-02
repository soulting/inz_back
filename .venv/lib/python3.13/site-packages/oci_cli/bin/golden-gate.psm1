function GetOciTopLevelCommand_golden_gate() {
    return 'golden-gate'
}

function GetOciSubcommands_golden_gate() {
    $ociSubcommands = @{
        'golden-gate' = 'database-registration deployment deployment-backup work-request work-request-error work-request-log-entry'
        'golden-gate database-registration' = 'change-compartment create delete get list update'
        'golden-gate deployment' = 'change-compartment create delete get list start start-deployment-default-start-deployment-details stop stop-deployment-default-stop-deployment-details update upgrade upgrade-deployment-upgrade-deployment-current-release-details'
        'golden-gate deployment-backup' = 'change-compartment create delete get list restore-deployment restore-deployment-default-restore-deployment-details update'
        'golden-gate work-request' = 'get list'
        'golden-gate work-request-error' = 'list'
        'golden-gate work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_golden_gate() {
    $ociCommandsToLongParams = @{
        'golden-gate database-registration change-compartment' = 'compartment-id database-registration-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate database-registration create' = 'alias-name compartment-id connection-string database-id defined-tags description display-name fqdn freeform-tags from-json help ip-address key-id max-wait-seconds password secret-compartment-id subnet-id username vault-id wait-for-state wait-interval-seconds wallet'
        'golden-gate database-registration delete' = 'database-registration-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate database-registration get' = 'database-registration-id from-json help'
        'golden-gate database-registration list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'golden-gate database-registration update' = 'alias-name connection-string database-registration-id defined-tags description display-name force fqdn freeform-tags from-json help if-match max-wait-seconds password username wait-for-state wait-interval-seconds wallet'
        'golden-gate deployment change-compartment' = 'compartment-id deployment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate deployment create' = 'compartment-id cpu-core-count defined-tags deployment-backup-id deployment-type description display-name fqdn freeform-tags from-json help is-auto-scaling-enabled is-public license-model max-wait-seconds nsg-ids ogg-data subnet-id wait-for-state wait-interval-seconds'
        'golden-gate deployment delete' = 'deployment-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate deployment get' = 'deployment-id from-json help'
        'golden-gate deployment list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'golden-gate deployment start' = 'deployment-id from-json help if-match max-wait-seconds type wait-for-state wait-interval-seconds'
        'golden-gate deployment start-deployment-default-start-deployment-details' = 'deployment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate deployment stop' = 'deployment-id from-json help if-match max-wait-seconds type wait-for-state wait-interval-seconds'
        'golden-gate deployment stop-deployment-default-stop-deployment-details' = 'deployment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate deployment update' = 'cpu-core-count defined-tags deployment-id description display-name force fqdn freeform-tags from-json help if-match is-auto-scaling-enabled is-public license-model max-wait-seconds nsg-ids ogg-data subnet-id wait-for-state wait-interval-seconds'
        'golden-gate deployment upgrade' = 'deployment-id from-json help if-match max-wait-seconds type wait-for-state wait-interval-seconds'
        'golden-gate deployment upgrade-deployment-upgrade-deployment-current-release-details' = 'deployment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate deployment-backup change-compartment' = 'compartment-id deployment-backup-id from-json help if-match'
        'golden-gate deployment-backup create' = 'bucket-name compartment-id defined-tags deployment-id display-name freeform-tags from-json help max-wait-seconds namespace-name object-name wait-for-state wait-interval-seconds'
        'golden-gate deployment-backup delete' = 'deployment-backup-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate deployment-backup get' = 'deployment-backup-id from-json help'
        'golden-gate deployment-backup list' = 'all compartment-id deployment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'golden-gate deployment-backup restore-deployment' = 'deployment-backup-id from-json help if-match max-wait-seconds type wait-for-state wait-interval-seconds'
        'golden-gate deployment-backup restore-deployment-default-restore-deployment-details' = 'deployment-backup-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate deployment-backup update' = 'defined-tags deployment-backup-id force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'golden-gate work-request get' = 'from-json help work-request-id'
        'golden-gate work-request list' = 'all compartment-id from-json help limit page page-size'
        'golden-gate work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'golden-gate work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_golden_gate() {
    $ociCommandsToShortParams = @{
        'golden-gate database-registration change-compartment' = '? c h'
        'golden-gate database-registration create' = '? c h'
        'golden-gate database-registration delete' = '? h'
        'golden-gate database-registration get' = '? h'
        'golden-gate database-registration list' = '? c h'
        'golden-gate database-registration update' = '? h'
        'golden-gate deployment change-compartment' = '? c h'
        'golden-gate deployment create' = '? c h'
        'golden-gate deployment delete' = '? h'
        'golden-gate deployment get' = '? h'
        'golden-gate deployment list' = '? c h'
        'golden-gate deployment start' = '? h'
        'golden-gate deployment start-deployment-default-start-deployment-details' = '? h'
        'golden-gate deployment stop' = '? h'
        'golden-gate deployment stop-deployment-default-stop-deployment-details' = '? h'
        'golden-gate deployment update' = '? h'
        'golden-gate deployment upgrade' = '? h'
        'golden-gate deployment upgrade-deployment-upgrade-deployment-current-release-details' = '? h'
        'golden-gate deployment-backup change-compartment' = '? c h'
        'golden-gate deployment-backup create' = '? c h'
        'golden-gate deployment-backup delete' = '? h'
        'golden-gate deployment-backup get' = '? h'
        'golden-gate deployment-backup list' = '? c h'
        'golden-gate deployment-backup restore-deployment' = '? h'
        'golden-gate deployment-backup restore-deployment-default-restore-deployment-details' = '? h'
        'golden-gate deployment-backup update' = '? h'
        'golden-gate work-request get' = '? h'
        'golden-gate work-request list' = '? c h'
        'golden-gate work-request-error list' = '? h'
        'golden-gate work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
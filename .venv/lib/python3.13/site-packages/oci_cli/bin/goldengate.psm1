function GetOciTopLevelCommand_goldengate() {
    return 'goldengate'
}

function GetOciSubcommands_goldengate() {
    $ociSubcommands = @{
        'goldengate' = 'database-registration deployment deployment-backup work-request work-request-error work-request-log-entry'
        'goldengate database-registration' = 'change-compartment create delete get list update'
        'goldengate deployment' = 'change-compartment create delete get list start stop update upgrade'
        'goldengate deployment-backup' = 'change-compartment create delete get list restore-deployment update'
        'goldengate work-request' = 'get list'
        'goldengate work-request-error' = 'list'
        'goldengate work-request-log-entry' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_goldengate() {
    $ociCommandsToLongParams = @{
        'goldengate database-registration change-compartment' = 'compartment-id database-registration-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate database-registration create' = 'alias-name compartment-id connection-string database-id defined-tags description display-name fqdn freeform-tags from-json help ip-address key-id max-wait-seconds password secret-compartment-id subnet-id username vault-id wait-for-state wait-interval-seconds wallet'
        'goldengate database-registration delete' = 'database-registration-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate database-registration get' = 'database-registration-id from-json help'
        'goldengate database-registration list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'goldengate database-registration update' = 'alias-name connection-string database-registration-id defined-tags description display-name force fqdn freeform-tags from-json help if-match max-wait-seconds password username wait-for-state wait-interval-seconds wallet'
        'goldengate deployment change-compartment' = 'compartment-id deployment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate deployment create' = 'admin-password admin-username certificate-file compartment-id cpu-core-count defined-tags deployment-backup-id deployment-name description display-name fqdn freeform-tags from-json help is-auto-scaling-enabled is-public license-model max-wait-seconds nsg-ids private-key-file subnet-id wait-for-state wait-interval-seconds'
        'goldengate deployment delete' = 'deployment-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate deployment get' = 'deployment-id from-json help'
        'goldengate deployment list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'goldengate deployment start' = 'deployment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate deployment stop' = 'deployment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate deployment update' = 'admin-password admin-username certificate-file cpu-core-count defined-tags deployment-id description display-name force fqdn freeform-tags from-json help if-match is-auto-scaling-enabled is-public license-model max-wait-seconds nsg-ids private-key-file subnet-id wait-for-state wait-interval-seconds'
        'goldengate deployment upgrade' = 'deployment-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate deployment-backup change-compartment' = 'compartment-id deployment-backup-id from-json help if-match'
        'goldengate deployment-backup create' = 'bucket-name compartment-id defined-tags deployment-id display-name freeform-tags from-json help max-wait-seconds namespace-name object-name wait-for-state wait-interval-seconds'
        'goldengate deployment-backup delete' = 'deployment-backup-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate deployment-backup get' = 'deployment-backup-id from-json help'
        'goldengate deployment-backup list' = 'all compartment-id deployment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'goldengate deployment-backup restore-deployment' = 'deployment-backup-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate deployment-backup update' = 'defined-tags deployment-backup-id force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'goldengate work-request get' = 'from-json help work-request-id'
        'goldengate work-request list' = 'all compartment-id from-json help limit page page-size'
        'goldengate work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'goldengate work-request-log-entry list' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_goldengate() {
    $ociCommandsToShortParams = @{
        'goldengate database-registration change-compartment' = '? c h'
        'goldengate database-registration create' = '? c h'
        'goldengate database-registration delete' = '? h'
        'goldengate database-registration get' = '? h'
        'goldengate database-registration list' = '? c h'
        'goldengate database-registration update' = '? h'
        'goldengate deployment change-compartment' = '? c h'
        'goldengate deployment create' = '? c h'
        'goldengate deployment delete' = '? h'
        'goldengate deployment get' = '? h'
        'goldengate deployment list' = '? c h'
        'goldengate deployment start' = '? h'
        'goldengate deployment stop' = '? h'
        'goldengate deployment update' = '? h'
        'goldengate deployment upgrade' = '? h'
        'goldengate deployment-backup change-compartment' = '? c h'
        'goldengate deployment-backup create' = '? c h'
        'goldengate deployment-backup delete' = '? h'
        'goldengate deployment-backup get' = '? h'
        'goldengate deployment-backup list' = '? c h'
        'goldengate deployment-backup restore-deployment' = '? h'
        'goldengate deployment-backup update' = '? h'
        'goldengate work-request get' = '? h'
        'goldengate work-request list' = '? c h'
        'goldengate work-request-error list' = '? h'
        'goldengate work-request-log-entry list' = '? h'
    }
    return $ociCommandsToShortParams
}
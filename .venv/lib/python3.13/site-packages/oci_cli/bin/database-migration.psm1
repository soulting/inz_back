function GetOciTopLevelCommand_database_migration() {
    return 'database-migration'
}

function GetOciSubcommands_database_migration() {
    $ociSubcommands = @{
        'database-migration' = 'agent agent-image connection job job-output migration work-request work-request-error work-request-logs'
        'database-migration agent' = 'change-compartment delete get list update'
        'database-migration agent-image' = 'list'
        'database-migration connection' = 'change-compartment create delete get list update'
        'database-migration job' = 'abort delete get get-job-output-content list resume update'
        'database-migration job-output' = 'list'
        'database-migration migration' = 'change-compartment clone create delete evaluate get list retrieve-supported-phases start update'
        'database-migration work-request' = 'get list'
        'database-migration work-request-error' = 'list'
        'database-migration work-request-logs' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_database_migration() {
    $ociCommandsToLongParams = @{
        'database-migration agent change-compartment' = 'agent-id compartment-id from-json help if-match'
        'database-migration agent delete' = 'agent-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'database-migration agent get' = 'agent-id from-json help'
        'database-migration agent list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'database-migration agent update' = 'agent-id agent-version compartment-id defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds public-key public-key-file stream-id wait-for-state wait-interval-seconds'
        'database-migration agent-image list' = 'all from-json help limit page page-size sort-order'
        'database-migration connection change-compartment' = 'compartment-id connection-id from-json help if-match'
        'database-migration connection create' = 'admin-credentials certificate-tdn compartment-id connect-descriptor database-id database-type defined-tags display-name freeform-tags from-json help max-wait-seconds private-endpoint ssh-details sshkey-file tls-keystore tls-keystore-file tls-wallet tls-wallet-file vault-details wait-for-state wait-interval-seconds'
        'database-migration connection delete' = 'connection-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'database-migration connection get' = 'connection-id from-json help'
        'database-migration connection list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'database-migration connection update' = 'admin-credentials certificate-tdn connect-descriptor connection-id database-id defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds private-endpoint ssh-details sshkey-file tls-keystore tls-keystore-file tls-wallet tls-wallet-file vault-details wait-for-state wait-interval-seconds'
        'database-migration job abort' = 'from-json help if-match job-id max-wait-seconds wait-for-state wait-interval-seconds'
        'database-migration job delete' = 'force from-json help if-match job-id max-wait-seconds wait-for-state wait-interval-seconds'
        'database-migration job get' = 'from-json help job-id'
        'database-migration job get-job-output-content' = 'file from-json help job-id'
        'database-migration job list' = 'all display-name from-json help lifecycle-state limit migration-id page page-size sort-by sort-order'
        'database-migration job resume' = 'from-json help if-match job-id max-wait-seconds wait-after wait-for-state wait-interval-seconds'
        'database-migration job update' = 'defined-tags display-name force freeform-tags from-json help if-match job-id max-wait-seconds wait-for-state wait-interval-seconds'
        'database-migration job-output list' = 'all from-json help job-id limit page page-size'
        'database-migration migration change-compartment' = 'compartment-id from-json help if-match migration-id'
        'database-migration migration clone' = 'agent-id compartment-id defined-tags display-name exclude-objects freeform-tags from-json help if-match max-wait-seconds migration-id source-container-database-connection-id source-database-connection-id target-database-connection-id vault-details wait-for-state wait-interval-seconds'
        'database-migration migration create' = 'agent-id compartment-id data-transfer-medium-details datapump-settings defined-tags display-name exclude-objects freeform-tags from-json golden-gate-details help max-wait-seconds source-container-database-connection-id source-database-connection-id target-database-connection-id type vault-details wait-for-state wait-interval-seconds'
        'database-migration migration delete' = 'force from-json help if-match max-wait-seconds migration-id wait-for-state wait-interval-seconds'
        'database-migration migration evaluate' = 'from-json help if-match max-wait-seconds migration-id wait-for-state wait-interval-seconds'
        'database-migration migration get' = 'from-json help if-match migration-id'
        'database-migration migration list' = 'all compartment-id display-name from-json help lifecycle-details lifecycle-state limit page page-size sort-by sort-order'
        'database-migration migration retrieve-supported-phases' = 'from-json help migration-id'
        'database-migration migration start' = 'from-json help if-match max-wait-seconds migration-id wait-after wait-for-state wait-interval-seconds'
        'database-migration migration update' = 'agent-id data-transfer-medium-details datapump-settings defined-tags display-name exclude-objects force freeform-tags from-json golden-gate-details help if-match max-wait-seconds migration-id source-container-database-connection-id source-database-connection-id target-database-connection-id type vault-details wait-for-state wait-interval-seconds'
        'database-migration work-request get' = 'from-json help work-request-id'
        'database-migration work-request list' = 'all compartment-id display-name from-json help limit page page-size resource-id sort-by sort-order'
        'database-migration work-request-error list' = 'all display-name from-json help limit page page-size sort-by sort-order work-request-id'
        'database-migration work-request-logs list' = 'all display-name from-json help limit page page-size sort-by sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_database_migration() {
    $ociCommandsToShortParams = @{
        'database-migration agent change-compartment' = '? c h'
        'database-migration agent delete' = '? h'
        'database-migration agent get' = '? h'
        'database-migration agent list' = '? c h'
        'database-migration agent update' = '? c h'
        'database-migration agent-image list' = '? h'
        'database-migration connection change-compartment' = '? c h'
        'database-migration connection create' = '? c h'
        'database-migration connection delete' = '? h'
        'database-migration connection get' = '? h'
        'database-migration connection list' = '? c h'
        'database-migration connection update' = '? h'
        'database-migration job abort' = '? h'
        'database-migration job delete' = '? h'
        'database-migration job get' = '? h'
        'database-migration job get-job-output-content' = '? h'
        'database-migration job list' = '? h'
        'database-migration job resume' = '? h'
        'database-migration job update' = '? h'
        'database-migration job-output list' = '? h'
        'database-migration migration change-compartment' = '? c h'
        'database-migration migration clone' = '? c h'
        'database-migration migration create' = '? c h'
        'database-migration migration delete' = '? h'
        'database-migration migration evaluate' = '? h'
        'database-migration migration get' = '? h'
        'database-migration migration list' = '? c h'
        'database-migration migration retrieve-supported-phases' = '? h'
        'database-migration migration start' = '? h'
        'database-migration migration update' = '? h'
        'database-migration work-request get' = '? h'
        'database-migration work-request list' = '? c h'
        'database-migration work-request-error list' = '? h'
        'database-migration work-request-logs list' = '? h'
    }
    return $ociCommandsToShortParams
}
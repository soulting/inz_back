function GetOciTopLevelCommand_usage_api() {
    return 'usage-api'
}

function GetOciSubcommands_usage_api() {
    $ociSubcommands = @{
        'usage-api' = 'configuration query usage-summary'
        'usage-api configuration' = 'request-summarized'
        'usage-api query' = 'create delete get list update'
        'usage-api usage-summary' = 'request-summarized-usages'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_usage_api() {
    $ociCommandsToLongParams = @{
        'usage-api configuration request-summarized' = 'from-json help tenant-id'
        'usage-api query create' = 'compartment-id from-json help query-definition'
        'usage-api query delete' = 'force from-json help if-match query-id'
        'usage-api query get' = 'from-json help query-id'
        'usage-api query list' = 'all compartment-id from-json help limit page page-size sort-by sort-order'
        'usage-api query update' = 'force from-json help if-match query-definition query-id'
        'usage-api usage-summary request-summarized-usages' = 'compartment-depth filter forecast from-json granularity group-by group-by-tag help is-aggregate-by-time limit page query-type tenant-id time-usage-ended time-usage-started'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_usage_api() {
    $ociCommandsToShortParams = @{
        'usage-api configuration request-summarized' = '? h'
        'usage-api query create' = '? c h'
        'usage-api query delete' = '? h'
        'usage-api query get' = '? h'
        'usage-api query list' = '? c h'
        'usage-api query update' = '? h'
        'usage-api usage-summary request-summarized-usages' = '? h'
    }
    return $ociCommandsToShortParams
}
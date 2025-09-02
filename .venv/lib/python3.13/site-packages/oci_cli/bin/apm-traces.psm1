function GetOciTopLevelCommand_apm_traces() {
    return 'apm-traces'
}

function GetOciSubcommands_apm_traces() {
    $ociSubcommands = @{
        'apm-traces' = 'query trace'
        'apm-traces query' = 'query-response quick-picks'
        'apm-traces query query-response' = 'run-query'
        'apm-traces query quick-picks' = 'list'
        'apm-traces trace' = 'span trace'
        'apm-traces trace span' = 'get'
        'apm-traces trace trace' = 'get'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_apm_traces() {
    $ociCommandsToLongParams = @{
        'apm-traces query query-response run-query' = 'apm-domain-id from-json help limit page query-text start-time-gte start-time-lt'
        'apm-traces query quick-picks list' = 'all apm-domain-id from-json help limit page page-size'
        'apm-traces trace span get' = 'apm-domain-id from-json help span-key trace-key'
        'apm-traces trace trace get' = 'apm-domain-id from-json help trace-key'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_apm_traces() {
    $ociCommandsToShortParams = @{
        'apm-traces query query-response run-query' = '? h'
        'apm-traces query quick-picks list' = '? h'
        'apm-traces trace span get' = '? h'
        'apm-traces trace trace get' = '? h'
    }
    return $ociCommandsToShortParams
}
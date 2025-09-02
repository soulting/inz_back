function GetOciTopLevelCommand_logging_search() {
    return 'logging-search'
}

function GetOciSubcommands_logging_search() {
    $ociSubcommands = @{
        'logging-search' = 'search-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_logging_search() {
    $ociCommandsToLongParams = @{
        'logging-search search-logs' = 'from-json help is-return-field-info limit page search-query time-end time-start'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_logging_search() {
    $ociCommandsToShortParams = @{
        'logging-search search-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
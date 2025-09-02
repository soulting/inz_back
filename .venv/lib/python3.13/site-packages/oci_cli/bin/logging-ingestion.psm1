function GetOciTopLevelCommand_logging_ingestion() {
    return 'logging-ingestion'
}

function GetOciSubcommands_logging_ingestion() {
    $ociSubcommands = @{
        'logging-ingestion' = 'put-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_logging_ingestion() {
    $ociCommandsToLongParams = @{
        'logging-ingestion put-logs' = 'agent-timestamp from-json help log-entry-batches log-id opc-agent-version specversion'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_logging_ingestion() {
    $ociCommandsToShortParams = @{
        'logging-ingestion put-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
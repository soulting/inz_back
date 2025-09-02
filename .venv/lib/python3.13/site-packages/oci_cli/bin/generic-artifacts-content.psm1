function GetOciTopLevelCommand_generic_artifacts_content() {
    return 'generic-artifacts-content'
}

function GetOciSubcommands_generic_artifacts_content() {
    $ociSubcommands = @{
        'generic-artifacts-content' = 'generic-artifact'
        'generic-artifacts-content generic-artifact' = 'get-generic-artifact-content get-generic-artifact-content-by-path put-generic-artifact-content-by-path'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_generic_artifacts_content() {
    $ociCommandsToLongParams = @{
        'generic-artifacts-content generic-artifact get-generic-artifact-content' = 'artifact-id file from-json help'
        'generic-artifacts-content generic-artifact get-generic-artifact-content-by-path' = 'artifact-path file from-json help repository-id version-parameterconflict'
        'generic-artifacts-content generic-artifact put-generic-artifact-content-by-path' = 'artifact-path from-json generic-artifact-content-body help if-match repository-id version-parameterconflict'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_generic_artifacts_content() {
    $ociCommandsToShortParams = @{
        'generic-artifacts-content generic-artifact get-generic-artifact-content' = '? h'
        'generic-artifacts-content generic-artifact get-generic-artifact-content-by-path' = '? h'
        'generic-artifacts-content generic-artifact put-generic-artifact-content-by-path' = '? h'
    }
    return $ociCommandsToShortParams
}
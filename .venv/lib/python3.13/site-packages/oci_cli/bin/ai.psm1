function GetOciTopLevelCommand_ai() {
    return 'ai'
}

function GetOciSubcommands_ai() {
    $ociSubcommands = @{
        'ai' = 'language'
        'ai language' = 'detect-entities detect-key-phrases detect-language detect-sentiments detect-text-classification'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_ai() {
    $ociCommandsToLongParams = @{
        'ai language detect-entities' = 'from-json help is-pii model-version text'
        'ai language detect-key-phrases' = 'from-json help text'
        'ai language detect-language' = 'from-json help text'
        'ai language detect-sentiments' = 'from-json help text'
        'ai language detect-text-classification' = 'from-json help text'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_ai() {
    $ociCommandsToShortParams = @{
        'ai language detect-entities' = '? h'
        'ai language detect-key-phrases' = '? h'
        'ai language detect-language' = '? h'
        'ai language detect-sentiments' = '? h'
        'ai language detect-text-classification' = '? h'
    }
    return $ociCommandsToShortParams
}
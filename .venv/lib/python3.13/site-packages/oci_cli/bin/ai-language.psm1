function GetOciTopLevelCommand_ai_language() {
    return 'ai-language'
}

function GetOciSubcommands_ai_language() {
    $ociSubcommands = @{
        'ai-language' = 'detect-dominant-language-result detect-language-entities-result detect-language-key-phrases-result detect-language-sentiments-result detect-language-text-classification-result'
        'ai-language detect-dominant-language-result' = 'detect-dominant-language'
        'ai-language detect-language-entities-result' = 'detect-language-entities'
        'ai-language detect-language-key-phrases-result' = 'detect-language-key-phrases'
        'ai-language detect-language-sentiments-result' = 'detect-language-sentiments'
        'ai-language detect-language-text-classification-result' = 'detect-language-text-classification'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_ai_language() {
    $ociCommandsToLongParams = @{
        'ai-language detect-dominant-language-result detect-dominant-language' = 'from-json help text'
        'ai-language detect-language-entities-result detect-language-entities' = 'from-json help is-pii model-version text'
        'ai-language detect-language-key-phrases-result detect-language-key-phrases' = 'from-json help text'
        'ai-language detect-language-sentiments-result detect-language-sentiments' = 'from-json help text'
        'ai-language detect-language-text-classification-result detect-language-text-classification' = 'from-json help text'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_ai_language() {
    $ociCommandsToShortParams = @{
        'ai-language detect-dominant-language-result detect-dominant-language' = '? h'
        'ai-language detect-language-entities-result detect-language-entities' = '? h'
        'ai-language detect-language-key-phrases-result detect-language-key-phrases' = '? h'
        'ai-language detect-language-sentiments-result detect-language-sentiments' = '? h'
        'ai-language detect-language-text-classification-result detect-language-text-classification' = '? h'
    }
    return $ociCommandsToShortParams
}
function GetOciTopLevelCommand_certificates() {
    return 'certificates'
}

function GetOciSubcommands_certificates() {
    $ociSubcommands = @{
        'certificates' = 'ca-bundle certificate-authority-bundle certificate-authority-bundle-version certificate-bundle certificate-bundle-version'
        'certificates ca-bundle' = 'get'
        'certificates certificate-authority-bundle' = 'get'
        'certificates certificate-authority-bundle-version' = 'list'
        'certificates certificate-bundle' = 'get'
        'certificates certificate-bundle-version' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_certificates() {
    $ociCommandsToLongParams = @{
        'certificates ca-bundle get' = 'ca-bundle-id from-json help'
        'certificates certificate-authority-bundle get' = 'certificate-authority-id from-json help stage version-name version-number'
        'certificates certificate-authority-bundle-version list' = 'all certificate-authority-id from-json help sort-by sort-order'
        'certificates certificate-bundle get' = 'bundle-type certificate-id from-json help stage version-name version-number'
        'certificates certificate-bundle-version list' = 'all certificate-id from-json help sort-by sort-order'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_certificates() {
    $ociCommandsToShortParams = @{
        'certificates ca-bundle get' = '? h'
        'certificates certificate-authority-bundle get' = '? h'
        'certificates certificate-authority-bundle-version list' = '? h'
        'certificates certificate-bundle get' = '? h'
        'certificates certificate-bundle-version list' = '? h'
    }
    return $ociCommandsToShortParams
}
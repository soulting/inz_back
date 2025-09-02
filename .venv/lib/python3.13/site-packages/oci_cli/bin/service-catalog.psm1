function GetOciTopLevelCommand_service_catalog() {
    return 'service-catalog'
}

function GetOciSubcommands_service_catalog() {
    $ociSubcommands = @{
        'service-catalog' = 'application-summary private-application private-application-package service-catalog service-catalog-association work-request work-request-error work-request-log-entry'
        'service-catalog application-summary' = 'list-applications'
        'service-catalog private-application' = 'change-compartment create create-with-stack-package delete download-logo get list update'
        'service-catalog private-application-package' = 'download-config get list'
        'service-catalog service-catalog' = 'change-compartment create delete get list update'
        'service-catalog service-catalog-association' = 'bulk-replace create delete get list'
        'service-catalog work-request' = 'get list'
        'service-catalog work-request-error' = 'list'
        'service-catalog work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_service_catalog() {
    $ociCommandsToLongParams = @{
        'service-catalog application-summary list-applications' = 'all compartment-id display-name entity-id entity-type from-json help is-featured limit package-type page page-size pricing publisher-id service-catalog-id sort-order'
        'service-catalog private-application change-compartment' = 'compartment-id from-json help if-match max-wait-seconds private-application-id wait-for-state wait-interval-seconds'
        'service-catalog private-application create' = 'compartment-id defined-tags display-name freeform-tags from-json help logo-file-base64-encoded long-description max-wait-seconds package-details short-description wait-for-state wait-interval-seconds'
        'service-catalog private-application create-with-stack-package' = 'compartment-id defined-tags display-name freeform-tags from-json help logo-file-base64-encoded long-description max-wait-seconds package-details-version package-details-zip-file-base64-encoded short-description wait-for-state wait-interval-seconds'
        'service-catalog private-application delete' = 'force from-json help if-match max-wait-seconds private-application-id wait-for-state wait-interval-seconds'
        'service-catalog private-application download-logo' = 'file from-json help private-application-id'
        'service-catalog private-application get' = 'from-json help private-application-id'
        'service-catalog private-application list' = 'all compartment-id display-name from-json help limit page page-size private-application-id sort-by sort-order'
        'service-catalog private-application update' = 'defined-tags display-name force freeform-tags from-json help if-match logo-file-base64-encoded long-description max-wait-seconds private-application-id short-description wait-for-state wait-interval-seconds'
        'service-catalog private-application-package download-config' = 'file from-json help package-id'
        'service-catalog private-application-package get' = 'from-json help package-id'
        'service-catalog private-application-package list' = 'all display-name from-json help limit package-id package-type page page-size private-application-id sort-by sort-order'
        'service-catalog service-catalog change-compartment' = 'compartment-id from-json help if-match service-catalog-id'
        'service-catalog service-catalog create' = 'compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds wait-for-state wait-interval-seconds'
        'service-catalog service-catalog delete' = 'force from-json help if-match max-wait-seconds service-catalog-id wait-for-state wait-interval-seconds'
        'service-catalog service-catalog get' = 'from-json help service-catalog-id'
        'service-catalog service-catalog list' = 'all compartment-id display-name from-json help limit page page-size service-catalog-id sort-by sort-order'
        'service-catalog service-catalog update' = 'defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds service-catalog-id wait-for-state wait-interval-seconds'
        'service-catalog service-catalog-association bulk-replace' = 'force from-json help if-match items service-catalog-id'
        'service-catalog service-catalog-association create' = 'entity-id entity-type from-json help service-catalog-id'
        'service-catalog service-catalog-association delete' = 'association-id force from-json help if-match'
        'service-catalog service-catalog-association get' = 'association-id from-json help'
        'service-catalog service-catalog-association list' = 'all association-id entity-id entity-type from-json help limit page page-size service-catalog-id sort-by sort-order'
        'service-catalog work-request get' = 'from-json help work-request-id'
        'service-catalog work-request list' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
        'service-catalog work-request-error list' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'service-catalog work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_service_catalog() {
    $ociCommandsToShortParams = @{
        'service-catalog application-summary list-applications' = '? c h'
        'service-catalog private-application change-compartment' = '? c h'
        'service-catalog private-application create' = '? c h'
        'service-catalog private-application create-with-stack-package' = '? c h'
        'service-catalog private-application delete' = '? h'
        'service-catalog private-application download-logo' = '? h'
        'service-catalog private-application get' = '? h'
        'service-catalog private-application list' = '? c h'
        'service-catalog private-application update' = '? h'
        'service-catalog private-application-package download-config' = '? h'
        'service-catalog private-application-package get' = '? h'
        'service-catalog private-application-package list' = '? h'
        'service-catalog service-catalog change-compartment' = '? c h'
        'service-catalog service-catalog create' = '? c h'
        'service-catalog service-catalog delete' = '? h'
        'service-catalog service-catalog get' = '? h'
        'service-catalog service-catalog list' = '? c h'
        'service-catalog service-catalog update' = '? h'
        'service-catalog service-catalog-association bulk-replace' = '? h'
        'service-catalog service-catalog-association create' = '? h'
        'service-catalog service-catalog-association delete' = '? h'
        'service-catalog service-catalog-association get' = '? h'
        'service-catalog service-catalog-association list' = '? h'
        'service-catalog work-request get' = '? h'
        'service-catalog work-request list' = '? c h'
        'service-catalog work-request-error list' = '? h'
        'service-catalog work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
function GetOciTopLevelCommand_apm_synthetics() {
    return 'apm-synthetics'
}

function GetOciSubcommands_apm_synthetics() {
    $ociSubcommands = @{
        'apm-synthetics' = 'monitor monitor-collection monitor-result public-vantage-point-collection script script-collection'
        'apm-synthetics monitor' = 'create-browser-monitor create-rest-monitor create-scripted-browser-monitor create-scripted-rest-monitor delete get update-browser-monitor update-rest-monitor update-scripted-browser-monitor update-scripted-rest-monitor'
        'apm-synthetics monitor-collection' = 'list-monitors'
        'apm-synthetics monitor-result' = 'get'
        'apm-synthetics public-vantage-point-collection' = 'list-public-vantage-points'
        'apm-synthetics script' = 'create delete get update'
        'apm-synthetics script-collection' = 'list-scripts'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_apm_synthetics() {
    $ociCommandsToLongParams = @{
        'apm-synthetics monitor create-browser-monitor' = 'apm-domain-id defined-tags display-name freeform-tags from-json help is-certificate-validation-enabled is-failure-retried monitor-type repeat-interval-in-seconds script-id script-parameters status target timeout-in-seconds vantage-points verify-texts'
        'apm-synthetics monitor create-rest-monitor' = 'apm-domain-id defined-tags display-name freeform-tags from-json help is-certificate-validation-enabled is-failure-retried is-redirection-enabled monitor-type repeat-interval-in-seconds req-authentication-details req-authentication-scheme request-headers request-method request-post-body request-query-params script-id script-parameters status target timeout-in-seconds vantage-points verify-response-codes verify-response-content'
        'apm-synthetics monitor create-scripted-browser-monitor' = 'apm-domain-id defined-tags display-name freeform-tags from-json help is-certificate-validation-enabled is-failure-retried monitor-type repeat-interval-in-seconds script-id script-parameters status target timeout-in-seconds vantage-points'
        'apm-synthetics monitor create-scripted-rest-monitor' = 'apm-domain-id defined-tags display-name freeform-tags from-json help is-failure-retried monitor-type repeat-interval-in-seconds script-id script-parameters status target timeout-in-seconds vantage-points'
        'apm-synthetics monitor delete' = 'apm-domain-id force from-json help if-match monitor-id'
        'apm-synthetics monitor get' = 'apm-domain-id from-json help monitor-id'
        'apm-synthetics monitor update-browser-monitor' = 'apm-domain-id defined-tags display-name force freeform-tags from-json help if-match is-certificate-validation-enabled is-failure-retried monitor-id repeat-interval-in-seconds script-id script-parameters status target timeout-in-seconds vantage-points verify-texts'
        'apm-synthetics monitor update-rest-monitor' = 'apm-domain-id defined-tags display-name force freeform-tags from-json help if-match is-certificate-validation-enabled is-failure-retried is-redirection-enabled monitor-id repeat-interval-in-seconds req-authentication-details req-authentication-scheme request-headers request-method request-post-body request-query-params script-id script-parameters status target timeout-in-seconds vantage-points verify-response-codes verify-response-content'
        'apm-synthetics monitor update-scripted-browser-monitor' = 'apm-domain-id defined-tags display-name force freeform-tags from-json help if-match is-certificate-validation-enabled is-failure-retried monitor-id repeat-interval-in-seconds script-id script-parameters status target timeout-in-seconds vantage-points'
        'apm-synthetics monitor update-scripted-rest-monitor' = 'apm-domain-id defined-tags display-name force freeform-tags from-json help if-match is-failure-retried monitor-id repeat-interval-in-seconds script-id script-parameters status target timeout-in-seconds vantage-points'
        'apm-synthetics monitor-collection list-monitors' = 'all apm-domain-id display-name from-json help limit monitor-type page page-size script-id sort-by sort-order status'
        'apm-synthetics monitor-result get' = 'apm-domain-id execution-time from-json help monitor-id result-content-type result-type vantage-point'
        'apm-synthetics public-vantage-point-collection list-public-vantage-points' = 'all apm-domain-id display-name from-json help limit name page page-size sort-by sort-order'
        'apm-synthetics script create' = 'apm-domain-id content content-file-name content-type defined-tags display-name freeform-tags from-json help parameters'
        'apm-synthetics script delete' = 'apm-domain-id force from-json help if-match script-id'
        'apm-synthetics script get' = 'apm-domain-id from-json help script-id'
        'apm-synthetics script update' = 'apm-domain-id content content-file-name content-type defined-tags display-name force freeform-tags from-json help if-match parameters script-id'
        'apm-synthetics script-collection list-scripts' = 'all apm-domain-id content-type display-name from-json help limit page page-size sort-by sort-order'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_apm_synthetics() {
    $ociCommandsToShortParams = @{
        'apm-synthetics monitor create-browser-monitor' = '? h'
        'apm-synthetics monitor create-rest-monitor' = '? h'
        'apm-synthetics monitor create-scripted-browser-monitor' = '? h'
        'apm-synthetics monitor create-scripted-rest-monitor' = '? h'
        'apm-synthetics monitor delete' = '? h'
        'apm-synthetics monitor get' = '? h'
        'apm-synthetics monitor update-browser-monitor' = '? h'
        'apm-synthetics monitor update-rest-monitor' = '? h'
        'apm-synthetics monitor update-scripted-browser-monitor' = '? h'
        'apm-synthetics monitor update-scripted-rest-monitor' = '? h'
        'apm-synthetics monitor-collection list-monitors' = '? h'
        'apm-synthetics monitor-result get' = '? h'
        'apm-synthetics public-vantage-point-collection list-public-vantage-points' = '? h'
        'apm-synthetics script create' = '? h'
        'apm-synthetics script delete' = '? h'
        'apm-synthetics script get' = '? h'
        'apm-synthetics script update' = '? h'
        'apm-synthetics script-collection list-scripts' = '? h'
    }
    return $ociCommandsToShortParams
}
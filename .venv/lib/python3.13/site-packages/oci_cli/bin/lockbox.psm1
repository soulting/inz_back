function GetOciTopLevelCommand_lockbox() {
    return 'lockbox'
}

function GetOciSubcommands_lockbox() {
    $ociSubcommands = @{
        'lockbox' = 'access-materials access-request access-request-collection approval-template approval-template-collection lockbox lockbox-collection work-request work-request-error work-request-log-entry'
        'lockbox access-materials' = 'get'
        'lockbox access-request' = 'create get handle'
        'lockbox access-request-collection' = 'list-access-requests'
        'lockbox approval-template' = 'change-compartment create delete get update'
        'lockbox approval-template-collection' = 'list-approval-templates'
        'lockbox lockbox' = 'change-compartment create delete get update'
        'lockbox lockbox-collection' = 'list-lockboxes'
        'lockbox work-request' = 'cancel get list'
        'lockbox work-request-error' = 'list'
        'lockbox work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_lockbox() {
    $ociCommandsToLongParams = @{
        'lockbox access-materials get' = 'access-request-id from-json help'
        'lockbox access-request create' = 'access-duration context description display-name from-json help lockbox-id max-wait-seconds wait-for-state wait-interval-seconds'
        'lockbox access-request get' = 'access-request-id from-json help'
        'lockbox access-request handle' = 'access-request-id action from-json help if-match max-wait-seconds message wait-for-state wait-interval-seconds'
        'lockbox access-request-collection list-access-requests' = 'all display-name from-json help lifecycle-state limit lockbox-id lockbox-partner page page-size requestor-id sort-by sort-order'
        'lockbox approval-template change-compartment' = 'approval-template-id compartment-id from-json help if-match'
        'lockbox approval-template create' = 'approver-levels compartment-id defined-tags display-name freeform-tags from-json help max-wait-seconds wait-for-state wait-interval-seconds'
        'lockbox approval-template delete' = 'approval-template-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'lockbox approval-template get' = 'approval-template-id from-json help'
        'lockbox approval-template update' = 'approval-template-id approver-levels defined-tags display-name force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'lockbox approval-template-collection list-approval-templates' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'lockbox lockbox change-compartment' = 'compartment-id from-json help if-match lockbox-id'
        'lockbox lockbox create' = 'access-context-attributes approval-template-id auto-approval-state compartment-id defined-tags display-name freeform-tags from-json help lockbox-partner max-access-duration max-wait-seconds partner-compartment-id resource-id wait-for-state wait-interval-seconds'
        'lockbox lockbox delete' = 'force from-json help if-match lockbox-id max-wait-seconds wait-for-state wait-interval-seconds'
        'lockbox lockbox get' = 'from-json help lockbox-id'
        'lockbox lockbox update' = 'approval-template-id auto-approval-state defined-tags display-name force freeform-tags from-json help if-match lockbox-id max-access-duration max-wait-seconds wait-for-state wait-interval-seconds'
        'lockbox lockbox-collection list-lockboxes' = 'all compartment-id display-name from-json help lifecycle-state limit lockbox-id lockbox-partner page page-size resource-id sort-by sort-order'
        'lockbox work-request cancel' = 'force from-json help if-match work-request-id'
        'lockbox work-request get' = 'from-json help work-request-id'
        'lockbox work-request list' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
        'lockbox work-request-error list' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'lockbox work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_lockbox() {
    $ociCommandsToShortParams = @{
        'lockbox access-materials get' = '? h'
        'lockbox access-request create' = '? h'
        'lockbox access-request get' = '? h'
        'lockbox access-request handle' = '? h'
        'lockbox access-request-collection list-access-requests' = '? h'
        'lockbox approval-template change-compartment' = '? c h'
        'lockbox approval-template create' = '? c h'
        'lockbox approval-template delete' = '? h'
        'lockbox approval-template get' = '? h'
        'lockbox approval-template update' = '? h'
        'lockbox approval-template-collection list-approval-templates' = '? c h'
        'lockbox lockbox change-compartment' = '? c h'
        'lockbox lockbox create' = '? c h'
        'lockbox lockbox delete' = '? h'
        'lockbox lockbox get' = '? h'
        'lockbox lockbox update' = '? h'
        'lockbox lockbox-collection list-lockboxes' = '? c h'
        'lockbox work-request cancel' = '? h'
        'lockbox work-request get' = '? h'
        'lockbox work-request list' = '? c h'
        'lockbox work-request-error list' = '? h'
        'lockbox work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
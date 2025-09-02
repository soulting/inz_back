function GetOciTopLevelCommand_apiaccesscontrol() {
    return 'apiaccesscontrol'
}

function GetOciSubcommands_apiaccesscontrol() {
    $ociSubcommands = @{
        'apiaccesscontrol' = 'api-metadata privileged-api-control privileged-api-requests privileged-api-work-request'
        'apiaccesscontrol api-metadata' = 'get list list-api-metadata-by-entity-types'
        'apiaccesscontrol privileged-api-control' = 'change-compartment create delete get list-privileged-api-controls update'
        'apiaccesscontrol privileged-api-requests' = 'approve close create get list-privileged-api-requests reject revoke'
        'apiaccesscontrol privileged-api-work-request' = 'cancel get list work-request-error work-request-log-entry'
        'apiaccesscontrol privileged-api-work-request work-request-error' = 'list'
        'apiaccesscontrol privileged-api-work-request work-request-log-entry' = 'list-work-request-logs'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_apiaccesscontrol() {
    $ociCommandsToLongParams = @{
        'apiaccesscontrol api-metadata get' = 'api-metadata-id from-json help'
        'apiaccesscontrol api-metadata list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size resource-type sort-by sort-order'
        'apiaccesscontrol api-metadata list-api-metadata-by-entity-types' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size resource-type sort-by sort-order'
        'apiaccesscontrol privileged-api-control change-compartment' = 'compartment-id from-json help if-match max-wait-seconds privileged-api-control-id wait-for-state wait-interval-seconds'
        'apiaccesscontrol privileged-api-control create' = 'approver-group-id-list compartment-id defined-tags description display-name freeform-tags from-json help max-wait-seconds notification-topic-id number-of-approvers privileged-operation-list resource-type resources wait-for-state wait-interval-seconds'
        'apiaccesscontrol privileged-api-control delete' = 'description force from-json help if-match max-wait-seconds privileged-api-control-id wait-for-state wait-interval-seconds'
        'apiaccesscontrol privileged-api-control get' = 'from-json help privileged-api-control-id'
        'apiaccesscontrol privileged-api-control list-privileged-api-controls' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size resource-type sort-by sort-order'
        'apiaccesscontrol privileged-api-control update' = 'approver-group-id-list defined-tags description display-name force freeform-tags from-json help if-match max-wait-seconds notification-topic-id number-of-approvers privileged-api-control-id privileged-operation-list resource-type resources wait-for-state wait-interval-seconds'
        'apiaccesscontrol privileged-api-requests approve' = 'approver-comment from-json help if-match max-wait-seconds privileged-api-request-id time-of-user-creation wait-for-state wait-interval-seconds'
        'apiaccesscontrol privileged-api-requests close' = 'description from-json help if-match max-wait-seconds privileged-api-request-id wait-for-state wait-interval-seconds'
        'apiaccesscontrol privileged-api-requests create' = 'compartment-id defined-tags duration-in-hrs freeform-tags from-json help max-wait-seconds notification-topic-id privileged-operation-list reason-detail reason-summary resource-id severity sub-resource-name-list ticket-numbers time-requested-for-future-access wait-for-state wait-interval-seconds'
        'apiaccesscontrol privileged-api-requests get' = 'from-json help privileged-api-request-id'
        'apiaccesscontrol privileged-api-requests list-privileged-api-requests' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size resource-id resource-type sort-by sort-order state'
        'apiaccesscontrol privileged-api-requests reject' = 'approver-comment from-json help if-match max-wait-seconds privileged-api-request-id wait-for-state wait-interval-seconds'
        'apiaccesscontrol privileged-api-requests revoke' = 'approver-comment from-json help if-match max-wait-seconds privileged-api-request-id wait-for-state wait-interval-seconds'
        'apiaccesscontrol privileged-api-work-request cancel' = 'force from-json help if-match work-request-id'
        'apiaccesscontrol privileged-api-work-request get' = 'from-json help work-request-id'
        'apiaccesscontrol privileged-api-work-request list' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
        'apiaccesscontrol privileged-api-work-request work-request-error list' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'apiaccesscontrol privileged-api-work-request work-request-log-entry list-work-request-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_apiaccesscontrol() {
    $ociCommandsToShortParams = @{
        'apiaccesscontrol api-metadata get' = '? h'
        'apiaccesscontrol api-metadata list' = '? c h'
        'apiaccesscontrol api-metadata list-api-metadata-by-entity-types' = '? c h'
        'apiaccesscontrol privileged-api-control change-compartment' = '? c h'
        'apiaccesscontrol privileged-api-control create' = '? c h'
        'apiaccesscontrol privileged-api-control delete' = '? h'
        'apiaccesscontrol privileged-api-control get' = '? h'
        'apiaccesscontrol privileged-api-control list-privileged-api-controls' = '? c h'
        'apiaccesscontrol privileged-api-control update' = '? h'
        'apiaccesscontrol privileged-api-requests approve' = '? h'
        'apiaccesscontrol privileged-api-requests close' = '? h'
        'apiaccesscontrol privileged-api-requests create' = '? c h'
        'apiaccesscontrol privileged-api-requests get' = '? h'
        'apiaccesscontrol privileged-api-requests list-privileged-api-requests' = '? c h'
        'apiaccesscontrol privileged-api-requests reject' = '? h'
        'apiaccesscontrol privileged-api-requests revoke' = '? h'
        'apiaccesscontrol privileged-api-work-request cancel' = '? h'
        'apiaccesscontrol privileged-api-work-request get' = '? h'
        'apiaccesscontrol privileged-api-work-request list' = '? c h'
        'apiaccesscontrol privileged-api-work-request work-request-error list' = '? h'
        'apiaccesscontrol privileged-api-work-request work-request-log-entry list-work-request-logs' = '? h'
    }
    return $ociCommandsToShortParams
}
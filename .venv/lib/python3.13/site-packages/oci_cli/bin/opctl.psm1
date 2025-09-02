function GetOciTopLevelCommand_opctl() {
    return 'opctl'
}

function GetOciSubcommands_opctl() {
    $ociSubcommands = @{
        'opctl' = 'access-request operator-action operator-control operator-control-assignment'
        'opctl access-request' = 'approve get list list-access-request-histories reject revoke'
        'opctl operator-action' = 'get list'
        'opctl operator-control' = 'change-compartment create delete get list update'
        'opctl operator-control-assignment' = 'change-compartment create delete get list update'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_opctl() {
    $ociCommandsToLongParams = @{
        'opctl access-request approve' = 'access-request-id additional-message approver-comment audit-type from-json help if-match'
        'opctl access-request get' = 'access-request-id from-json help'
        'opctl access-request list' = 'all compartment-id from-json help lifecycle-state limit page page-size resource-name sort-by sort-order'
        'opctl access-request list-access-request-histories' = 'access-request-id all from-json help limit page page-size'
        'opctl access-request reject' = 'access-request-id approver-comment from-json help if-match'
        'opctl access-request revoke' = 'access-request-id approver-comment from-json help if-match'
        'opctl operator-action get' = 'from-json help operator-action-id'
        'opctl operator-action list' = 'all compartment-id from-json help lifecycle-state limit name page page-size sort-by sort-order'
        'opctl operator-control change-compartment' = 'compartment-id from-json help if-match operator-control-id'
        'opctl operator-control create' = 'approver-groups-list approvers-list compartment-id defined-tags description email-id-list freeform-tags from-json help is-fully-pre-approved max-wait-seconds operator-control-name pre-approved-op-action-list system-message wait-for-state wait-interval-seconds'
        'opctl operator-control delete' = 'description force from-json help if-match max-wait-seconds operator-control-id wait-for-state wait-interval-seconds'
        'opctl operator-control get' = 'from-json help operator-control-id'
        'opctl operator-control list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'opctl operator-control update' = 'approver-groups-list approvers-list defined-tags description email-id-list force freeform-tags from-json help if-match is-fully-pre-approved max-wait-seconds operator-control-id operator-control-name pre-approved-op-action-list system-message wait-for-state wait-interval-seconds'
        'opctl operator-control-assignment change-compartment' = 'compartment-id from-json help if-match operator-control-assignment-id'
        'opctl operator-control-assignment create' = 'comment compartment-id defined-tags freeform-tags from-json help is-enforced-always operator-control-id resource-compartment-id resource-id resource-name resource-type time-assignment-from time-assignment-to'
        'opctl operator-control-assignment delete' = 'description force from-json help if-match max-wait-seconds operator-control-assignment-id wait-for-state wait-interval-seconds'
        'opctl operator-control-assignment get' = 'from-json help operator-control-assignment-id'
        'opctl operator-control-assignment list' = 'all compartment-id from-json help lifecycle-state limit operator-control-name page page-size resource-name sort-by sort-order'
        'opctl operator-control-assignment update' = 'comment defined-tags force freeform-tags from-json help if-match is-enforced-always max-wait-seconds operator-control-assignment-id time-assignment-from time-assignment-to wait-for-state wait-interval-seconds'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_opctl() {
    $ociCommandsToShortParams = @{
        'opctl access-request approve' = '? h'
        'opctl access-request get' = '? h'
        'opctl access-request list' = '? c h'
        'opctl access-request list-access-request-histories' = '? h'
        'opctl access-request reject' = '? h'
        'opctl access-request revoke' = '? h'
        'opctl operator-action get' = '? h'
        'opctl operator-action list' = '? c h'
        'opctl operator-control change-compartment' = '? c h'
        'opctl operator-control create' = '? c h'
        'opctl operator-control delete' = '? h'
        'opctl operator-control get' = '? h'
        'opctl operator-control list' = '? c h'
        'opctl operator-control update' = '? h'
        'opctl operator-control-assignment change-compartment' = '? c h'
        'opctl operator-control-assignment create' = '? c h'
        'opctl operator-control-assignment delete' = '? h'
        'opctl operator-control-assignment get' = '? h'
        'opctl operator-control-assignment list' = '? c h'
        'opctl operator-control-assignment update' = '? h'
    }
    return $ociCommandsToShortParams
}
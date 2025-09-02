function GetOciTopLevelCommand_operator_access_control() {
    return 'operator-access-control'
}

function GetOciSubcommands_operator_access_control() {
    $ociSubcommands = @{
        'operator-access-control' = 'access-request operator-action operator-control operator-control-assignment'
        'operator-access-control access-request' = 'approve get list list-access-request-histories reject revoke'
        'operator-access-control operator-action' = 'get list'
        'operator-access-control operator-control' = 'change-compartment create delete get list update'
        'operator-access-control operator-control-assignment' = 'change-compartment create delete get list update'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_operator_access_control() {
    $ociCommandsToLongParams = @{
        'operator-access-control access-request approve' = 'access-request-id additional-message approver-comment audit-type from-json help if-match'
        'operator-access-control access-request get' = 'access-request-id from-json help'
        'operator-access-control access-request list' = 'all compartment-id from-json help lifecycle-state limit page page-size resource-name sort-by sort-order'
        'operator-access-control access-request list-access-request-histories' = 'access-request-id all from-json help limit page page-size'
        'operator-access-control access-request reject' = 'access-request-id approver-comment from-json help if-match'
        'operator-access-control access-request revoke' = 'access-request-id approver-comment from-json help if-match'
        'operator-access-control operator-action get' = 'from-json help operator-action-id'
        'operator-access-control operator-action list' = 'all compartment-id from-json help lifecycle-state limit name page page-size sort-by sort-order'
        'operator-access-control operator-control change-compartment' = 'compartment-id from-json help if-match operator-control-id'
        'operator-access-control operator-control create' = 'approver-groups-list approvers-list compartment-id defined-tags description freeform-tags from-json help is-fully-pre-approved max-wait-seconds operator-attributes operator-control-name pre-approved-op-action-list system-message wait-for-state wait-interval-seconds'
        'operator-access-control operator-control delete' = 'description force from-json help if-match max-wait-seconds operator-control-id wait-for-state wait-interval-seconds'
        'operator-access-control operator-control get' = 'from-json help operator-control-id'
        'operator-access-control operator-control list' = 'all compartment-id display-name from-json help lifecycle-state limit page page-size sort-by sort-order'
        'operator-access-control operator-control update' = 'approver-groups-list approvers-list defined-tags description force freeform-tags from-json help if-match is-fully-pre-approved max-wait-seconds operator-attributes operator-control-id operator-control-name pre-approved-op-action-list system-message wait-for-state wait-interval-seconds'
        'operator-access-control operator-control-assignment change-compartment' = 'compartment-id from-json help if-match operator-control-assignment-id'
        'operator-access-control operator-control-assignment create' = 'comment compartment-id defined-tags freeform-tags from-json help is-enforced-always operator-control-id resource-compartment-id resource-id resource-name resource-type time-assignment-from time-assignment-to'
        'operator-access-control operator-control-assignment delete' = 'description force from-json help if-match max-wait-seconds operator-control-assignment-id wait-for-state wait-interval-seconds'
        'operator-access-control operator-control-assignment get' = 'from-json help operator-control-assignment-id'
        'operator-access-control operator-control-assignment list' = 'all compartment-id from-json help lifecycle-state limit operator-control-name page page-size resource-name sort-by sort-order'
        'operator-access-control operator-control-assignment update' = 'comment defined-tags force freeform-tags from-json help if-match is-enforced-always max-wait-seconds operator-control-assignment-id time-assignment-from time-assignment-to wait-for-state wait-interval-seconds'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_operator_access_control() {
    $ociCommandsToShortParams = @{
        'operator-access-control access-request approve' = '? h'
        'operator-access-control access-request get' = '? h'
        'operator-access-control access-request list' = '? c h'
        'operator-access-control access-request list-access-request-histories' = '? h'
        'operator-access-control access-request reject' = '? h'
        'operator-access-control access-request revoke' = '? h'
        'operator-access-control operator-action get' = '? h'
        'operator-access-control operator-action list' = '? c h'
        'operator-access-control operator-control change-compartment' = '? c h'
        'operator-access-control operator-control create' = '? c h'
        'operator-access-control operator-control delete' = '? h'
        'operator-access-control operator-control get' = '? h'
        'operator-access-control operator-control list' = '? c h'
        'operator-access-control operator-control update' = '? h'
        'operator-access-control operator-control-assignment change-compartment' = '? c h'
        'operator-access-control operator-control-assignment create' = '? c h'
        'operator-access-control operator-control-assignment delete' = '? h'
        'operator-access-control operator-control-assignment get' = '? h'
        'operator-access-control operator-control-assignment list' = '? c h'
        'operator-access-control operator-control-assignment update' = '? h'
    }
    return $ociCommandsToShortParams
}

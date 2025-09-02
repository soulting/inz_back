function GetOciTopLevelCommand_zpr() {
    return 'zpr'
}

function GetOciSubcommands_zpr() {
    $ociSubcommands = @{
        'zpr' = 'configuration work-request zpr-policy'
        'zpr configuration' = 'create get'
        'zpr work-request' = 'get-zpr-configuration get-zpr-policy list-zpr-configuration list-zpr-configuration-errors list-zpr-configuration-logs list-zpr-policy list-zpr-policy-errors list-zpr-policy-logs'
        'zpr zpr-policy' = 'create delete get list update'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_zpr() {
    $ociCommandsToLongParams = @{
        'zpr configuration create' = 'compartment-id defined-tags freeform-tags from-json help max-wait-seconds opc-dry-run wait-for-state wait-interval-seconds zpr-status'
        'zpr configuration get' = 'compartment-id from-json help'
        'zpr work-request get-zpr-configuration' = 'from-json help work-request-id'
        'zpr work-request get-zpr-policy' = 'from-json help work-request-id'
        'zpr work-request list-zpr-configuration' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
        'zpr work-request list-zpr-configuration-errors' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'zpr work-request list-zpr-configuration-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'zpr work-request list-zpr-policy' = 'all compartment-id from-json help limit page page-size resource-id sort-by sort-order status work-request-id'
        'zpr work-request list-zpr-policy-errors' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'zpr work-request list-zpr-policy-logs' = 'all from-json help limit page page-size sort-by sort-order work-request-id'
        'zpr zpr-policy create' = 'compartment-id defined-tags description freeform-tags from-json help max-wait-seconds name opc-dry-run statements wait-for-state wait-interval-seconds'
        'zpr zpr-policy delete' = 'force from-json help if-match max-wait-seconds opc-dry-run wait-for-state wait-interval-seconds zpr-policy-id'
        'zpr zpr-policy get' = 'from-json help zpr-policy-id'
        'zpr zpr-policy list' = 'all compartment-id from-json help id lifecycle-state limit name page page-size sort-by sort-order'
        'zpr zpr-policy update' = 'defined-tags description force freeform-tags from-json help if-match max-wait-seconds opc-dry-run statements wait-for-state wait-interval-seconds zpr-policy-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_zpr() {
    $ociCommandsToShortParams = @{
        'zpr configuration create' = '? c h'
        'zpr configuration get' = '? c h'
        'zpr work-request get-zpr-configuration' = '? h'
        'zpr work-request get-zpr-policy' = '? h'
        'zpr work-request list-zpr-configuration' = '? c h'
        'zpr work-request list-zpr-configuration-errors' = '? h'
        'zpr work-request list-zpr-configuration-logs' = '? h'
        'zpr work-request list-zpr-policy' = '? c h'
        'zpr work-request list-zpr-policy-errors' = '? h'
        'zpr work-request list-zpr-policy-logs' = '? h'
        'zpr zpr-policy create' = '? c h'
        'zpr zpr-policy delete' = '? h'
        'zpr zpr-policy get' = '? h'
        'zpr zpr-policy list' = '? c h'
        'zpr zpr-policy update' = '? h'
    }
    return $ociCommandsToShortParams
}
function GetOciTopLevelCommand_compute_instance_agent() {
    return 'compute-instance-agent'
}

function GetOciSubcommands_compute_instance_agent() {
    $ociSubcommands = @{
        'compute-instance-agent' = 'instance-agent-command instance-agent-command-execution'
        'compute-instance-agent instance-agent-command' = 'cancel create get list'
        'compute-instance-agent instance-agent-command-execution' = 'get list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_compute_instance_agent() {
    $ociCommandsToLongParams = @{
        'compute-instance-agent instance-agent-command cancel' = 'force from-json help if-match instance-agent-command-id'
        'compute-instance-agent instance-agent-command create' = 'compartment-id content display-name execution-time-out-in-seconds from-json help target'
        'compute-instance-agent instance-agent-command get' = 'from-json help instance-agent-command-id'
        'compute-instance-agent instance-agent-command list' = 'all compartment-id from-json help limit page page-size sort-by sort-order'
        'compute-instance-agent instance-agent-command-execution get' = 'from-json help instance-agent-command-id instance-id'
        'compute-instance-agent instance-agent-command-execution list' = 'all compartment-id from-json help instance-id lifecycle-state limit page page-size sort-by sort-order'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_compute_instance_agent() {
    $ociCommandsToShortParams = @{
        'compute-instance-agent instance-agent-command cancel' = '? h'
        'compute-instance-agent instance-agent-command create' = '? c h'
        'compute-instance-agent instance-agent-command get' = '? h'
        'compute-instance-agent instance-agent-command list' = '? c h'
        'compute-instance-agent instance-agent-command-execution get' = '? h'
        'compute-instance-agent instance-agent-command-execution list' = '? c h'
    }
    return $ociCommandsToShortParams
}
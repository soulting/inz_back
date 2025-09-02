function GetOciTopLevelCommand_instance_agent() {
    return 'instance-agent'
}

function GetOciSubcommands_instance_agent() {
    $ociSubcommands = @{
        'instance-agent' = 'available-plugins command command-execution plugin'
        'instance-agent available-plugins' = 'get'
        'instance-agent command' = 'cancel create get list'
        'instance-agent command-execution' = 'get list'
        'instance-agent plugin' = 'get list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_instance_agent() {
    $ociCommandsToLongParams = @{
        'instance-agent available-plugins get' = 'all compartment-id from-json help limit name os-name os-version page page-size sort-by sort-order'
        'instance-agent command cancel' = 'command-id force from-json help if-match'
        'instance-agent command create' = 'compartment-id content display-name from-json help target timeout-in-seconds'
        'instance-agent command get' = 'command-id from-json help'
        'instance-agent command list' = 'all compartment-id from-json help limit page page-size sort-by sort-order'
        'instance-agent command-execution get' = 'command-id from-json help instance-id'
        'instance-agent command-execution list' = 'all compartment-id from-json help instance-id lifecycle-state limit page page-size sort-by sort-order'
        'instance-agent plugin get' = 'compartment-id from-json help instanceagent-id plugin-name'
        'instance-agent plugin list' = 'all compartment-id from-json help instanceagent-id limit name page page-size sort-by sort-order status'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_instance_agent() {
    $ociCommandsToShortParams = @{
        'instance-agent available-plugins get' = '? c h'
        'instance-agent command cancel' = '? h'
        'instance-agent command create' = '? c h'
        'instance-agent command get' = '? h'
        'instance-agent command list' = '? c h'
        'instance-agent command-execution get' = '? h'
        'instance-agent command-execution list' = '? c h'
        'instance-agent plugin get' = '? c h'
        'instance-agent plugin list' = '? c h'
    }
    return $ociCommandsToShortParams
}
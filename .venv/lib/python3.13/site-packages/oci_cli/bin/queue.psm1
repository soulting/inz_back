function GetOciTopLevelCommand_queue() {
    return 'queue'
}

function GetOciSubcommands_queue() {
    $ociSubcommands = @{
        'queue' = 'channels messages queue-admin'
        'queue channels' = 'list-channels'
        'queue messages' = 'delete-message delete-messages get-messages get-stats put-messages update-message update-messages'
        'queue queue-admin' = 'queue work-request work-request-error work-request-log'
        'queue queue-admin queue' = 'change-compartment create delete get list purge update'
        'queue queue-admin work-request' = 'get list'
        'queue queue-admin work-request-error' = 'list'
        'queue queue-admin work-request-log' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_queue() {
    $ociCommandsToLongParams = @{
        'queue channels list-channels' = 'all channel-filter from-json help limit page page-size queue-id'
        'queue messages delete-message' = 'force from-json help message-receipt queue-id'
        'queue messages delete-messages' = 'entries from-json help queue-id'
        'queue messages get-messages' = 'channel-filter from-json help limit queue-id timeout-in-seconds visibility-in-seconds'
        'queue messages get-stats' = 'channel-id from-json help queue-id'
        'queue messages put-messages' = 'from-json help messages queue-id'
        'queue messages update-message' = 'from-json help message-receipt queue-id visibility-in-seconds'
        'queue messages update-messages' = 'entries from-json help queue-id'
        'queue queue-admin queue change-compartment' = 'compartment-id from-json help if-match max-wait-seconds queue-id wait-for-state wait-interval-seconds'
        'queue queue-admin queue create' = 'channel-consumption-limit compartment-id custom-key defined-tags display-name dlq-delivery-count freeform-tags from-json help max-wait-seconds retention-in-seconds timeout-in-seconds visibility-in-seconds wait-for-state wait-interval-seconds'
        'queue queue-admin queue delete' = 'force from-json help if-match max-wait-seconds queue-id wait-for-state wait-interval-seconds'
        'queue queue-admin queue get' = 'from-json help queue-id'
        'queue queue-admin queue list' = 'all compartment-id display-name from-json help id lifecycle-state limit page page-size sort-by sort-order'
        'queue queue-admin queue purge' = 'channel-ids from-json help if-match max-wait-seconds purge-type queue-id wait-for-state wait-interval-seconds'
        'queue queue-admin queue update' = 'channel-consumption-limit custom-key defined-tags display-name dlq-delivery-count force freeform-tags from-json help if-match max-wait-seconds queue-id timeout-in-seconds visibility-in-seconds wait-for-state wait-interval-seconds'
        'queue queue-admin work-request get' = 'from-json help work-request-id'
        'queue queue-admin work-request list' = 'all compartment-id from-json help limit page page-size work-request-id'
        'queue queue-admin work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'queue queue-admin work-request-log list' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_queue() {
    $ociCommandsToShortParams = @{
        'queue channels list-channels' = '? h'
        'queue messages delete-message' = '? h'
        'queue messages delete-messages' = '? h'
        'queue messages get-messages' = '? h'
        'queue messages get-stats' = '? h'
        'queue messages put-messages' = '? h'
        'queue messages update-message' = '? h'
        'queue messages update-messages' = '? h'
        'queue queue-admin queue change-compartment' = '? c h'
        'queue queue-admin queue create' = '? c h'
        'queue queue-admin queue delete' = '? h'
        'queue queue-admin queue get' = '? h'
        'queue queue-admin queue list' = '? c h'
        'queue queue-admin queue purge' = '? h'
        'queue queue-admin queue update' = '? h'
        'queue queue-admin work-request get' = '? h'
        'queue queue-admin work-request list' = '? c h'
        'queue queue-admin work-request-error list' = '? h'
        'queue queue-admin work-request-log list' = '? h'
    }
    return $ociCommandsToShortParams
}
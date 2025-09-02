function GetOciTopLevelCommand_announce() {
    return 'announce'
}

function GetOciSubcommands_announce() {
    $ociSubcommands = @{
        'announce' = 'announcements announcements-preferences user-status'
        'announce announcements' = 'get list'
        'announce announcements-preferences' = 'create get list update'
        'announce user-status' = 'get update'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_announce() {
    $ociCommandsToLongParams = @{
        'announce announcements get' = 'announcement-id from-json help'
        'announce announcements list' = 'all announcement-type compartment-id from-json help is-banner lifecycle-state limit page page-size sort-by sort-order time-one-earliest-time time-one-latest-time'
        'announce announcements-preferences create' = 'compartment-id from-json help is-unsubscribed preference-type type'
        'announce announcements-preferences get' = 'from-json help preference-id'
        'announce announcements-preferences list' = 'all compartment-id from-json help limit page page-size'
        'announce announcements-preferences update' = 'compartment-id from-json help if-match is-unsubscribed preference-id preference-type type'
        'announce user-status get' = 'announcement-id from-json help'
        'announce user-status update' = 'announcement-id from-json help if-match time-acknowledged user-id user-status-announcement-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_announce() {
    $ociCommandsToShortParams = @{
        'announce announcements get' = '? h'
        'announce announcements list' = '? c h'
        'announce announcements-preferences create' = '? c h'
        'announce announcements-preferences get' = '? h'
        'announce announcements-preferences list' = '? c h'
        'announce announcements-preferences update' = '? c h'
        'announce user-status get' = '? h'
        'announce user-status update' = '? h'
    }
    return $ociCommandsToShortParams
}
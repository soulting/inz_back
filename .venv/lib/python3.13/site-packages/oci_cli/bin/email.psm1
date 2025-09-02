function GetOciTopLevelCommand_email() {
    return 'email'
}

function GetOciSubcommands_email() {
    $ociSubcommands = @{
        'email' = 'configuration dkim domain email-return-path sender suppression work-request work-request-error work-request-log'
        'email configuration' = 'get-email'
        'email dkim' = 'create delete get list update'
        'email domain' = 'change-compartment create delete get list update'
        'email email-return-path' = 'create delete get list update'
        'email sender' = 'change-compartment create delete get list update'
        'email suppression' = 'create delete get list'
        'email work-request' = 'get list'
        'email work-request-error' = 'list'
        'email work-request-log' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_email() {
    $ociCommandsToLongParams = @{
        'email configuration get-email' = 'compartment-id from-json help'
        'email dkim create' = 'defined-tags description email-domain-id freeform-tags from-json help max-wait-seconds name private-key wait-for-state wait-interval-seconds'
        'email dkim delete' = 'dkim-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'email dkim get' = 'dkim-id from-json help'
        'email dkim list' = 'all email-domain-id from-json help id lifecycle-state limit name page page-size sort-by sort-order'
        'email dkim update' = 'defined-tags description dkim-id force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'email domain change-compartment' = 'compartment-id email-domain-id from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'email domain create' = 'compartment-id defined-tags description domain-verification-id freeform-tags from-json help max-wait-seconds name wait-for-state wait-interval-seconds'
        'email domain delete' = 'email-domain-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'email domain get' = 'email-domain-id from-json help'
        'email domain list' = 'all compartment-id from-json help id lifecycle-state limit name page page-size sort-by sort-order'
        'email domain update' = 'defined-tags description domain-verification-id email-domain-id force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'email email-return-path create' = 'defined-tags description freeform-tags from-json help max-wait-seconds name parent-resource-id wait-for-state wait-interval-seconds'
        'email email-return-path delete' = 'email-return-path-id force from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'email email-return-path get' = 'email-return-path-id from-json help'
        'email email-return-path list' = 'all compartment-id from-json help id lifecycle-state limit name page page-size parent-resource-id sort-by sort-order'
        'email email-return-path update' = 'defined-tags description email-return-path-id force freeform-tags from-json help if-match max-wait-seconds wait-for-state wait-interval-seconds'
        'email sender change-compartment' = 'compartment-id from-json help if-match sender-id'
        'email sender create' = 'compartment-id defined-tags email-address freeform-tags from-json help max-wait-seconds wait-for-state wait-interval-seconds'
        'email sender delete' = 'force from-json help if-match max-wait-seconds sender-id wait-for-state wait-interval-seconds'
        'email sender get' = 'from-json help sender-id'
        'email sender list' = 'all compartment-id domain email-address from-json help lifecycle-state limit page page-size sort-by sort-order'
        'email sender update' = 'defined-tags force freeform-tags from-json help if-match max-wait-seconds sender-id wait-for-state wait-interval-seconds'
        'email suppression create' = 'compartment-id email-address from-json help'
        'email suppression delete' = 'force from-json help suppression-id'
        'email suppression get' = 'from-json help suppression-id'
        'email suppression list' = 'all compartment-id email-address from-json help limit page page-size sort-by sort-order time-created-greater-than-or-equal-to time-created-less-than'
        'email work-request get' = 'from-json help work-request-id'
        'email work-request list' = 'all compartment-id from-json help limit page page-size work-request-id'
        'email work-request-error list' = 'all from-json help limit page page-size work-request-id'
        'email work-request-log list' = 'all from-json help limit page page-size work-request-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_email() {
    $ociCommandsToShortParams = @{
        'email configuration get-email' = '? c h'
        'email dkim create' = '? h'
        'email dkim delete' = '? h'
        'email dkim get' = '? h'
        'email dkim list' = '? h'
        'email dkim update' = '? h'
        'email domain change-compartment' = '? c h'
        'email domain create' = '? c h'
        'email domain delete' = '? h'
        'email domain get' = '? h'
        'email domain list' = '? c h'
        'email domain update' = '? h'
        'email email-return-path create' = '? h'
        'email email-return-path delete' = '? h'
        'email email-return-path get' = '? h'
        'email email-return-path list' = '? c h'
        'email email-return-path update' = '? h'
        'email sender change-compartment' = '? c h'
        'email sender create' = '? c h'
        'email sender delete' = '? h'
        'email sender get' = '? h'
        'email sender list' = '? c h'
        'email sender update' = '? h'
        'email suppression create' = '? c h'
        'email suppression delete' = '? h'
        'email suppression get' = '? h'
        'email suppression list' = '? c h'
        'email work-request get' = '? h'
        'email work-request list' = '? c h'
        'email work-request-error list' = '? h'
        'email work-request-log list' = '? h'
    }
    return $ociCommandsToShortParams
}
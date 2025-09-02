function GetOciTopLevelCommand_usage() {
    return 'usage'
}

function GetOciSubcommands_usage() {
    $ociSubcommands = @{
        'usage' = 'resources rewards usagelimits'
        'usage resources' = 'resource-quotum-summary resource-summary'
        'usage resources resource-quotum-summary' = 'list-resource-quota'
        'usage resources resource-summary' = 'list-resources'
        'usage rewards' = 'monthly-reward-summary product-summary redeemable-user redeemable-user-summary redemption-summary'
        'usage rewards monthly-reward-summary' = 'list-rewards'
        'usage rewards product-summary' = 'list-products'
        'usage rewards redeemable-user' = 'create delete'
        'usage rewards redeemable-user-summary' = 'list-redeemable-users'
        'usage rewards redemption-summary' = 'list-redemptions'
        'usage usagelimits' = 'usage-limit-summary'
        'usage usagelimits usage-limit-summary' = 'list-usage-limits'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_usage() {
    $ociCommandsToLongParams = @{
        'usage resources resource-quotum-summary list-resource-quota' = 'all compartment-id from-json help limit page page-size service-entitlement service-name sort-by sort-order'
        'usage resources resource-summary list-resources' = 'all compartment-id entitlement-id from-json help limit page page-size service-name sort-by sort-order'
        'usage rewards monthly-reward-summary list-rewards' = 'all from-json help subscription-id tenancy-id'
        'usage rewards product-summary list-products' = 'all from-json help limit page page-size producttype sort-by sort-order subscription-id tenancy-id usage-period-key'
        'usage rewards redeemable-user create' = 'from-json help if-match items subscription-id tenancy-id user-id'
        'usage rewards redeemable-user delete' = 'email-id force from-json help if-match subscription-id tenancy-id'
        'usage rewards redeemable-user-summary list-redeemable-users' = 'all from-json help limit page page-size sort-by sort-order subscription-id tenancy-id'
        'usage rewards redemption-summary list-redemptions' = 'all from-json help limit page page-size sort-by sort-order subscription-id tenancy-id time-redeemed-greater-than-or-equal-to time-redeemed-less-than'
        'usage usagelimits usage-limit-summary list-usage-limits' = 'all compartment-id from-json help limit limit-type page page-size resource-type service-type sort-by sort-order subscription-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_usage() {
    $ociCommandsToShortParams = @{
        'usage resources resource-quotum-summary list-resource-quota' = '? c h'
        'usage resources resource-summary list-resources' = '? c h'
        'usage rewards monthly-reward-summary list-rewards' = '? h'
        'usage rewards product-summary list-products' = '? h'
        'usage rewards redeemable-user create' = '? h'
        'usage rewards redeemable-user delete' = '? h'
        'usage rewards redeemable-user-summary list-redeemable-users' = '? h'
        'usage rewards redemption-summary list-redemptions' = '? h'
        'usage usagelimits usage-limit-summary list-usage-limits' = '? c h'
    }
    return $ociCommandsToShortParams
}
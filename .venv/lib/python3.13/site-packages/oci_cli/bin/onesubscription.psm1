function GetOciTopLevelCommand_onesubscription() {
    return 'onesubscription'
}

function GetOciSubcommands_onesubscription() {
    $ociSubcommands = @{
        'onesubscription' = 'billing-schedule commitment computed-usage invoice-summary organization-subscription ratecard subscribed-service subscription'
        'onesubscription billing-schedule' = 'billing-schedule-summary'
        'onesubscription billing-schedule billing-schedule-summary' = 'list-billing-schedules'
        'onesubscription commitment' = 'commitment'
        'onesubscription commitment commitment' = 'get list'
        'onesubscription computed-usage' = 'aggregated-computed-usage-summary computed-usage'
        'onesubscription computed-usage aggregated-computed-usage-summary' = 'list-aggregated-computed-usages'
        'onesubscription computed-usage computed-usage' = 'get list'
        'onesubscription invoice-summary' = 'invoice invoiceline-computed-usage'
        'onesubscription invoice-summary invoice' = 'list'
        'onesubscription invoice-summary invoiceline-computed-usage' = 'list'
        'onesubscription organization-subscription' = 'organization-subscription'
        'onesubscription organization-subscription organization-subscription' = 'list'
        'onesubscription ratecard' = 'rate-card'
        'onesubscription ratecard rate-card' = 'list'
        'onesubscription subscribed-service' = 'subscribed-service'
        'onesubscription subscribed-service subscribed-service' = 'get list'
        'onesubscription subscription' = 'subscription'
        'onesubscription subscription subscription' = 'list'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_onesubscription() {
    $ociCommandsToLongParams = @{
        'onesubscription billing-schedule billing-schedule-summary list-billing-schedules' = 'all compartment-id from-json help limit page page-size sort-by sort-order subscribed-service-id subscription-id'
        'onesubscription commitment commitment get' = 'commitment-id from-json help'
        'onesubscription commitment commitment list' = 'all compartment-id from-json help limit page page-size sort-by sort-order subscribed-service-id'
        'onesubscription computed-usage aggregated-computed-usage-summary list-aggregated-computed-usages' = 'all compartment-id from-json grouping help limit page page-size parent-product subscription-id time-from time-to'
        'onesubscription computed-usage computed-usage get' = 'compartment-id computed-usage-id fields from-json help'
        'onesubscription computed-usage computed-usage list' = 'all compartment-id computed-product from-json help limit page page-size parent-product sort-by sort-order subscription-id time-from time-to'
        'onesubscription invoice-summary invoice list' = 'all ar-customer-transaction-id compartment-id fields from-json help limit page page-size sort-by sort-order time-from time-to'
        'onesubscription invoice-summary invoiceline-computed-usage list' = 'all compartment-id fields from-json help invoice-line-id limit page page-size sort-by sort-order'
        'onesubscription organization-subscription organization-subscription list' = 'all compartment-id from-json help limit page page-size sort-by sort-order'
        'onesubscription ratecard rate-card list' = 'all compartment-id from-json help limit page page-size part-number sort-by sort-order subscription-id time-from time-to'
        'onesubscription subscribed-service subscribed-service get' = 'fields from-json help subscribed-service-id'
        'onesubscription subscribed-service subscribed-service list' = 'all compartment-id from-json help limit order-line-id page page-size sort-by sort-order status subscription-id'
        'onesubscription subscription subscription list' = 'all buyer-email compartment-id from-json help is-commit-info-required limit page page-size plan-number sort-by sort-order subscription-id'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_onesubscription() {
    $ociCommandsToShortParams = @{
        'onesubscription billing-schedule billing-schedule-summary list-billing-schedules' = '? c h'
        'onesubscription commitment commitment get' = '? h'
        'onesubscription commitment commitment list' = '? c h'
        'onesubscription computed-usage aggregated-computed-usage-summary list-aggregated-computed-usages' = '? c h'
        'onesubscription computed-usage computed-usage get' = '? c h'
        'onesubscription computed-usage computed-usage list' = '? c h'
        'onesubscription invoice-summary invoice list' = '? c h'
        'onesubscription invoice-summary invoiceline-computed-usage list' = '? c h'
        'onesubscription organization-subscription organization-subscription list' = '? c h'
        'onesubscription ratecard rate-card list' = '? c h'
        'onesubscription subscribed-service subscribed-service get' = '? h'
        'onesubscription subscribed-service subscribed-service list' = '? c h'
        'onesubscription subscription subscription list' = '? c h'
    }
    return $ociCommandsToShortParams
}
function GetOciTopLevelCommand_management_dashboard() {
    return 'management-dashboard'
}

function GetOciSubcommands_management_dashboard() {
    $ociSubcommands = @{
        'management-dashboard' = 'dashboard saved-search'
        'management-dashboard dashboard' = 'change-compartment create delete export get import list update'
        'management-dashboard saved-search' = 'change-compartment create delete get list update'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_management_dashboard() {
    $ociCommandsToLongParams = @{
        'management-dashboard dashboard change-compartment' = 'compartment-id from-json help if-match management-dashboard-id'
        'management-dashboard dashboard create' = 'compartment-id dashboard-id data-config defined-tags description display-name freeform-tags from-json help is-favorite is-oob-dashboard is-show-description is-show-in-home metadata-version nls provider-id provider-name provider-version screen-image tiles type ui-config'
        'management-dashboard dashboard delete' = 'force from-json help if-match management-dashboard-id'
        'management-dashboard dashboard export' = 'export-dashboard-id from-json help'
        'management-dashboard dashboard get' = 'from-json help management-dashboard-id'
        'management-dashboard dashboard import' = 'dashboards defined-tags freeform-tags from-json help if-match'
        'management-dashboard dashboard list' = 'all compartment-id display-name from-json help limit page page-size sort-by sort-order'
        'management-dashboard dashboard update' = 'compartment-id data-config defined-tags description display-name force freeform-tags from-json help if-match is-favorite is-oob-dashboard is-show-description is-show-in-home management-dashboard-id metadata-version nls provider-id provider-name provider-version screen-image tiles type ui-config'
        'management-dashboard saved-search change-compartment' = 'compartment-id from-json help if-match management-saved-search-id'
        'management-dashboard saved-search create' = 'compartment-id data-config defined-tags description display-name freeform-tags from-json help id is-oob-saved-search metadata-version nls provider-id provider-name provider-version screen-image type ui-config widget-template widget-vm'
        'management-dashboard saved-search delete' = 'force from-json help if-match management-saved-search-id'
        'management-dashboard saved-search get' = 'from-json help management-saved-search-id'
        'management-dashboard saved-search list' = 'all compartment-id display-name from-json help limit page page-size sort-by sort-order'
        'management-dashboard saved-search update' = 'compartment-id data-config defined-tags description display-name force freeform-tags from-json help if-match is-oob-saved-search management-saved-search-id metadata-version nls provider-id provider-name provider-version screen-image type ui-config widget-template widget-vm'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_management_dashboard() {
    $ociCommandsToShortParams = @{
        'management-dashboard dashboard change-compartment' = '? c h'
        'management-dashboard dashboard create' = '? c h'
        'management-dashboard dashboard delete' = '? h'
        'management-dashboard dashboard export' = '? h'
        'management-dashboard dashboard get' = '? h'
        'management-dashboard dashboard import' = '? h'
        'management-dashboard dashboard list' = '? c h'
        'management-dashboard dashboard update' = '? c h'
        'management-dashboard saved-search change-compartment' = '? c h'
        'management-dashboard saved-search create' = '? c h'
        'management-dashboard saved-search delete' = '? h'
        'management-dashboard saved-search get' = '? h'
        'management-dashboard saved-search list' = '? c h'
        'management-dashboard saved-search update' = '? c h'
    }
    return $ociCommandsToShortParams
}
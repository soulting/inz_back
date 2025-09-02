function GetOciTopLevelCommand_multicloud() {
    return 'multicloud'
}

function GetOciSubcommands_multicloud() {
    $ociSubcommands = @{
        'multicloud' = 'metadata multi-clouds-metadata omhub-network-anchor omhub-resource-anchor'
        'multicloud metadata' = 'external-location-mapping-metadatum-summary-collection external-location-summaries-metadatum-summary-collection external-locations-metadatum-collection'
        'multicloud metadata external-location-mapping-metadatum-summary-collection' = 'list-external-location-mapping-metadata'
        'multicloud metadata external-location-summaries-metadatum-summary-collection' = 'list-external-location-summaries-metadata'
        'multicloud metadata external-locations-metadatum-collection' = 'list-external-location-details-metadata'
        'multicloud multi-clouds-metadata' = 'multi-cloud-metadata multi-cloud-metadata-collection'
        'multicloud multi-clouds-metadata multi-cloud-metadata' = 'get'
        'multicloud multi-clouds-metadata multi-cloud-metadata-collection' = 'list-multi-cloud-metadata'
        'multicloud omhub-network-anchor' = 'network-anchor network-anchor-collection'
        'multicloud omhub-network-anchor network-anchor' = 'get'
        'multicloud omhub-network-anchor network-anchor-collection' = 'list-network-anchors'
        'multicloud omhub-resource-anchor' = 'resource-anchor resource-anchor-collection'
        'multicloud omhub-resource-anchor resource-anchor' = 'get'
        'multicloud omhub-resource-anchor resource-anchor-collection' = 'list-resource-anchors'
    }
    return $ociSubcommands
}

function GetOciCommandsToLongParams_multicloud() {
    $ociCommandsToLongParams = @{
        'multicloud metadata external-location-mapping-metadatum-summary-collection list-external-location-mapping-metadata' = 'all compartment-id from-json help limit page page-size sort-by sort-order subscription-id subscription-service-name'
        'multicloud metadata external-location-summaries-metadatum-summary-collection list-external-location-summaries-metadata' = 'all compartment-id entity-type from-json help limit page page-size sort-by sort-order subscription-id subscription-service-name'
        'multicloud metadata external-locations-metadatum-collection list-external-location-details-metadata' = 'all compartment-id entity-type from-json help limit linked-compartment-id page page-size sort-by sort-order subscription-id subscription-service-name'
        'multicloud multi-clouds-metadata multi-cloud-metadata get' = 'compartment-id from-json help subscription-id'
        'multicloud multi-clouds-metadata multi-cloud-metadata-collection list-multi-cloud-metadata' = 'all compartment-id from-json help limit page page-size sort-by sort-order'
        'multicloud omhub-network-anchor network-anchor get' = 'external-location from-json help network-anchor-id subscription-id subscription-service-name'
        'multicloud omhub-network-anchor network-anchor-collection list-network-anchors' = 'all compartment-id display-name external-location from-json help id lifecycle-state limit network-anchor-oci-subnet-id network-anchor-oci-vcn-id page page-size sort-by sort-order subscription-id subscription-service-name'
        'multicloud omhub-resource-anchor resource-anchor get' = 'from-json help resource-anchor-id subscription-id subscription-service-name'
        'multicloud omhub-resource-anchor resource-anchor-collection list-resource-anchors' = 'all compartment-id display-name from-json help id is-compartment-id-in-subtree lifecycle-state limit linked-compartment-id page page-size sort-by sort-order subscription-id subscription-service-name'
    }
    return $ociCommandsToLongParams
}

function GetOciCommandsToShortParams_multicloud() {
    $ociCommandsToShortParams = @{
        'multicloud metadata external-location-mapping-metadatum-summary-collection list-external-location-mapping-metadata' = '? c h'
        'multicloud metadata external-location-summaries-metadatum-summary-collection list-external-location-summaries-metadata' = '? c h'
        'multicloud metadata external-locations-metadatum-collection list-external-location-details-metadata' = '? c h'
        'multicloud multi-clouds-metadata multi-cloud-metadata get' = '? c h'
        'multicloud multi-clouds-metadata multi-cloud-metadata-collection list-multi-cloud-metadata' = '? c h'
        'multicloud omhub-network-anchor network-anchor get' = '? h'
        'multicloud omhub-network-anchor network-anchor-collection list-network-anchors' = '? c h'
        'multicloud omhub-resource-anchor resource-anchor get' = '? h'
        'multicloud omhub-resource-anchor resource-anchor-collection list-resource-anchors' = '? c h'
    }
    return $ociCommandsToShortParams
}
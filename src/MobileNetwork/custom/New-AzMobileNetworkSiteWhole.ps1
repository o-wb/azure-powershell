
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Creates a mobile network site, packet core control plane, packet core data plane and attached data network.
.Description
Creates a mobile network site, packet core control plane, packet core data plane and attached data network.
All are created in the same resource group and location specified.
.Example
New-AzMobileNetworkSiteWhole -MobileNetworkName azps-mn -Name azps-mn-site -ResourceGroupName azps_test_group -Location eastus -Tag @{"site"="123"}

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Models.Api20221101.ISite
Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Models.Api20221101.IPacketCoreControlPlane
Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Models.Api20221101.IPacketCoreDataPlane
Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Models.Api20221101.IAttachedDataNetwork
.Link
https://learn.microsoft.com/powershell/module/az.mobilenetwork/new-azmobilenetworksitewhole
#>

# Path: custom\New-AzMobileNetworkSiteWhole.ps1

function Deploy-AzMobileNetwork {
    # TODO: Have OutputType for each of the resources created by the function
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Models.Api20221101.ISite])]

    param(
        # TODO: Add parameter for DeploymentMode
        # TODO: Confirm the following should not be implemented: SimGroupNames, DataNetworkName
        # Defaults should be SKU = G0, PlatformType=AKS-HCI

        [Parameter(Mandatory)]
        [Alias('SiteName')]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Path')]
        [System.String]
        # The root name of the whole set of site resources.
        ${Name},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Path')]
        [System.String]
        # The name of the mobile network.
        ${MobileNetworkName},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Path')]
        [System.String]
        # The name of the resource group.
        # The name is case insensitive.
        ${ResourceGroupName},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The geo-location where the resource lives
        ${Location},
        
        [Parameter()]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Support.PlatformType])]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Support.PlatformType]
        # The platform type of the mobile network.
        ${PlatformType},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The logical name for this interface.
        # This should match one of the interfaces configured on your Azure Stack Edge device.
        ${ControlPlaneAccessInterfaceName},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The IPv4 address.
        ${ControlPlaneAccessInterfaceIpv4Address},

        # parameter for UserPlaneAccessInterfaceName
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The logical name for this interface.
        # This should match one of the interfaces configured on your Azure Stack Edge device.
        ${UserPlaneAccessInterfaceName},

        # parameter for UserPlaneAccessInterfaceIpv4Address
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The IPv4 address.
        ${UserPlaneAccessInterfaceIpv4Address},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The IPv4 address range for the access subnet.
        ${AccessSubnet},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The IPv4 address of the access gateway.
        ${AccessGateway},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The logical name for this interface.
        # This should match one of the interfaces configured on your Azure Stack Edge device.
        ${UserPlaneDataInterfaceName},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The IPv4 address.
        ${UserPlaneDataInterfaceIpv4Address},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The IPv4 address range for the data subnet.
        ${UserPlaneDataInterfaceSubnet},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # The IPv4 address of the data gateway.
        ${UserPlaneDataInterfaceGateway},

        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String[]]
        # The user equipment (UE) address pool prefixes for the attached data network from which the packet core instance will dynamically assign IP addresses to UEs.The packet core instance assigns an IP address to a UE when the UE sets up a PDU session.
        # You must define at least one of userEquipmentAddressPoolPrefix and userEquipmentStaticAddressPoolPrefix.
        # If you define both, they must be of the same size.
        ${UserEquipmentAddressPoolPrefix},
    
        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String[]]
        # The user equipment (UE) address pool prefixes for the attached data network from which the packet core instance will assign static IP addresses to UEs.The packet core instance assigns an IP address to a UE when the UE sets up a PDU session.
        # The static IP address for a specific UE is set in StaticIPConfiguration on the corresponding SIM resource.At least one of userEquipmentAddressPoolPrefix and userEquipmentStaticAddressPoolPrefix must be defined.
        # If both are defined, they must be of the same size.
        ${UserEquipmentStaticAddressPoolPrefix},
        
        [Parameter()]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Support.CoreNetworkType])]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Support.CoreNetworkType]
        # The core network technology generation (5G core or EPC / 4G core).
        ${CoreNetworkTechnology},

        [Parameter()]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Support.NaptEnabled])]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Support.NaptEnabled]
        # Whether NAPT is enabled for connections to this attached data network.
        ${NaptEnabled},

        [Parameter(Mandatory)]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String[]]
        # The DNS servers to signal to UEs to use for this attached data network.
        # This configuration is mandatory - if you don't want DNS servers, you must provide an empty array.
        ${DnsAddress},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.String]
        # Azure Arc custom location resource ID.
        ${CustomLocationId},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # The ID of the target subscription.
        ${SubscriptionId},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Body')]
        [System.Collections.Hashtable]
        # Resource tags.
        ${Tag},
                
        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        $Confirm,
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.MobileNetwork.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${WhatIf}

    )
        
    $names = @{
        Site = "$Name-site"
        PacketCoreControlPlane = "$Name-pccp"
        PacketCoreDataPlane = "$Name-pcdp"
        AttachedDataNetwork = "$Name-adn"
    }
        
    $LocalDiagnosticAccessAuthenticationType = 'None' # TODO: Confirm if this is the correct default value
    $platformType = 'AKS-HCI'
    $Sku = '' # TODO: Confirm what the default value should be

    
    # Make a dictionary of the parameters required by New-AzMobileNetworkSite

    $PSBoundParametersSite = @{
        MobileNetworkName = $MobileNetworkName
        Name = $names.Site
        ResourceGroupName = $ResourceGroupName
        SubscriptionId = $SubscriptionId
        Location = $Location
        Tag = $Tag
    }
    # If DefaultProfile is not null, add it to the dictionary
    if ($DefaultProfile) {
        $PSBoundParametersSite['DefaultProfile'] = $DefaultProfile
    }

    # Other options
    # Create copy of PSBoundParameters, then create an inner function that receives an
    # array of the parameters you want to keep, then loop through these parameters, check if they're there, and if not then remove

    # Create a copy of the PSBoundParameters (using newdictionary)
    


    $PSBoundParameters = $PSBoundParameters.Clone()

    # How can I make a copy of PSBoundParameters without using Clone()?
    # $PSBoundParameters = @{}
    # foreach ($key in $PSBoundParameters.Keys) {
    #     $PSBoundParameters[$key] = $PSBoundParameters[$key]
    # }




    # Create an array of the parame#ters required for Site
    $SiteParameters = @(
        'MobileNetworkName',
        'Name',
        'ResourceGroupName',
        'SubscriptionId',
        'Location',
        'Tag',
        'DefaultProfile'
    )

    # Loop through the above and if they're not present in the PSBoundParameters, remove them
    foreach ($parameter in $SiteParameters) {
        if (-not $PSBoundParameters.ContainsKey($parameter)) {
            $PSBoundParameters.Remove($parameter)
        }
    }

    # Make a dictionary of the parameters required by New-AzMobileNetworkPacketCoreControlPlane
    $PSBoundParametersPacketCoreControlPlane = @{
        MobileNetworkName = $MobileNetworkName
        Name = $names.PacketCoreControlPlane
        ResourceGroupName = $ResourceGroupName
        SubscriptionId = $SubscriptionId
        LocalDiagnosticAccessAuthenticationType = $LocalDiagnosticAccessAuthenticationType
        Location = $Location
        PlatformType = $platformType
        Site = $site.Id
        Sku = $Sku
        # AzureStackEdgeDeviceId = $AzureStackEdgeDeviceId
        # AzureStackHciClusterId = $AzureStackHciClusterId
        # ConnectedClusterId = $ConnectedClusterId
        ControlPlaneAccessInterfaceName = $ControlPlaneAccessInterfaceName
        ControlPlaneAccessInterfaceIpv4Address = $ControlPlaneAccessInterfaceIpv4Address
        CoreNetworkTechnology = $CoreNetworkTechnology
        CustomLocationId = $CustomLocationId
        Tag = $Tag
    }
    
    # Make a dictionary of the parameters required by New-AzMobileNetworkPacketCoreDataPlane
    $PSBoundParametersPacketCoreDataPlane = @{
        MobileNetworkName = $MobileNetworkName
        Name = $names.PacketCoreDataPlane
        PacketCoreControlPlaneName = $names.PacketCoreControlPlane
        ResourceGroupName = $ResourceGroupName
        SubscriptionId = $SubscriptionId
        Location = $Location
        UserPlaneAccessInterfaceName = $UserPlaneAccessInterfaceName
        UserPlaneAccessInterfaceIpv4Address = $UserPlaneAccessInterfaceIpv4Address
        UserPlaneAccessInterfaceIpv4Gateway = $AccessGateway
        UserPlaneAccessInterfaceIpv4Subnet = $AccessSubnet
        Tag = $Tag
    }

    # Make a dictionary of the parameters required by New-AzMobileNetworkAttachedDataNetwork
    $PSBoundParametersAttachedDataNetwork = @{
        MobileNetworkName = $MobileNetworkName
        Name = $names.AttachedDataNetwork
        Location = $Location
        PacketCoreControlPlaneName = $names.PacketCoreControlPlane
        PacketCoreDataPlaneName = $names.PacketCoreDataPlane
        ResourceGroupName = $ResourceGroupName
        SubscriptionId = $SubscriptionId
        UserEquipmentAddressPoolPrefix = $UserEquipmentAddressPoolPrefix
        UserEquipmentStaticAddressPoolPrefix = $UserEquipmentStaticAddressPoolPrefix
        UserPlaneDataInterfaceIpv4Address = $UserPlaneDataInterfaceIpv4Address
        UserPlaneDataInterfaceIpv4Gateway = $UserPlaneDataInterfaceIpv4Gateway
        UserPlaneDataInterfaceIpv4Subnet = $UserPlaneDataInterfaceIpv4Subnet
        UserPlaneDataInterfaceName = $UserPlaneDataInterfaceName
        NaptConfigurationEnabled = $NaptEnabled
        DnsAddress = $DnsAddress
        Tag = $Tag
    }


    # Create the resources
    # Call New-AzMobileNetworkSite passing through the parameter dictionary
    $site = Az.MobileNetwork.internal\New-AzMobileNetworkSite @PSBoundParametersSite

    # Call New-AzMobileNetworkPacketCoreControlPlane passing through the parameter dictionary
    $packetCoreControlPlane = Az.MobileNetwork.internal\New-AzMobileNetworkPacketCoreControlPlane @PSBoundParametersPacketCoreControlPlane

    # Call New-AzMobileNetworkPacketCoreDataPlane passing through the parameter dictionary
    $packetCoreDataPlane = Az.MobileNetwork.internal\New-AzMobileNetworkPacketCoreDataPlane @PSBoundParametersPacketCoreDataPlane

    # Call New-AzMobileNetworkAttachedDataNetwork passing through the parameter dictionary
    $attachedDataNetwork = Az.MobileNetwork.internal\New-AzMobileNetworkAttachedDataNetwork @PSBoundParametersAttachedDataNetwork

}

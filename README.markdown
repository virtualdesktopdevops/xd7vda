# xd7vda #
This module installs an optimized Citrix master image ready for Machine Creation Service deployment.

## Integration informations
Windows 10 and Windows Server 2012R2 are the only OS supported in this first release :
- Windows 7, Windows 8, Windows 8.1, Windows 2008R2 have been deprecated by Citrix last summer at the realse of XenDesktop 7.15 LTSR
- Windows Server 2016 will be supported in a future release of this module

Optimizations :
- Unneeded registry keys removal
- Registry keys tweaking
- Disabling unneeded or resource consuming services
- Scheduled tasks removal
- Final optimization script deployed in C:\ to be run before each master image deployment (group policy and WEM policy update)

Features not (yet) supported :
- Provisioning Service (PvS). The Citrix Provisioning service target device agent is not deployed in this release.
- Server VDI on server OS image (windows 2012R2)

## Usage
- **vdaSourcePath** : (string) (mandatory) Path of a folder containing the Xendesktop 7.x installer (unarchive the ISO image in this folder). Can be a local or an UNC path
- **wemAgentSourcePath** : (string) (mandatory) Path of the WEM agent installer EXE file. Can be a local or an UNC path.
- **wemProductId** : (string) (mandatory) WEM agent MSI installer ProductID. The following line of code will list all products installed, including their name and IdentifyingNumber, which is the same as the ProductID `Get-WmiObject Win32_Product | Format-Table IdentifyingNumber, Name, Version`. Values provided below for latest WEM versions
  - **WEM 4.4** : 922301C1-F669-4327-AA4A-E0965E9E6BA9
  - **WEM 4.5** : F653DF76-CC33-4F18-BB04-1F90986BE7A0
- **vdaRole** : (string) (optional) Master image type ; DesktopVDA for Windows 10, SessionVDA for Server OS (Windows Server 2012R2 or Windows Server 2016). Default value : SessionVDA
- **vdaRemoteAssistanceFeature** : (bool) (optional) Enable remote assistance ? Default is false
- **deliveryController1** : (string) (mandatory) FQDN of the first Citrix Delivery Controller of the Xendesktop site
- **deliveryController2** : (string) (optional) FQDN of a second Citrix Delivery Controller
- **rdsLicenseServer** : (string) (mandatory for SessionVDA) FQDN of the Microsoft RDS License server. Required for application publishing through a Session VDA.
- **pagefileSize** (int) (optional) Fixed size of Windows pagefile. Default value : 2048


## Installing a Citrix master image

~~~puppet
node 'master-w2k12r2' {
	class{'xd7vda':
    vdaSourcePath => '\\\\fileserver\\xendesktop715',
    wemAgentSourcePath =>'\\\\fileserver\\wem405\\wemagent405.exe',
    wemProductId => 'F653DF76-CC33-4F18-BB04-1F90986BE7A0',
    vdaRole => 'SessionVDA',
    vdaRemoteAssistanceFeature => false,
    deliveryController1 => 'dc-01.ctxlab.aws',
    deliveryController2 = 'dc-02.ctxlab.aws',
    rdsLicenseServer = 'srv-lic01',
    pagefileSize => 2048
	}
}
~~~

~~~puppet
node 'master-w10' {
	class{'xd7vda':
    vdaSourcePath => '\\\\fileserver\\xendesktop715',
    wemAgentSourcePath => '\\\fileserver\\wem405\\wemagent405.exe',
    wemProductId => 'F653DF76-CC33-4F18-BB04-1F90986BE7A0',
    vdaRole => 'DesktopVDA',
    vdaRemoteAssistanceFeature => false,
    deliveryController1 => 'dc-01.ctxlab.aws',
    deliveryController2 = 'dc-02.ctxlab.aws',
    pagefileSize => 2048
	}
}
~~~

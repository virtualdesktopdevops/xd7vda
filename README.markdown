# Citrix XenDesktop 7 VDA master image puppet module #
This module installs an optimized Citrix XenDesktop 7 master image ready for Machine Creation Service deployment.

## Requirements ##

The minimum Windows Management Framework (PowerShell) version required is 5.0 or higher, which ships with Windows 10 or Windows Server 2016, but can also be installed on Windows 7 SP1, Windows 8.1, Windows Server 2008 R2 SP1, Windows Server 2012 and Windows Server 2012 R2.

This module requires a custom version of the puppetlabs-dsc module compiled with [XenDesktop Powershell DSC Resource](https://github.com/VirtualEngine/XenDesktop7) as a dependency. Ready to use module provided on [Github](https://github.com/virtualdesktopdevops/puppetlabs-dsc/tree/1.6.0_custom).

## Change log ##

A full list of changes in each version can be found in the [change log](CHANGELOG.md).


## Integration informations ##
Windows 10 and Windows Server 2012R2 are the only OS supported in this first release :
- Windows 7, Windows 8, Windows 8.1, Windows 2008R2 support has been deprecated by Citrix last summer at the release of XenDesktop 7.15 LTSR
- Windows 10 virtual machine has to be configured with Secure Boot disabled to allow Citrix Desktop OS VDA installation.
- Windows Server 2016 will be supported in a future release of this module

_Optimizations :_
- Unneeded registry keys removal
- Registry keys tweaking
- Disabling unneeded or resource consuming services
- Scheduled tasks removal
- Final optimization script deployed in C:\ to be run before each master image deployment (group policy and WEM policy update)

_Features not (yet) supported :_
- Provisioning Service (PvS). The Citrix Provisioning service target device agent is not deployed in this release.
- Server VDI on server OS image (Windows 2012R2)

**VERY IMPORTANT** : RUN C:\run-before-publishing-master.bat AT EACH TIME BEFORE CREATING A SNAPSHOT OF YOUR MASTER IMAGE. SHUTDOWN THE VITUAL MACHINE JUST AFTER. THIS SCRIPT CONTAINS FINAL OPTIMIZATIONS FOR YOUR CITRIX VDA.

## Usage ##
* **`[String]` vdasourcepath** _(Required)_: Path of a folder containing the Citrix Xendesktop 7.x installer (unarchive the ISO image in this folder). Can be a local or an UNC path
* **`[String]` wemagentsourcepath** _(Required)_: Path of the WEM agent installer EXE file. Can be a local or an UNC path.
* **`[String]` wemproductid** _(Required)_: WEM agent MSI installer ProductID. The following line of code will list all products installed, including their name and IdentifyingNumber, which is the same as the ProductID `Get-WmiObject Win32_Product | Format-Table IdentifyingNumber, Name, Version`. Values provided below for latest WEM versions
  - **WEM 4.4** : 922301C1-F669-4327-AA4A-E0965E9E6BA9
  - **WEM 4.5** : F653DF76-CC33-4F18-BB04-1F90986BE7A0
* **`[String]` vdarole** _(Required `[DesktopVDA|SessionVDA]`)_: Master image type ; DesktopVDA for Windows 10, SessionVDA for Server OS (Windows Server 2012R2 or Windows Server 2016). Default value : SessionVDA
* **`[String]` deliverycontroller1** _(Required)_: FQDN of the first Citrix Delivery Controller of the Xendesktop site
* **`[String]` deliverycontroller2** _(Optional)_: FQDN of a second Citrix Delivery Controller
* **`[String]` rdslicenseserver** _(Required for SessionVDA)_: FQDN of the Microsoft RDS License server. Required for application publishing through a Session VDA.
* **`[Boolean]` vdaremoteassistancefeature** _(Optional, default if false)_: Enable remote assistance ? Default is false
* **`[Integer]` pagefilesize** _(Optional, default is 2048)_: Fixed size of Windows pagefile. Default value : 2048


## Installing a Citrix Xendesktop 7 master image ##

~~~puppet
  node 'master-w2k12r2' {
    class{'xd7vda':
      vdasourcepath              => '\\\\fileserver\\xendesktop715',
      wemagentsourcepath         =>'\\\\fileserver\\wem405\\wemagent405.exe',
      wemproductid               => 'F653DF76-CC33-4F18-BB04-1F90986BE7A0',
      vdarole                    => 'SessionVDA',
      deliverycontroller1        => 'dc-01.ctxlab.aws',
      deliverycontroller2        => 'dc-02.ctxlab.aws',
      rdslicenseserver           => 'srv-lic01',
      vdaremoteassistancefeature => false,
      pagefilesize               => 2048
    }
  }

  node 'master-w10' {
    class{'xd7vda':
      vdasourcepath              => '\\\\fileserver\\xendesktop715',
      wemagentsourcepath         => '\\\fileserver\\wem405\\wemagent405.exe',
      wemproductid               => 'F653DF76-CC33-4F18-BB04-1F90986BE7A0',
      vdarole                    => 'DesktopVDA',
      deliverycontroller1        => 'dc-01.ctxlab.aws',
      deliverycontroller2        => 'dc-02.ctxlab.aws',
      vdaremoteassistancefeature => false,
      pagefilesize               => 2048
    }
  }
~~~

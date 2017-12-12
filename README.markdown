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
- **svc_username** : (string) (mandatory) Privileged account used by Puppet 
- **svc_password** : (string) (mandatory) Password of the privileged account. Should be encrypted with hiera-eyaml.
- **vdaSourcePath** : (string) (mandatory) Path of a folder containing the Xendesktop 7.x installer (unarchive the ISO image in this folder). Can be a local or an UNC path
- **wemAgentSourcePath** : (string) (mandatory) Path of the WEM agent installer EXE file. Can be a local or an UNC path.
- **vdaRole** : (string)Master image type ; DesktopVDA for Windows 10, SessionVDA for Server OS (Windows Server 2012R2 or Windows Server 2016)
- **vdaRemoteAssistanceFeature** : (bool) (optional) Enable remote assistance ? Default is false
- **deliveryController1** : (string) (mandatory) FQDN of the first Citrix Delivery Controller of the Xendesktop site
- **deliveryController2** : (string) (optional) FQDN of a second Citrix Delivery Controller
- **rdsLicenseServer** : (string) (mandatory for SessionVDA) FQDN of the Microsoft RDS License server. Required for application publishing through a Session VDA.
- **domainNetbiosName** (string) Domain NETBIOS name


## Installing a Citrix master image

~~~puppet
node 'master-w2k12r2' {
	class{'xd7vda':
	  svc_username => 'TESTLAB\svc-puppet',
	  svc_password => 'P@ssw0rd',
	  vdaSourcePath => '\\fileserver\xendesktop715',
	  wemAgentSourcePath =>'\\fileserver\wem404\wemagent404.exe',
	  vdaRole => 'SessionVDA', # string { DesktopVDA | SessionVDA }
	  vdaRemoteAssistanceFeature => false,
	  deliveryController1 => 'dc-01.ctxlab.aws',
	  deliveryController2 = 'dc-02.ctxlab.aws',
	  rdsLicenseServer = 'srv-lic01',
	  domainNetbiosName='TESTLAB'
	}
}
~~~

~~~puppet
node 'master-w10' {
	class{'xd7vda':
	  svc_username => 'TESTLAB\svc-puppet',
	  svc_password => 'P@ssw0rd',
	  vdaSourcePath => '\\fileserver\xendesktop715',
	  wemAgentSourcePath =>'\\fileserver\wem404\wemagent404.exe',
	  vdaRole => 'DesktopVDA', # string { DesktopVDA | SessionVDA }
	  vdaRemoteAssistanceFeature => false,
	  deliveryController1 => 'dc-01.ctxlab.aws',
	  deliveryController2 = 'dc-02.ctxlab.aws',
	  domainNetbiosName='TESTLAB'
	}
}
~~~
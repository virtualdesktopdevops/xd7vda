class xd7vda::w10disableservices inherits xd7vda {
	if ($osfamily == 'windows') and ($facts['os']['release']['major']==10) {
		#Puppet agent will be run manually  
		dsc_xservice{'PuppetAgent':
		  dsc_name => 'puppet',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'
		}
		
		#Disabling AllJoyn Router service
		dsc_xservice{'AJRouter':
		  dsc_name => 'AJRouter',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Application Layer Gateway service
		dsc_xservice{'ALG':
		  dsc_name => 'ALG',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
    }
	
		#Disabling Background Intelligent Transfer service
		dsc_xservice{'BITS':
		  dsc_name => 'BITS',
      dsc_state => 'stopped',
      dsc_startuptype => 'Manual'
		}
		
		#Disabling Bitlocker Drive Encryption service
		dsc_xservice{'BDESVC':
		  dsc_name => 'BDESVC',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Block Level Backup Engine service
		dsc_xservice{'wbengine':
		  dsc_name => 'wbengine',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Bluetooth Handsfree service
		dsc_xservice{'BthHFSrv':
		  dsc_name => 'BthHFSrv',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Bluetooth Support service
		dsc_xservice{'bthserv':
		  dsc_name => 'bthserv',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Branche Cache service
		dsc_xservice{'PeerDistSvc':
		  dsc_name => 'PeerDistSvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Computer Browser service
		dsc_xservice{'Browser':
		  dsc_name => 'Browser',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Device Association Service
		dsc_xservice{'DeviceAssociationService':
		  dsc_name => 'DeviceAssociationService',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'  
		}
		
		#Disabling Diagnostic Policy service
		dsc_xservice{'DPS':
		  dsc_name => 'DPS',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
		}
		
		#Disabling Diagnostic service Host service
		dsc_xservice{'WdiServiceHost':
		  dsc_name => 'WdiServiceHost',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Diagnostic System Host service
		dsc_xservice{'WdiSystemHost':
		  dsc_name => 'WdiSystemHost',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Encrypting File System service
		dsc_xservice{'EFS':
		  dsc_name => 'EFS',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Fax service
		dsc_xservice{'Fax':
		  dsc_name => 'Fax',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Function Discovery Provider Host service
		dsc_xservice{'fdPHost':
		  dsc_name => 'fdPHost',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'  
		}
		
		#Disabling Function Discovery Resource Publication service
		dsc_xservice{'FDResPub':
		  dsc_name => 'FDResPub',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'  
		}
		
		#Disabling Home Group Listener service
		dsc_xservice{'HomeGroupListener':
		  dsc_name => 'HomeGroupListener',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Internet Connection Sharing (ICS) service
		dsc_xservice{'SharedAccess':
		  dsc_name => 'SharedAccess',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Infrared Monitoring service
		dsc_xservice{'irmon':
		  dsc_name => 'irmon',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Microsoft Account Sign-in Assistant service
		#dsc_xservice{'wlidsvc':
		#  dsc_name => 'wlidsvc',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'  
		#}
		
		#Disabling Microsoft iSCSI Initiator service
		#dsc_xservice{'MSiSCSI':
		#  dsc_name => 'MSiSCSI',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'
		#}
		
		#Disabling Microsoft Maps Download Manager service
		#dsc_xservice{'MapsBroker':
		#  dsc_name => 'MapsBroker',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'
		#}
		
		
		#Disabling Offline Files service
		dsc_xservice{'CscService':
		  dsc_name => 'CscService',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Optimize drives service
		dsc_xservice{'defragsvc':
		  dsc_name => 'defragsvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Phone service
		#dsc_xservice{'PhoneSvc':
		#  dsc_name => '',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'
		#}
		
		#Disabling Program Compatibility Assistant service
		#dsc_xservice{'PcaSvc':
		#  dsc_name => '',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'
		#}
		
		#Disabling Payments and NFC/SE Manager service
		#dsc_xservice{'SEMgrSvc':
		#  dsc_name => '',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'
		#}
		
		#Disabling Radio Management service
		#dsc_xservice{'RmSvc':
		#  dsc_name => '',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'
		#}
		
		#Disabling Retail Demo service
		dsc_xservice{'RetailDemo':
		  dsc_name => 'RetailDemo',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Security service
		dsc_xservice{'wscsvc':
		  dsc_name => 'wscsvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Secure Socket Tunneling Protocol service
		#dsc_xservice{'SstpSvc':
		#  dsc_name => '',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'
		#}
		
		#Disabling Sensor Data service
		#dsc_xservice{'SensorDataService':
		#  dsc_name => 'SensorDataService',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'
		#}
		
		#Disabling Sensor Monitoring service
		dsc_xservice{'SensrSvc':
		  dsc_name => 'SensrSvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Sensor service
		#dsc_xservice{'SensorService':
		#  dsc_name => 'SensorService',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'
		#}
		
		#Disabling Shell Hardware Detection service
		dsc_xservice{'ShellHWDetection':
		  dsc_name => 'ShellHWDetection',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
		}
		
		#Disabling SNMP Trap service
		#dsc_xservice{'SNMPTRAP':
		#  dsc_name => '',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled' 
		#}
		
		#Disabling Spot Verifier service
		#dsc_xservice{'svsvc':
		#  dsc_name => '',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled' 
		#}
		
		#Disabling SSDP Discovery service
		dsc_xservice{'SSDPSRV':
		  dsc_name => 'SSDPSRV',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}  
		  
		#Disabling Superfetch service
		dsc_xservice{'SysMain':
		  dsc_name => 'SysMain',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Themes service
		dsc_xservice{'Themes':
		  dsc_name => 'Themes',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Touch Keyboard and Handwriting Panel service
		#dsc_xservice{'TabletInputService':
		#  dsc_name => 'TabletInputService',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled' 
		#}
		
		#Disabling UPnP Device Host service
		dsc_xservice{'upnphost':
		  dsc_name => 'upnphost',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'
		}
		
		#Disabling Volume Shadow Copy service
		#dsc_xservice{'VSS':
		#  dsc_name => 'VSS',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled' 
		#}
		
		#Disabling Wi-fi Direct Connect Manager service
		#dsc_xservice{'WFDSConMgrSvc':
		#  dsc_name => 'WFDSConMgrSvc',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled' 
		#}
		
		#Disabling Windows Connect Now - Config Registrar service
		dsc_xservice{'wcncsvc':
		  dsc_name => 'wcncsvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
		}
		
		#Disabling Windows Error Reporting service
		dsc_xservice{'WerSvc':
		  dsc_name => 'WerSvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
		}
		
		#Disabling Windows Media Player Network Sharing service
		dsc_xservice{'WMPNetworkSvc':
		  dsc_name => 'WMPNetworkSvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
		}
		
		#Disabling Windows Mobile Hotspot service
		dsc_xservice{'icssvc':
		  dsc_name => 'icssvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
		}
		
		#Disabling Windows Search
    dsc_xservice{'WSearch':
      dsc_name => 'WSearch',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
    }
		
		#Disabling Windows Update service
		#dsc_xservice{'wuauserv':
		#}
		
		#Disabling WLAN AutoConfig service
		dsc_xservice{'WlanSvc':
		  dsc_name => 'WlanSvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
		}
		
		#Disabling WWAN AutoConfig service
		dsc_xservice{'WwanSvc':
		  dsc_name => 'WwanSvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'  
		}
		
		#Disabling Xbox Accessories Management service
		#dsc_xservice{'XboxGipSvc':
		#  dsc_name => 'XboxGipSvc',
    #  dsc_state => 'stopped',
    #  dsc_startuptype => 'Disabled'  
		#}
		
		#Disabling Xbox Live Auth Manager service
		dsc_xservice{'XblAuthManager':
		  dsc_name => 'XblAuthManager',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled'  
		}
		
		#Disabling Xbox Live Game Save service
		dsc_xservice{'XblGameSave':
		  dsc_name => 'XblGameSave',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
		}
		
		#Disabling Xbox Live Networking dsc_xservice service
		dsc_xservice{'XboxNetApiSvc':
		  dsc_name => 'XboxNetApiSvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
		}
		
		#Disabling Indexing Service
    dsc_xservice{'cisvc':
      dsc_name => 'cisvc',
      dsc_state => 'stopped',
      dsc_startuptype => 'Disabled' 
    } 
	
	}
}
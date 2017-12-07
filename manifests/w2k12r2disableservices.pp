class xd7vda::w2k12r2disableservices inherits xd7vda {
  if ($osfamily == 'windows') and ($facts['os']['release']['full']== '2012 R2') {
		#Puppet agent will be run manually  
		dsc_xservice{'PuppetAgent':
		  dsc_name => 'puppet',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled' 
		}
		
		#Application Layer Gateway Service  
		dsc_xservice{'ALG':
		  dsc_name => 'ALG',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled' 
		}
		
		#Connected User Experiences and Telemetry
		dsc_xservice{'DiagTrack':
		  dsc_name =>'DiagTrack',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled' 
		}
		
		#Computer Browser Service
		dsc_xservice{'Browser':
		  dsc_name =>'Browser',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled' 
		}
		
		#Diagnostic Policy Service
		dsc_xservice{'DPS':
		  dsc_name =>'DPS',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled' 
		}
		
		#Diagnostic Service Host
		dsc_xservice{'WdiServiceHost':
		  dsc_name =>'WdiServiceHost',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled' 
		}
		
		#dsc_xservice{'WdiSystemHost':
		#  dsc_name => 'WdiSystemHost',
		#  dsc_state => 'stopped',
		#  dsc_startuptype => 'Disabled'  
		#}
		
		#Encrypting Files System Service
		dsc_xservice{'EFS':
		  dsc_name => 'EFS',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled' 
		}
		
		#Function Discovery Provider Host
		dsc_xservice{'fdPHost':
		  dsc_name => 'fdPHost',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'
		}
		
		#Function Discovery Resource Publication
		dsc_xservice{'FDResPub':
		  dsc_name => 'FDResPub',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled' 
		}
		
		#Internet Connection Sharing
		dsc_xservice{'SharedAccess':
		  dsc_name => 'SharedAccess',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'
		}
		
		#Disk Defragmenter Service
		dsc_xservice{'defragsvc':
		  dsc_name => 'defragsvc',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'
		}
		
		#Shell Hardware Detection Service
		dsc_xservice{'ShellHWDetection':
		  dsc_name => 'ShellHWDetection',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'
		}
		
		#SSDP Discovery
		dsc_xservice{'SSDPSRV':
		  dsc_name => 'SSDPSRV',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'
		}
		
		#Superfetch
		dsc_xservice{'SysMain':
		  dsc_name => 'SysMain',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'
		}
		
		#Themes
		dsc_xservice{'Themes':
		  dsc_name => 'Themes',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'  
		}
		
		#UPnP Device Host Service
		dsc_xservice{'upnphost':
		  dsc_name => 'upnphost',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'
		}
		
		#Windows Error Reporting Service
		dsc_xservice{'WerSvc':
		  dsc_name => 'WerSvc',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled'
		}
		
		#Windows Search
		dsc_xservice{'WSearch':
		  dsc_name => 'WSearch',
		  dsc_state => 'stopped',
		  dsc_startuptype => 'Disabled' 
		}
		
		#Windows Update
		#dsc_xservice{'wuauserv':
		#  dsc_name => 'wuauserv',
		#  dsc_state => 'stopped',
		#  dsc_startuptype => 'Disabled'
		#}
  }
}
class xd7vda::config inherits xd7vda {

  #Register the primary controller
  dsc_xd7vdacontroller{'XD7VDAController1':
    dsc_name => $deliveryController1,
  }

  #Register the secondary controller only if the variable is set by the user
  if $deliveryController2 != '' {
	  dsc_xd7vdacontroller{'XD7VDAController2':
	    dsc_name => $deliveryController2,
	  }
	}

	if $vdaRole == 'SessionVDA' {
	  dsc_registry{'RDSLicenseServer':
	    dsc_key => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService\Parameters\LicenseServers',
	    dsc_valuename => 'SpecifiedLicenseServers',
	    dsc_valuedata => $rdsLicenseServer,
	    dsc_valuetype => 'MultiString',
    }

    dsc_registry{'RDSLicensingMode':
      dsc_key => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Terminal Server\RCM\Licensing Core',
      dsc_valuename => 'LicensingMode',
      dsc_valuedata => '4',
      dsc_valuetype => 'Dword'
    }
	}

	#Disable CEIP
	dsc_registry{'DisableCEIP':
	 dsc_key => 'HKEY_LOCAL_MACHINE\SOFTWARE\Citrix\CEIP',
	 dsc_valuename => 'CEIPSwitch',
	 dsc_valuedata => '0',
	 dsc_valuetype => 'Dword'
	}

	#Disable automatic upload of install/upgrade analytics
	dsc_registry{'DisableSendExperienceMetrics':
   dsc_key => 'HKEY_LOCAL_MACHINE\SOFTWARE\Citrix\MetaInstall',
   dsc_valuename => 'SendExperienceMetrics',
   dsc_valuedata => '0',
   dsc_valuetype => 'Dword'
  }

  #Enable High Performances power plan
  dsc_xpowerplan{'SetPlanHighPerformance':
    dsc_issingleinstance => 'Yes',
    dsc_name => 'High performance'
  }

  #Configure fixed size pagefile
  dsc_xvirtualmemory{'PagefileSettings':
    dsc_type => 'CustomSize',
    dsc_drive => 'C',
    dsc_initialsize => $pagefileSize,
    dsc_maximumsize => $pagefileSize
  }

  #Periodically update WEM cache. Update Cache Wem scheluded task creation
  dsc_xscheduledtask{'UpdateWEMCacheAtStartup':
    dsc_taskname => 'Update WEM cache - Startup',
    dsc_taskpath => '\MyTasks',
    dsc_actionexecutable => '%ProgramFiles(x86)%\Norskale\Norskale Agent Host\AgentCacheUtility.exe',
    dsc_actionarguments => '-refreshcache -debug',
    dsc_scheduletype => 'AtStartup',
    dsc_executiontimelimit => '00:03:00'
    dsc_enable => true,
    dsc_ensure => 'Present'
  }
}

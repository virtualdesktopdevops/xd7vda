class xd7vda::install inherits xd7vda {
  
	#Install dotnet framework
	dsc_windowsfeature{'NET-Framework-Core':
	  dsc_ensure => 'Present',
	  dsc_name   => 'NET-Framework-Core',
	  dsc_includeallsubfeature => true
	}

	dsc_windowsfeature{'NET-Framework-45-Core':
	  dsc_ensure => 'Present',
	  dsc_name   => 'NET-Framework-45-Core',
	  dsc_includeallsubfeature => true
	}
	
	#Remove unneeded features
	dsc_windowsfeature{'FS-SMB1':
	  dsc_ensure => 'Absent',
	  dsc_name   => 'FS-SMB1'
	}
	
	dsc_windowsfeature{'PowerShell-ISE':
	  dsc_ensure => 'Absent',
	  dsc_name   => 'PowerShell-ISE'
	}
	
	dsc_windowsfeature{'XPS-Viewer':
	  dsc_ensure => 'Absent',
	  dsc_name   => 'XPS-Viewer'
	}
  
  #Citrix VDA installation
  dsc_xd7vdafeature{'InstallVdaAgent':
    dsc_role => $vdaRole,
    dsc_sourcepath => $vdaSourcePath,
    dsc_installreceiver => true,
    dsc_enableremoteassistance => $vdaRemoteAssistanceFeature,
    dsc_excludetelemetryservice => true,
    dsc_enablerealtimetransport => true,
    dsc_optimize => true,
    dsc_ensure => 'Present'
  }
  
  #Download and install WEM Agent
  dsc_file{ 'WEMSetupDirectory':
    dsc_destinationpath => 'C:\WEMSetup',
    dsc_type => 'Directory',
    dsc_ensure => 'Present'
  }->
  
  dsc_file{ 'WEMAgentInstaller':
    dsc_sourcepath => $wemAgentSourcePath,
    dsc_destinationpath => 'c:\WEMSetup\WEMAgentInstaller.exe',
    dsc_type => 'File', 
  }->
  
  dsc_package{'WEMInstall':
    dsc_ensure    => 'Present',
    dsc_name      => 'Citrix Workspace Environment Management Agent Host',
    dsc_productid => '922301C1-F669-4327-AA4A-E0965E9E6BA9',
    dsc_arguments => '/S /v"WaitForNetwork=\"1\" GpNetworkStartTimeoutPolicyValue=\"45\"" /q',
    dsc_path      => 'C:\\WEMSetup\\WEMAgentInstaller.exe',
  }
  
  #Install Remote Desktop Services if installing a Session VDA (XenApp)
  if $vdaRole == 'SessionVDA' {
    dsc_windowsfeature{ 'RDSH':
       dsc_ensure => 'Present',
       dsc_name => 'RDS-RD-Server'
    }
  }
  
  #Push BAT optimisation script to run before publishing master image
  file{ "C:\\run-before-publishing-master.bat":
    source => 'puppet:///modules/xd7vda/run-before-publishing-master.bat',
    source_permissions => ignore
  }
}
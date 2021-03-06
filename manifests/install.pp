#Install Citrix VDA, WEM agent, RDS Session host, and optimization script
class xd7vda::install inherits xd7vda {
  #Enable WinRM
  exec {'EnableWinRM':
    command => 'c:\\Windows\\System32\\winrm.cmd quickconfig -quiet'
  }

  # Setting Powershell Execution Policy to unrestricted
->exec { 'Set PowerShell execution policy unrestricted':
    command  => 'Set-ExecutionPolicy Unrestricted',
    unless   => 'if ((Get-ExecutionPolicy -Scope LocalMachine).ToString() -eq "Unrestricted") { exit 0 } else { exit 1 }',
    provider => powershell
  }

  #Citrix VDA installation
->dsc_xd7vdafeature{'InstallVdaAgent':
    dsc_role                    => $xd7vda::vdarole,
    dsc_sourcepath              => $xd7vda::vdasourcepath,
    dsc_installreceiver         => true,
    dsc_enableremoteassistance  => $xd7vda::vdaremoteassistancefeature,
    dsc_excludetelemetryservice => true,
    dsc_enablerealtimetransport => true,
    dsc_optimize                => true,
    dsc_ensure                  => 'Present'
  }

  #Download and install WEM Agent
->dsc_file{ 'WEMSetupDirectory':
    dsc_destinationpath => 'C:\\WEMSetup',
    dsc_type            => 'Directory',
    dsc_ensure          => 'Present'
  }

->dsc_file{ 'WEMAgentInstaller':
    dsc_sourcepath      => $xd7vda::wemagentsourcepath,
    dsc_destinationpath => 'c:\\WEMSetup\\WEMAgentInstaller.exe',
    dsc_type            => 'File',
  }

->dsc_package{'WEMInstall':
    dsc_ensure    => 'Present',
    dsc_name      => 'Citrix Workspace Environment Management Agent Host',
    dsc_productid => $xd7vda::wemproductid,
    dsc_arguments => '/S /v"WaitForNetwork=\"1\" GpNetworkStartTimeoutPolicyValue=\"45\"" /q',
    dsc_path      => 'C:\\WEMSetup\\WEMAgentInstaller.exe',
  }

  #Install Remote Desktop Services if installing a Session VDA (XenApp)
  if $xd7vda::vdarole == 'SessionVDA' {
    dsc_windowsfeature{ 'RDSH':
      dsc_ensure => 'Present',
      dsc_name   => 'RDS-RD-Server',
      #require   => Dsc_xd7vdafeature['InstallVdaAgent']
    }

    dsc_windowsfeature{ 'RSAT-RDS-Licensing-Diagnosis-UI':
      dsc_ensure => 'Present',
      dsc_name   => 'RSAT-RDS-Licensing-Diagnosis-UI',
      #require   => Dsc_xd7vdafeature['InstallVdaAgent']
    }
  }

  #Push BAT optimisation script to run before publishing master image
  file{ "C:\\run-before-publishing-master.bat":
    source             => 'puppet:///modules/xd7vda/run-before-publishing-master.bat',
    source_permissions => ignore
  }
}

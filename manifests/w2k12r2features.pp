#Maage Windows 2012R2 VDA features. Install .NET framework, remove unneeded features.
class xd7vda::w2k12r2features inherits xd7vda {
  if ($facts['osfamily'] == 'windows') and ($facts['os']['release']['full']== '2012 R2') {
    #Install dotnet framework
    dsc_windowsfeature{'NET-Framework-Core':
      dsc_ensure               => 'Present',
      dsc_name                 => 'NET-Framework-Core',
      dsc_includeallsubfeature => true
    }

  ->dsc_windowsfeature{'NET-Framework-45-Core':
      dsc_ensure               => 'Present',
      dsc_name                 => 'NET-Framework-45-Core',
      dsc_includeallsubfeature => true
    }

    #Remove SMB 1.0/CIFS File Sharing Support
    dsc_windowsfeature{'FS-SMB1':
      dsc_ensure => 'Absent',
      dsc_name   => 'FS-SMB1'
    }

    #Remove Windows PowerShell ISE
    dsc_windowsfeature{'PowerShell-ISE':
      dsc_ensure => 'Absent',
      dsc_name   => 'PowerShell-ISE'
    }

    #Remove XPS Viewer
    dsc_windowsfeature{'XPS-Viewer':
      dsc_ensure => 'Absent',
      dsc_name   => 'XPS-Viewer'
    }
  }
}

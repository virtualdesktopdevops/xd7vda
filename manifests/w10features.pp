#Class removing unneeded features for a Desktop VDA
class xd7vda::w10features inherits xd7vda {
  if ($facts['osfamily'] == 'windows') and ($facts['os']['release']['major']==10) {
    #Remove SMB 1.0/CIFS File Sharing Support
    dsc_windowsoptionalfeature{'SMB1Protocol':
      dsc_ensure               => 'disable',
      dsc_name                 => 'SMB1Protocol',
      dsc_nowindowsupdatecheck => true
    }

    #Remove WorkFolders-Client
    dsc_windowsoptionalfeature{'WorkFolders-Client':
      dsc_ensure               => 'disable',
      dsc_name                 => 'WorkFolders-Client',
      dsc_nowindowsupdatecheck => true
    }

    #Remove Printing-XPSServices-Features
    dsc_windowsoptionalfeature{'Printing-XPSServices-Features':
      dsc_ensure               => 'disable',
      dsc_name                 => 'Printing-XPSServices-Features',
      dsc_nowindowsupdatecheck => true
    }

    #Remove Printing-Foundation-InternetPrinting-Client
    dsc_windowsoptionalfeature{'Printing-Foundation-InternetPrinting-Client':
      dsc_ensure               => 'disable',
      dsc_name                 => 'Printing-Foundation-InternetPrinting-Client',
      dsc_nowindowsupdatecheck => true
    }

    #Remove FaxServicesClientPackage
    dsc_windowsoptionalfeature{'FaxServicesClientPackage':
      dsc_ensure               => 'disable',
      dsc_name                 => 'FaxServicesClientPackage',
      dsc_nowindowsupdatecheck => true
    }
  }
}

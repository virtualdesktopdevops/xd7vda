#Class configuring Server VDA registry keys
class xd7vda::w2k12r2registrykeys inherits xd7vda {
  if ($facts['osfamily'] == 'windows') and ($facts['os']['release']['full']== '2012 R2') {
    #DOTNETFRAMEWORKS
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89B4C1CD-B018-4511-B0A1-5476DBF70820}':
      ensure => absent
    }

    #Microsoft Internet Explorer Initializer Setup
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89820200-ECBD-11cf-8B85-00AA005B4383}':
      ensure => absent
    }

    #Microsoft Outlook MailNews Express Setup
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{44BBA840-CC51-11CF-AAFA-00AA00B6015C}':
      ensure => absent
    }

    #Microsoft Windows Media Player 7 earlier Setup
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\>{22d6f312-b0f6-11d0-94ab-0080c74c7e95}':
      ensure => absent
    }

    #Microsoft Windows Media Player 7 or later Setup
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{6BF52A52-394A-11d3-B153-00C04F79FAA6}':
      ensure => absent
    }

    #Themes Setup
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{2C7339CF-2B09-4501-B3F3-F3508C9228ED}':
      ensure => absent
    }

    #Windows Desktop Update Setup
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89820200-ECBD-11cf-8B85-00AA005B4340}':
      ensure => absent
    }

    #Disable default system screensaver
    registry_value { 'HKU\.DEFAULT\Control Panel\Desktop\ScreenSaveActive':
      ensure => present,
      path   => 'HKU\.DEFAULT\Control Panel\Desktop\ScreenSaveActive',
      type   => 'dword',
      data   => '0',
    }

    #Hide hard error messages,
    registry_value { 'HKLM\System\CurrentControlSet\Control\Windows\ErrorMode':
      ensure => present,
      path   =>'HKLM\System\CurrentControlSet\Control\Windows\ErrorMode',
      type   => 'dword',
      data   => '2',
    }

    #Disable NTFS last access timestamps
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\FileSystem\NtfsDisableLastAccessUpdate':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\FileSystem\NtfsDisableLastAccessUpdate',
      type   => 'dword',
      data   => '0',
    }

    #Disable memory dump creation
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\CrashDumpEnabled':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\CrashDumpEnabled',
      type   => 'dword',
      data   => '0',
    }

    #Disable memory dump creation
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\LogEvent':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\LogEvent',
      type   => 'dword',
      data   => '0',
    }

    #Disable memory dump creation
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\SendAlert':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\SendAlert',
      type   => 'dword',
      data   => '0',
    }

    #BootOptimizeFunction registry key
    registry_key { 'HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction':
      ensure => present
    }

    #Disable background disk defragmentation
  ->registry_value { 'HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction\Enable':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction\Enable',
      type   => 'string',
      data   => 'N',
    }

    #OptimalLayout registry key
    registry_key { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout':
      ensure => present
    }

    #Disable background auto-layout
  ->registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout\EnableAutoLayout':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout\EnableAutoLayout',
      type   => 'dword',
      data   => '0',
    }

    #Disable the Windows First Logon Animation
    registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableFirstLogonAnimation':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableFirstLogonAnimation',
      type   => 'dword',
      data   => '0',
    }

    #Increase Disk I/O Timeout to 200 seconds
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Services\Disk\TimeOutValue':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Services\Disk\TimeOutValue',
      type   => 'dword',
      data   => '0x000000C8',
    }

    #Explorer policy registry key
    registry_key { 'HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Policies\Explorer':
      ensure => present
    }

    #Disable CIFS Change Notifications
  ->registry_value { 'HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRemoteRecursiveEvents':
      ensure => present,
      path   => 'HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRemoteRecursiveEvents',
      type   => 'dword',
      data   => '1',
    }

    #Internet Explorer policy registry key
    registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\DisableFirstRunCustomize':
      ensure => present
    }

    #IE Wizard - Disable
  ->registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\DisableFirstRunCustomize':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\DisableFirstRunCustomize',
      type   => 'dword',
      data   => '1',
    }

    #Windows Search registry key
    registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search':
      ensure => present
    }

    #Disable location based info in searches
  ->registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowSearchToUseLocation':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowSearchToUseLocation',
      type   => 'dword',
      data   => '1',
    }

    #Disable Network Location
    registry_value { 'HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff':
      ensure => present,
      path   => 'HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff',
    }

    #Disable TCP/IP Task Offload
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters\DisableTaskOffload':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters\DisableTaskOffload',
      type   => 'dword',
      data   => '1',
    }
  }
}

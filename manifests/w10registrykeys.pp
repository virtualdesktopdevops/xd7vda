#Class configuring Windows 10 Desktop VDA registry keys
class xd7vda::w10registrykeys inherits xd7vda {
  if ($facts['osfamily'] == 'windows') and ($facts['os']['release']['major'] == '10') {
    ##DOTNETFRAMEWORKS
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89B4C1CD-B018-4511-B0A1-5476DBF70820}':
      ensure => absent
    }

    ##Microsoft Internet Explorer Initializer Setup
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89820200-ECBD-11cf-8B85-00AA005B4383}':
      ensure => absent
    }

    ##Microsoft Outlook MailNews Express Setup
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{44BBA840-CC51-11CF-AAFA-00AA00B6015C}':
      ensure => absent
    }

    ##Themes Setup
    registry_key { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{2C7339CF-2B09-4501-B3F3-F3508C9228ED}':
      ensure => absent
    }

    ##Windows Desktop Update Setup
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

    ##Hide hard error messages,
    registry_value { 'HKLM\System\CurrentControlSet\Control\Windows\ErrorMode':
      ensure => present,
      path   =>'HKLM\System\CurrentControlSet\Control\Windows\ErrorMode',
      type   => 'dword',
      data   => '2',
    }

    ##Disable NTFS last access timestamps
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\FileSystem\NtfsDisableLastAccessUpdate':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\FileSystem\NtfsDisableLastAccessUpdate',
      type   => 'dword',
      data   => '0',
    }

    ##Disable memory dump creation
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\CrashDumpEnabled':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\CrashDumpEnabled',
      type   => 'dword',
      data   => '0',
    }

    ##Disable memory dump creation
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\LogEvent':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\LogEvent',
      type   => 'dword',
      data   => '0',
    }

    ##Disable memory dump creation
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\SendAlert':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\SendAlert',
      type   => 'dword',
      data   => '0',
    }

    ##Disable background disk defragmentation
    registry_value { 'HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction\Enable':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction\Enable',
      type   => 'string',
      data   => 'N',
    }

    ##Disable background auto-layout
    registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout\EnableAutoLayout':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout\EnableAutoLayout',
      type   => 'dword',
      data   => '0',
    }

    ##Disable the Windows First Logon Animation
    registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableFirstLogonAnimation':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableFirstLogonAnimation',
      type   => 'dword',
      data   => '0',
    }

    ##Increase Disk I/O Timeout to 200 seconds
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Services\Disk\TimeOutValue':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Services\Disk\TimeOutValue',
      type   => 'dword',
      data   => '0x000000C8',
    }

    ##Disable Logon BackgroundImage
    registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System\DisableLogonBackgroundImage':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System\DisableLogonBackgroundImage',
      type   => 'dword',
      data   => '1',
    }

    ##Explorer policy registry key
    registry_key { 'HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Policies\Explorer':
      ensure => present
    }

    ##Disable CIFS Change Notifications
  ->registry_value { 'HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRemoteRecursiveEvents':
      ensure => present,
      path   => 'HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRemoteRecursiveEvents',
      type   => 'dword',
      data   => '1',
    }

    #Disable customer experience improvement program
    registry_value { 'HKLM\Software\Microsoft\SQMClient\Windows\CEIPEnable':
      ensure => present,
      path   => 'HKLM\Software\Microsoft\SQMClient\Windows\CEIPEnable',
      type   => 'dword',
      data   => '0',
    }

    #Windows Personalization registry key
    registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization':
      ensure => present
    }

    #Disable new lock screen
  ->registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoLockScreen':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoLockScreen',
      type   => 'dword',
      data   => '1',
    }

    #Disable Notification Center
    #registry_value { 'HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\UseActionCenterExperience':
    #  ensure => present,
    #  path => 'HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\UseActionCenterExperience',
    #  type   => 'dword',
    #  #data   => '',
    #}

    #Windows Search registry key
    registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search':
      ensure => present
    }

    #Disable Cortana
  ->registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana',
      type   => 'dword',
      data   => '0',
    }

    #Disable search web when searching pc
  ->registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\ConnectedSearchUseWeb':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\ConnectedSearchUseWeb',
      type   => 'dword',
      data   => '0',
    }

    #Disable Web Search in search bar
  ->registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\DisableWebSearch':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\DisableWebSearch',
      type   => 'dword',
      data   => '1',
    }

    #Disable send settings to cloud
    registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync\DisableSettingSync':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync\DisableSettingSync',
      type   => 'dword',
      data   => '2',
    }

    #Disable using your machine for sending windows updates to others
    registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config\DownloadMode':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config\DownloadMode',
      type   => 'dword',
      data   => '0',
    }

    ##OneDrive registry key creation
    registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive':
      ensure => present
    }

    #Disable synchronizing files to onedrive
  ->registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableFileSyncNGSC':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableFileSyncNGSC',
      type   => 'dword',
      data   => '1',
    }

    #Disable synchronizing files to cloud
    registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync\DisableSettingSyncUserOverride':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync\DisableSettingSyncUserOverride',
      type   => 'dword',
      data   => '1',
    }

    #Disable Telemetry Collection
    registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection\AllowTelemetry':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection\AllowTelemetry',
      type   => 'dword',
      data   => '0',
    }


    ##WindowsStore registry key creation
    registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\WindowsStore':
      ensure => present
    }

    #Disable Windows Store
  ->registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\WindowsStore\RemoveWindowsStore':
      ensure => present,
      path   => 'HKLM\SOFTWARE\Policies\Microsoft\WindowsStore\RemoveWindowsStore',
      type   => 'dword',
      data   => '1',
    }

    ##Disable Network Location
    registry_key { 'HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff':
      ensure => present
    }

    ##Disable TCP/IP Task Offload
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters\DisableTaskOffload':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters\DisableTaskOffload',
      type   => 'dword',
      data   => '1',
    }

    #Registry keys changed by Citrix TargetOSOptimizer tool (https://support.citrix.com/article/CTX125874)
    #Disable Machine Account Password Changes
    registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\DisablePasswordChange':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\DisablePasswordChange',
      type   => 'dword',
      data   => '1',
    }

    #Disable Clear Page File at Shutdown
    registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown',
      type   => 'dword',
      data   => '0',
    }
    #Reduce Internet Explorer Temp File
    registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\Paths':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\Paths',
      type   => 'dword',
      data   => '4',
    }

    registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path1':
    ensure => present
    }

  ->registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path1\CacheLimit':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path1\CacheLimit',
      type   => 'dword',
      data   => '100',
    }

    registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path2':
    ensure => present
    }

  ->registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path2\CacheLimit':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path2\CacheLimit',
      type   => 'dword',
      data   => '100',
    }

    registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path3':
      ensure => present
    }

  ->registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path3\CacheLimit':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path3\CacheLimit',
      type   => 'dword',
      data   => '100',
    }

    registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path4':
      ensure => present
    }

  ->registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path4\CacheLimit':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths\path4\CacheLimit',
      type   => 'dword',
      data   => '100',
    }

    #Disable Move to Recycle Bin
    registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRecycleFiles':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRecycleFiles',
      type   => 'dword',
      data   => '1',
    }

    #Reduce Event Log Size to 64k
    registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Application\MaxSize':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Application\MaxSize',
      type   => 'dword',
      data   => '10000',
    }

    registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security\MaxSize':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security\MaxSize',
      type   => 'dword',
      data   => '10000',
    }

    registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\System\MaxSize':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\System\MaxSize',
      type   => 'dword',
      data   => '10000',
    }

    #Reduce DedicatedDumpFile DumpFileSize to 2MB
    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl\DumpFileSize':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl\DumpFileSize',
      type   => 'dword',
      data   => '2',
    }

    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl\IgnorePagefileSize':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl\IgnorePagefileSize',
      type   => 'dword',
      data   => '1',
    }

    #Disable Offline Files
    registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\NetCache\Enabled':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\NetCache\Enabled',
      type   => 'dword',
      data   => '0',
    }


    #Disable Windows Autoupdate

    #Disable Automatic Update - important for non persistent VMs
    #registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate':
    #  path => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate',
    #  ensure => present,
    #  type   => 'dword',
    #  #data   => '',
    #}

    registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\NoAutoUpdate':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\NoAutoUpdate',
      type   => 'dword',
      data   => '1',
    }

    registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AUOptions':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AUOptions',
      type   => 'dword',
      data   => '1',
    }

    registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\ScheduledInstallDay':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\ScheduledInstallDay',
      type   => 'dword',
      data   => '0',
    }

    registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\ScheduledInstallTime':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\ScheduledInstallTime',
      type   => 'dword',
      data   => '3',
    }

    #Disable Windows Defender through local strategy
    registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender':
      ensure => present
    }

  ->registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware':
      ensure => present,
      path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware',
      type   => 'dword',
      data   => '1',
    }
    #Disabling Notification Center through local strategy
  }
}

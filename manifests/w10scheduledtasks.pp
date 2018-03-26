#Class disabling built-in swheduled tasks unneeded in a Windows 10 Desktop VDA
class xd7vda::w10scheduledtasks inherits xd7vda {
  if ($facts['osfamily'] == 'windows') and ($facts['os']['release']['major']==10) {
    dsc_xscheduledtask{'Office15Heartbeat':
      dsc_taskname => 'Office 15 Subscription Heartbeat',
      dsc_taskpath => '\Microsoft\Office\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'OfficeTelemetryAgentFallBack2016':
      dsc_taskname => 'OfficeTelemetryAgentFallBack2016',
      dsc_taskpath => '\Microsoft\Office\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'OfficeTelemetryAgentLogOn2016':
      dsc_taskname => 'OfficeTelemetryAgentLogOn2016',
      dsc_taskpath => '\Microsoft\Office\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'OfficeTelemetryAgentFallBack':
      dsc_taskname => 'OfficeTelemetryAgentFallBack',
      dsc_taskpath => '\Microsoft\Office\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'OfficeTelemetryAgentLogOn':
      dsc_taskname => 'OfficeTelemetryAgentLogOn',
      dsc_taskpath => '\Microsoft\Office\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'SmartScreenSpecific':
      dsc_taskname => 'SmartScreenSpecific',
      dsc_taskpath => 'Microsoft\Windows\AppID\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'MicrosoftCompatibilityAppraiser':
      dsc_taskname => 'Microsoft Compatibility Appraiser',
      dsc_taskpath => '\Microsoft\Windows\Application Experience\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'ProgramDataUpdater':
      dsc_taskname => 'ProgramDataUpdater',
      dsc_taskpath => '\Microsoft\Windows\Application Experience\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'StartupAppTask':
      dsc_taskname => 'StartupAppTask',
      dsc_taskpath => 'Microsoft\Windows\Application Experience\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'Proxy':
      dsc_taskname => 'Proxy',
      dsc_taskpath => '\Microsoft\Windows\Autochk\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'UninstallDeviceTask':
      dsc_taskname => 'UninstallDeviceTask',
      dsc_taskpath => 'Microsoft\Windows\Bluetooth\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'ProactiveScan':
      dsc_taskname => 'ProactiveScan',
      dsc_taskpath => '\Microsoft\Windows\Chkdsk\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'CreateObjectTask':
      dsc_taskname => 'CreateObjectTask',
      dsc_taskpath => 'Microsoft\Windows\CloudExperienceHost\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'Consolidator':
      dsc_taskname => 'Consolidator',
      dsc_taskpath => '\Microsoft\Windows\Customer Experience Improvement Program\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'KernelCeipTask':
      dsc_taskname => 'KernelCeipTask',
      dsc_taskpath => '\Microsoft\Windows\Customer Experience Improvement Program\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'UsbCeip':
      dsc_taskname => 'UsbCeip',
      dsc_taskpath => '\Microsoft\Windows\Customer Experience Improvement Program\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'ScheduledDefrag':
      dsc_taskname => 'ScheduledDefrag',
      dsc_taskpath => '\Microsoft\Windows\Defrag\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'Scheduled':
      dsc_taskname => 'Scheduled',
      dsc_taskpath => 'Microsoft\Windows\Diagnosis\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'Microsoft-Windows-DiskDiagnosticDataCollector':
      dsc_taskname => 'Microsoft-Windows-DiskDiagnosticDataCollector',
      dsc_taskpath => 'Microsoft\Windows\DiskDiagnostic\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'Microsoft-Windows-DiskDiagnosticResolver':
      dsc_taskname => 'Microsoft-Windows-DiskDiagnosticResolver',
      dsc_taskpath => 'Microsoft\Windows\DiskDiagnostic\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'DmClient':
      dsc_taskname => 'DmClient',
      dsc_taskpath => 'Microsoft\Windows\Feedback\Siuf\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'FileHistory':
      dsc_taskname => 'File History',
      dsc_taskpath => 'Microsoft\Windows\FileHistory\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'Notifications':
      dsc_taskname => 'Notifications',
      dsc_taskpath => 'Microsoft\Windows\Location\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'WinSAT':
      dsc_taskname => 'WinSAT',
      dsc_taskpath => 'Microsoft\Windows\Maintenance\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'MapsToastTask':
      dsc_taskname => 'MapsToastTask',
      dsc_taskpath => 'Microsoft\Windows\Maps\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'MapsUpdateTask':
      dsc_taskname => 'MapsUpdateTask',
      dsc_taskpath => 'Microsoft\Windows\Maps\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'ProcessMemoryDiagnosticEvents':
      dsc_taskname => 'ProcessMemoryDiagnosticEvents',
      dsc_taskpath => 'Microsoft\Windows\MemoryDiagnostic\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'RunFullMemoryDiagnostic':
      dsc_taskname => 'RunFullMemoryDiagnostic',
      dsc_taskpath => 'Microsoft\Windows\MemoryDiagnostic\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'MNOMetadataParse':
      dsc_taskname => 'MNO Metadata Parse',
      dsc_taskpath => 'Microsoft\Windows\Mobile Broadband Accounts\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'AnalyzeSystem':
      dsc_taskname => 'AnalyzeSystem',
      dsc_taskpath => 'Microsoft\Windows\Power Efficiency Diagnostics\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'MobilityManager':
      dsc_taskname => 'MobilityManager',
      dsc_taskpath => 'Microsoft\Windows\Ras\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'RegIdleBackup':
      dsc_taskname => 'RegIdleBackup',
      dsc_taskpath => 'Microsoft\Windows\Registry\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'FamilySafetyMonitor':
      dsc_taskname => 'FamilySafetyMonitor',
      dsc_taskpath => 'Microsoft\Windows\Shell\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'FamilySafetyRefresh':
      dsc_taskname => 'FamilySafetyRefresh',
      dsc_taskpath => 'Microsoft\Windows\Shell\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'SR':
      dsc_taskname => 'SR',
      dsc_taskpath => 'Microsoft\Windows\SystemRestore\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'Tpm-Maintenance':
      dsc_taskname => 'Tpm-Maintenance',
      dsc_taskpath => 'Microsoft\Windows\TPM\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'UPnPHostConfig':
      dsc_taskname => 'UPnPHostConfig',
      dsc_taskpath => 'Microsoft\Windows\UPnP\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'ResolutionHost':
      dsc_taskname => 'ResolutionHost',
      dsc_taskpath => 'Microsoft\Windows\WDI\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'WindowsDefenderCacheMaintenance':
      dsc_taskname => 'Windows Defender Cache Maintenance',
      dsc_taskpath => 'Microsoft\Windows Defender\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'WindowsDefenderCleanup':
      dsc_taskname => 'Windows Defender Cleanup',
      dsc_taskpath => 'Microsoft\Windows Defender\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'WindowsDefenderScheduledScan':
      dsc_taskname => 'Windows Defender Scheduled Scan',
      dsc_taskpath => 'Microsoft\Windows\Windows Defender\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'WindowsDefenderVerification':
      dsc_taskname => 'Windows Defender Verification',
      dsc_taskpath => 'Microsoft\Windows\Windows Defender\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'QueueReporting':
      dsc_taskname => 'QueueReporting',
      dsc_taskpath => 'Microsoft\Windows\Windows Error Reporting\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'BfeonServiceStartTypeChange':
      dsc_taskname => 'BfeonServiceStartTypeChange',
      dsc_taskpath => 'Microsoft\Windows\Windows Filtering Platform\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'UpdateLibrary':
      dsc_taskname => 'UpdateLibrary',
      dsc_taskpath => 'Microsoft\Windows\Windows Media Sharing\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'WIM-Hash-Management':
      dsc_taskname => 'WIM-Hash-Management',
      dsc_taskpath => 'Microsoft\Windows\WOF\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'WIM-Hash-Validation':
      dsc_taskname => 'WIM-Hash-Validation',
      dsc_taskpath => 'Microsoft\Windows\WOF\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'XblGameSaveTask':
      dsc_taskname => 'XblGameSaveTask',
      dsc_taskpath => 'Microsoft\XblGameSave\\',
      dsc_ensure   => 'Absent'
    }

    dsc_xscheduledtask{'XblGameSaveTaskLogon':
      dsc_taskname => 'XblGameSaveTaskLogon',
      dsc_taskpath => 'Microsoft\XblGameSave\\',
      dsc_ensure   => 'Absent'
    }
  }
}

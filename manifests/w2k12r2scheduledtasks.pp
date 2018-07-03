#Class removing built-in scheduled tasks which are useless in a Server VDA environment
class xd7vda::w2k12r2scheduledtasks inherits xd7vda {
  if ($facts['osfamily'] == 'windows') and ($facts['os']['release']['full']== '2012 R2') {
    dsc_xscheduledtask{'Office15Heartbeat':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'Office 15 Subscription Heartbeat',
      dsc_taskpath => '\Microsoft\Office\\'
    }

    dsc_xscheduledtask{'OfficeTelemetryAgentFallBack2016':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'OfficeTelemetryAgentFallBack2016',
      dsc_taskpath => '\Microsoft\Office\\'
    }

    dsc_xscheduledtask{'OfficeTelemetryAgentLogOn2016':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'OfficeTelemetryAgentLogOn2016',
      dsc_taskpath => '\Microsoft\Office\\'
    }

    dsc_xscheduledtask{'OfficeTelemetryAgentFallBack':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'OfficeTelemetryAgentFallBack',
      dsc_taskpath => '\Microsoft\Office\\'
    }

    dsc_xscheduledtask{'OfficeTelemetryAgentLogOn':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'OfficeTelemetryAgentLogOn',
      dsc_taskpath => '\Microsoft\Office\\'
    }

    dsc_xscheduledtask{'MicrosoftCompatibilityAppraiser':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'Microsoft Compatibility Appraiser',
      dsc_taskpath => '\Microsoft\Windows\Application Experience\\'
    }

    dsc_xscheduledtask{'ProgramDataUpdater':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'ProgramDataUpdater',
      dsc_taskpath => '\Microsoft\Windows\Application Experience\\'
    }

    dsc_xscheduledtask{'Proxy':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'Proxy',
      dsc_taskpath => '\Microsoft\Windows\Autochk\\'
    }

    dsc_xscheduledtask{'ProactiveScan':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'ProactiveScan',
      dsc_taskpath => '\Microsoft\Windows\Chkdsk\\'
    }

    dsc_xscheduledtask{'Consolidator':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'Consolidator',
      dsc_taskpath => '\Microsoft\Windows\Customer Experience Improvement Program\\'
    }

    dsc_xscheduledtask{'KernelCeipTask':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'KernelCeipTask',
      dsc_taskpath => '\Microsoft\Windows\Customer Experience Improvement Program\\'
    }

    dsc_xscheduledtask{'UsbCeip':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'UsbCeip',
      dsc_taskpath => '\Microsoft\Windows\Customer Experience Improvement Program\\'
    }

    dsc_xscheduledtask{'ScheduledDefrag':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'ScheduledDefrag',
      dsc_taskpath => '\Microsoft\Windows\Defrag\\'
    }

    dsc_xscheduledtask{'AnalyzeSystem':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'AnalyzeSystem',
      dsc_taskpath => '\Microsoft\Windows\Power Efficiency Diagnostics\\'
    }

    dsc_xscheduledtask{'RegIdleBackup':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'RegIdleBackup',
      dsc_taskpath => '\Microsoft\Windows\Registry\\'
    }

    dsc_xscheduledtask{'ResolutionHost':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'ResolutionHost',
      dsc_taskpath => '\Microsoft\Windows\WDI\\'
    }

    dsc_xscheduledtask{'BfeonServiceStartTypeChange':
      dsc_ensure   => 'Absent',
      dsc_taskname => 'BfeonServiceStartTypeChange',
      dsc_taskpath => '\Microsoft\Windows\Windows Filtering Platform\\'
    }
  }
}

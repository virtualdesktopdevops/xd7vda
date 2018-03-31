#Class configuring network for a Windows 10 Desktop VDA
class xd7vda::w10networkconfig inherits xd7vda {
  if ($facts['osfamily'] == 'windows') and ($facts['os']['release']['major']==10) {
    #Disable NETBIOS
    dsc_xnetbios{'DisableNetBIOS':
      dsc_interfacealias => $facts['interfaces'],
      dsc_setting        => 'Disable'
    }

    #Disable IPV6
    dsc_xnetadapterbinding{'DisableIPv6':
      dsc_interfacealias => $facts['interfaces'],
      dsc_componentid    => 'ms_tcpip6',
      dsc_state          => 'Disabled'
    }
  }
}

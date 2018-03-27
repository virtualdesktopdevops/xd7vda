#Configure Windows 2012R2 VDA network adapter
class xd7vda::w2k12r2networkconfig inherits xd7vda {
  if ($facts['osfamily'] == 'windows') and ($facts['os']['release']['full']== '2012 R2') {
    $facts['networking']['interfaces'].each |$netinterface| {
      #Disable NETBIOS
      dsc_xnetbios{"DisableNetBIOS_${netinterface}":
        dsc_interfacealias => $netinterface,
        dsc_setting        => 'Disable'
      }

      #Disable IPV6
      dsc_xnetadapterbinding{"DisableIPv6_${netinterface}":
        dsc_interfacealias => $netinterface,
        dsc_componentid    => 'ms_tcpip6',
        dsc_state          => 'Disabled'
      }
    }
  }
}

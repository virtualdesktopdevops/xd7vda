class xd7vda::w10networkconfig inherits xd7vda {
  if ($osfamily == 'windows') and ($facts['os']['release']['major']==10) {
	  #Disable NETBIOS
	  dsc_xnetbios{'DisableNetBIOS': 
	    dsc_interfacealias => 'Ethernet',
	    dsc_setting => 'Disable'
	  }
	  
	  #Disable IPV6
	  dsc_xnetadapterbinding{'DisableIPv6':
	    dsc_interfacealias => 'Ethernet',
	    dsc_componentid => 'ms_tcpip6',
	    dsc_state => 'Disabled'
	  }
  }
}
class xd7vda::w2k12r2networkconfig inherits xd7vda {
  if ($osfamily == 'windows') and ($facts['os']['release']['full']== '2012 R2') {
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
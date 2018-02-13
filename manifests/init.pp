# Class: xd7vda
#
# This module manages xd7vda
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class xd7vda (
  $vdaSourcePath,
  $wemAgentSourcePath,
  $wemProductId,
  $vdaRole = 'SessionVDA', # string { DesktopVDA | SessionVDA }
  $vdaRemoteAssistanceFeature = false, #bool true, false
  $deliveryController1,
  $deliveryController2 = '',
  $rdsLicenseServer = 'srv-lic01',
  $pagefileSize = 2048
)

{
  contain xd7vda::install
  contain xd7vda::config
  contain xd7vda::w2k12r2features
  contain xd7vda::w2k12r2disableservices
  contain xd7vda::w2k12r2registrykeys
  contain xd7vda::w2k12r2scheduledtasks
  contain xd7vda::w2k12r2networkconfig
  contain xd7vda::w10features
  contain xd7vda::w10disableservices
  contain xd7vda::w10registrykeys
  contain xd7vda::w10scheduledtasks
  contain xd7vda::w10networkconfig

  Class['::xd7vda::install'] ->
  Class['::xd7vda::config'] ->
  Class['::xd7vda::w10features'] ->
  Class['::xd7vda::w10disableservices'] ->
  Class['::xd7vda::w10registrykeys'] ->
  Class['::xd7vda::w10scheduledtasks'] ->
  Class['::xd7vda::w10networkconfig']

  reboot { 'dsc_reboot':
    when    => pending
  }

}
